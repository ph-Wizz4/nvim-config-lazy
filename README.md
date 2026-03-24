# Neovim Configuration

This repository contains my personal Neovim configuration. It's tailored to my workflow, but feel free to explore, adapt, or use it as inspiration for your own setup.

## Prerequisites

- Neovim (version 0.11.6 or higher recommended)
- Git (to clone this repository)

## Project Structure

```
lua/
├── core/       # Core settings (options, keymaps, highlights)
├── config/     # Plugin configurations (LSP, treesitter, telescope, etc.)
└── plugins/    # Plugin specs for lazy.nvim
```

### Directories

| Directory | Description |
|-----------|-------------|
| `lua/core/` | Base Neovim settings: options, keybindings, highlights |
| `lua/config/` | Plugin-specific configurations |
| `lua/plugins/` | Plugin specifications using lazy.nvim |

## Installation

### Quick Setup

```shell
git clone git@github.com:ph-Wizz4/nvim-config-lazy.git
cd nvim-config-lazy
./setup.sh
```

The setup script will:
1. Verify Neovim is installed
2. Warn if existing config will be overwritten
3. Create a symlink at `~/.config/nvim`

### Manual Setup

```shell
git clone git@github.com:ph-Wizz4/nvim-config-lazy.git ~/.config/nvim
```

> [!NOTE]  
> This config integrates with `lazy.nvim`. Plugins will be installed automatically on first launch.

## Setup

### Required Variables

Set the following environment variables if needed:

```shell
OBSIDIAN_VAULT    # Path to your Obsidian vault
JS_DEBUG_HOME     # Path to JavaScript debug configuration
```

### Custom Target

To install to a custom location:

```shell
./setup.sh custom-nvim    # → ~/.config/custom-nvim
```

## Usage

After installation, restart Neovim or run:

```shell
nvim
```

On first launch, lazy.nvim will automatically install all configured plugins.
