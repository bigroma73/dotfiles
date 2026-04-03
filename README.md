# Dotfiles

This repository contains a simple cross-platform setup for:

- `zsh` + `oh-my-zsh`
- `powerlevel10k`
- `vim`
- a few modern CLI tools (`eza`, `ripgrep`, `fd`, `bat`, `fzf`)

# Dotfiles

Zsh + Vim setup for Debian 13 and macOS.

- per-user (no system-wide configs)
- Docker CE only (no docker.io)
- single setup flow for both Linux and macOS

---

## 🚀 Setup (copy & run)

```bash
# --- Detect OS ---
OS="$(uname -s)"

# --- Install base tools ---
if [ "$OS" = "Linux" ]; then
  sudo apt update
  sudo apt install -y git curl zsh fzf ripgrep fd-find bat ca-certificates gnupg

elif [ "$OS" = "Darwin" ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install zsh eza fzf ripgrep fd bat
fi

# --- Install Docker CE (Linux only) ---
if [ "$OS" = "Linux" ]; then
  sudo install -m 0755 -d /etc/apt/keyrings

  curl -fsSL https://download.docker.com/linux/debian/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo $VERSION_CODENAME) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt update

  sudo apt install -y \
    docker-ce docker-ce-cli containerd.io \
    docker-buildx-plugin docker-compose-plugin
fi

# --- Install Oh My Zsh ---
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# --- Install plugins ---
git clone https://github.com/zsh-users/zsh-autosuggestions \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# --- Install Powerlevel10k ---
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k

# --- Clone dotfiles ---
git clone <your-repo> ~/dotfiles

mkdir -p ~/.config/zsh

ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/aliases.zsh ~/.config/zsh/aliases.zsh
ln -sf ~/dotfiles/zsh/linux.zsh ~/.config/zsh/linux.zsh
ln -sf ~/dotfiles/zsh/macos.zsh ~/.config/zsh/macos.zsh

ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc

ln -sf ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# --- Reload shell ---
source ~/.zshrc





The structure is split into:

```text
zsh/
  .zshrc
  aliases.zsh
  linux.zsh
  macos.zsh
vim/
  .vimrc
```

## Debian 13 packages

Install the base packages:

```bash
sudo apt update
sudo apt install -y \
  zsh git curl vim \
  eza fzf ripgrep fd-find bat \
  docker.io
```

If you do not use Docker on this host, you can skip `docker.io`.

### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Oh My Zsh plugins

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Install Powerlevel10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

## macOS / Homebrew packages

Install the packages:

```bash
brew install zsh git curl vim eza fzf ripgrep fd bat
```

If you want Docker CLI aliases to be useful on macOS, install Docker Desktop separately.

### Install Oh My Zsh

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Oh My Zsh plugins

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Install Powerlevel10k

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

## Suggested symlinks

Create the target directory first:

```bash
mkdir -p ~/.config/zsh
```

Then create symlinks:

```bash
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/zsh/aliases.zsh ~/.config/zsh/aliases.zsh
ln -sf ~/dotfiles/zsh/linux.zsh ~/.config/zsh/linux.zsh
ln -sf ~/dotfiles/zsh/macos.zsh ~/.config/zsh/macos.zsh
ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
```

You do not need both `linux.zsh` and `macos.zsh` on the same machine, but keeping both in the repo is fine.

## Notes

- On Debian, `fd` is exposed as `fdfind`, and `bat` is exposed as `batcat`.
- On macOS, the commands are `fd` and `bat`.
- `fzf` shell integration is sourced from OS-specific paths in `linux.zsh` and `macos.zsh`.
- If `ls` completion ever feels weird because of the `eza` alias, remove the `ls` alias and keep only `ll`, `la`, and `lt`.

## Reload shell config

```bash
source ~/.zshrc
```

## Optional

If `zsh` is not your default shell yet:

```bash
chsh -s "$(which zsh)"
```
