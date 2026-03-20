# Kuruntu

Personal dotfiles for a custom development environment on Ubuntu, inspired by [Omakub](https://github.com/basecamp/omakub) from DHH.

## Installation

```bash
wget -qO- https://raw.githubusercontent.com/Luidooo/kuruntu/refs/heads/main/init.sh | bash
```

The script clones the repository to `~/.local/share/kuruntu` and sets up the environment.

## Interactive Installer

The installer uses `gum` to provide category-based selection menus:

*   **Editors:** Neovim, Vim
*   **Terminal:** Bash, btop, fonts, Nerd Icons, mise, gcc, unzip
*   **Languages:** Ruby, Node, Python, Rust, Go, Java, PHP, .NET, Swift, TypeScript
*   **Development:** Docker, KVM
*   **Applications:** Chrome

## Structure

```
dots/           # Dotfiles (bash, nvim, vim)
install/
  editors/      # Editor install scripts
  terminal/     # Terminal tools
  languages/    # Programming languages
  development/  # Development tools
  applications/ # Applications
utils/          # Utilities (menus, links, environment variables)
init.sh         # Bootstrap script
```

## Testing with Docker

```bash
docker run -it --rm ubuntu:latest /bin/bash
apt update && apt install -y git wget
wget -qO- https://raw.githubusercontent.com/Luidooo/kuruntu/refs/heads/main/init.sh | bash
```

## License

MIT
