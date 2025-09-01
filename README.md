# My Dotfiles

My personal dotfiles for a customized development environment, inspired by DHH's Omakub.

## Features

*   **Shell:** Customized bash environment with useful aliases and functions.
*   **Editors:** Pre-configured Neovim and Vim setups with plugins and settings for an enhanced coding experience.
*   **Interactive Installer:** A menu-driven installer using `gum` to select which tools to install.

## Installation

1.  Download the initialization script and run (replace `<url>` with the raw file URL):
    ```bash
    wget <url> -O | bash
    ```
    ```bash
    ```

## Interactive Installer

The installer provides a menu-based interface to set up your environment. You can navigate through the following categories:

*   **Editors:** Choose to install and configure Neovim and/or Vim.
*   **Programming Languages:** Install and manage versions of Ruby, Node, and Rust using `mise`.
*   **Web Development Tools:** Install tools like Docker and Postman.
*   **Databases:** Set up databases like MySQL, PostgreSQL, and Redis.

You can select multiple items within each submenu to install them in one go.

## Structure

The repository is organized as follows:

*   `dots/`: Contains the dotfiles for various applications (`bash`,`nvim`, etc.).
*   `install/`: Contains modular installation scripts categorized into `editors`, `languages`, `web`, and `databases`.
*   `utils/`: Contains utility scripts, including the main `installer.sh`.
*   `init.sh`: The main script to initialize the dotfiles setup.

## Testing

The installation scripts are designed to be idempotent, meaning they can be run multiple times without causing issues. However, to ensure a clean and safe test, it is highly recommended to use a containerized environment.

### Using Docker for Testing

1.  Build a Docker image from a base OS (e.g., Ubuntu):
    ```bash
    docker run -it --rm ubuntu:latest /bin/bash
    ```
2.  Inside the container, install necessary dependencies like `git` and `wget`:
    ```bash
    apt update && apt install -y git wget
    ```
3.  Clone your dotfiles repository and run the installer:
    ```bash
    git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    bash init.sh
    ```
This allows you to test the entire installation process in an isolated environment without affecting your main system.

## Customization

To customize the dotfiles, you can modify the files in the `dots/` directory. To add or change an installation script, modify the corresponding file in the `install/` directory.

## Screenshots

*(Add screenshots of your desktop setup here)*

## Contributing

Contributions are welcome! If you have any suggestions or improvements, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License.


# TODO: 
  - arrumar zellij
  - configurar o zellij
  - arrumar o run_install
  - selecionar quais vão vir pre selecionados
  - arrumar thema do gnome (cor e plano de fundo)
  - atalhos de print
  - atalhos caps lock
  - configurar gerenciador de senhas
