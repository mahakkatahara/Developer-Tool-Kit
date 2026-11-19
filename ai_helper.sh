#!/bin/bash

call_ai() {
    local prompt="$1"

    if [ -z "$GEMINI_API_KEY" ]; then
        echo "Error: GEMINI_API_KEY is not set!"
        return 1
    fi

    if [ -z "$prompt" ]; then
        echo "Usage: ./gpt \"Your question here\""
        return 1
    fi

    echo "Connecting to Gemini AI..."

    local payload
    payload=$(jq -n \
        --arg prompt "$prompt" \
        '{model: "gemini-3.8-flash", input: $prompt}')

    local response

    if ! response=$(curl -sS \
        --connect-timeout 10 \
        --max-time 60 \
        -w '\n%{http_code}' \
        -X POST "https://generativelanguage.googleapis.com/v1beta/interactions" \
        -H "x-goog-api-key: $GEMINI_API_KEY" \
        -H "Content-Type: application/json" \
        -d "$payload"); then
        echo "Error: Unable to connect to Gemini API."
        return 1
    fi

    local http_code="${response##*$'\n'}"
    local body="${response%$'\n'*}"

    if [ "$http_code" = "200" ]; then
        echo "$body" | jq -r '
            [.steps[]? |
             select(.type == "model_output") |
             .content[]?.text] |
            if length > 0 then join("\n") else "No response text" end
        '
    else
        echo "Gemini API Error (HTTP $http_code):"
        echo "$body" | jq -r '.error.message // "Unknown error"'
        return 1
    fi
}
