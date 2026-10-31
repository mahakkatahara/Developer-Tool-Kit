#!/bin/bash

if [[ -z "${GEMINI_API_KEY:-}" ]]; then
    echo "Error: GEMINI_API_KEY is not set!"
    exit 1
fi

call_ai() {
    local prompt="$1"
    local extra_prompt="(Respond briefly and clearly.)"
    local payload response http_code body

    payload=$(jq -n \
        --arg text "$prompt $extra_prompt" \
        '{contents: [{parts: [{text: $text}]}]}')

    echo "Connecting to Gemini AI..."

    if ! response=$(curl -sS -w '\n%{http_code}' \
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-3.8-flash:generateContent" \
        -H "x-goog-api-key: $GEMINI_API_KEY" \
        -H "Content-Type: application/json" \
        -X POST \
        -d "$payload"); then
        echo "Error: Unable to connect to Gemini API."
        return 1
    fi

    http_code=$(printf '%s\n' "$response" | tail -n 1)
    body=$(printf '%s\n' "$response" | sed '$d')

    if [[ "$http_code" == "200" ]]; then
        echo "$body" | jq -r '.candidates[0].content.parts[0].text // "No response generated."'
    else
        echo "Gemini API Error (HTTP $http_code):"
        echo "$body" | jq -r '.error.message // "Unknown API error"'
        return 1
    fi
}