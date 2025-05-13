# Dotfiles

## Prerequisites

### Enable development

Working Apple ID is required.

```zsh
xcode-select --install
```

### Install home brew

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Clone the repository

```zsh
git clone git@github.com:matejcerny/dotfiles.git
```

## Symlink the dotfiles using stow

```zsh
stow .
```

## Enable touch id in the terminal

```zsh
sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
sudo nvim /etc/pam.d/sudo_local
```

## Install all the apps

```zsh
brew bundle
```

