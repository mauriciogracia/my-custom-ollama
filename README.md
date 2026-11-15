# My Custom Ollama

A tailored build of [Ollama](https://github.com/ollama/ollama) that introduces native, dynamic shell autocompletion for model names.

This fork eliminates the need to manually type full model names or check your installed list by integrating directly with your shell (Bash/Zsh) to provide real-time model suggestions via the `TAB` key.

## Features

- **Dynamic Model Autocompletion:** Hit `TAB` to auto-complete local model names.
- **Native Shell Integration:** Powered by Cobra's native completion engine—no hacky aliases or manual Bash wrappers required.
- **Zero-Config Installer:** Includes a standalone installation script to configure the OS environment automatically.

## Supported Commands

Model name autocompletion is fully enabled for the following subcommands:

- `run`
- `stop`
- `rm`
- `show`
- `cp`
- `push`
- `pull`

## Installation

### 1. Build the Binary

Compile your custom version and replace the original binary (or use your deployment script):

```bash
go build -o ollama .
sudo mv ollama /usr/local/bin/ollama
```

### 2. Enable Autocompletion

Run the included setup script to configure your shell's completion directories. The script automatically detects and supports **Bash** and **Zsh**:

```bash
chmod +x install-completion.sh
./install-completion.sh
```

### 3. Reload Your Shell

Apply the changes immediately to your current terminal session:

```bash
exec $SHELL
```

## Usage

Simply type an Ollama command and press `TAB`.

```bash
# Autocompletes to: deepseek-r1 (or any matching local model)
ollama run d<TAB>

# Lists all currently installed models to remove
ollama rm <TAB>

# Lists all running models to stop
ollama stop <TAB>
```
