# 🛠️ Developer Tool Kit

<p align="center">
  <img src="https://img.shields.io/badge/Language-Bash-orange?style=for-the-badge&logo=gnubash" />
  <img src="https://img.shields.io/badge/Platform-macOS%20%7C%20Linux-blue?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Version-1.0.0-green?style=for-the-badge" />
</p>

**Developer Tool Kit** is a collection of five practical UNIX shell scripts developed to simplify everyday tasks performed by developers.

The project focuses on command-line automation, reducing repetitive manual work and improving productivity through simple, reusable shell utilities.

From setting up a development environment and interacting with AI to automating Git operations, viewing directory structures and managing daily tasks, the toolkit brings multiple developer utilities together in one place.

## ✨ Key Features

| Tool | Description |
|---|---|
| **Setup** | Automatically creates a Python virtual environment and provides options to install development and Machine Learning libraries. |
| **GPT** | A terminal-based AI assistant powered by the Google Gemini API. |
| **MyTree** | Displays a coloured directory structure with a marker for the current location. |
| **Gish** | Simplifies Git operations by automating add, commit and push commands. |
| **Todo** | A lightweight task manager that stores tasks locally and tracks their completion status. |

## 🧰 Technologies Used

- **Bash / Shell Scripting** – Automation and command-line utilities.
- **Python & pip** – Virtual environment and package management.
- **Google Gemini API** – AI-powered terminal assistant.
- **Git & GitHub** – Version control and repository management.
- **curl** – HTTP requests to the Gemini API.
- **jq** – Processing JSON API responses.
- **Terminal-based interface** – Used by the current Todo Manager.

## 📂 Project Structure

```text
Developer-Tool-Kit/
│
├── setup           # Development environment setup
├── gpt             # Terminal AI assistant
├── ai_helper.sh    # Shared AI API helper
├── mytree          # Directory structure viewer
├── gish            # Git automation utility
├── todo            # Task management utility
├── README.md       # Project documentation
├── LICENSE         # Project license
└── .gitignore      # Ignored local files
```

## ⚙️ Installation & Setup

### Prerequisites

- macOS or Ubuntu/Debian Linux
- Bash shell
- Python 3 and pip
- Git
- curl
- jq
- Homebrew (macOS, for automatic installation)
- sudo privileges (Linux, for package installation)
### 1. Clone the Repository

```bash
git clone https://github.com/mahakkatahara/Developer-Tool-Kit.git
```

Navigate to the project directory:

```bash
cd Developer-Tool-Kit
```

### 2. Provide Execution Permissions

```bash
chmod +x setup gpt mytree gish todo ai_helper.sh
```

### 3. Install Dependencies

Run the setup script:

```bash
./setup
```

The script creates a Python virtual environment and provides optional installation of:

- NumPy
- Pandas
- Matplotlib
- Seaborn
- Scikit-learn
- SciPy
- Jupyter Notebook
- JupyterLab
- Git
- Visual Studio Code

### 4. Activate the Virtual Environment

```bash
source venv/bin/activate
```

To deactivate:

```bash
deactivate
```

## 🚀 Usage Guide

### 1. Environment Setup – `setup`

Creates and configures a Python development environment.

```bash
./setup
```

Follow the interactive prompts to select the packages and tools you want to install.

### 2. AI Assistant – `gpt`

Interact with Google's Gemini AI directly from the terminal.

First, obtain an API key from [Google AI Studio](https://aistudio.google.com/apikey).

Set the API key:

```bash
export GEMINI_API_KEY="YOUR_API_KEY"
```

Ask a question:

```bash
./gpt "Explain pointers in C++"
```

The assistant processes the prompt using the Gemini API and displays the response in the terminal.

### 3. Directory Viewer – `mytree`

Displays the directory structure with coloured file and folder names.

```bash
./mytree
```

Run it from the directory you want to inspect.

### 4. Git Automation – `gish`

Automates the basic Git workflow.

```bash
./gish
```

The script:

1. Requests a commit message.
2. Uses a default message if none is provided.
3. Stages the changes using `git add .`.
4. Creates a Git commit.
5. Pushes the commit to the configured remote repository.

**Note:** Run this script inside a configured Git repository. Review your changes before execution because it stages all files in the current directory.

### 5. Task Manager – `todo`

A simple file-based task management utility.

**Initialize the task manager:**

```bash
./todo init
```

**Add a new task:**

```bash
./todo "Complete Unix assignment"
```

**Display all tasks:**

```bash
./todo display
```

**Mark a task as completed:**

```bash
./todo done 1
```

Tasks are stored locally in the `.todo` directory.

## 🔐 Security & Configuration

- Keep your Gemini API key private.
- Do not upload API keys or credentials to GitHub.
- The `.gitignore` file excludes local virtual environments, temporary Jupyter files and task data.
- Use `gish` carefully and review staged changes before pushing.

## 🔮 Future Scope

The project can be extended with:

- Support for additional Linux distributions beyond Ubuntu/Debian.
- More developer productivity shell utilities.
- Improved error handling and input validation.
- Enhanced terminal interfaces and customization.
- Additional automation for development workflows.

## 📄 License

This project is distributed under the license included in the repository. See [LICENSE](LICENSE) for details.

## 👥 Contributors

Developed as a collaborative Unix Programming project by the team members of **Batch F7, JIIT Noida**.

---

<p align="center">
  <b>Developer Tool Kit</b><br/>
  Making everyday developer tasks simpler, faster and more efficient.
</p>
