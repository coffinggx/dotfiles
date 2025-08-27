# 🛠️ Dotfiles

My personal dotfiles and configs for a minimal, fast, and customized Linux setup.  
This repository contains configurations for both **i3** and **Hyprland**, along with my daily driver tools.

## ✨ Features

- **Window Managers**: i3, Hyprland
- **Terminal Emulators**: Alacritty, Kitty
- **Editor**: Neovim (with plugins and custom mappings)
- **Status Bar**: Waybar (for Hyprland), i3status / polybar alternative (for i3)
- **App Launcher**: Rofi (with custom theme)
- **System Info**: Fastfetch
- **Multiplexer**: Tmux (custom keybinds & theme)

## 📂 Structure

```
.
├── i3/          # i3 WM configs
├── hypr/        # Hyprland configs
├── nvim/        # Neovim setup (lua, plugins, keymaps)
├── waybar/      # Waybar themes & modules
├── alacritty/   # Alacritty config
├── kitty/       # Kitty config
├── rofi/        # Rofi themes
├── tmux/        # Tmux config
└── fastfetch/   # Fastfetch config
```

## 🚀 Usage

Clone the repo:

```bash
git clone https://github.com/bladex404/dotfiles.git ~/.dotfiles
```

Symlink the configs (example with GNU stow):

```bash
cd ~/.dotfiles
stow i3 hypr nvim waybar alacritty kitty rofi tmux fastfetch
```

## 🖥️ System

- OS: Arch Linux 🐧
- WM/DE: i3 & Hyprland
- Shell: zsh
- GPU: NVIDIA
- RAM: 16G

---
