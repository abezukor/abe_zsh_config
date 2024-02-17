#!/usr/bin/env bash
set -eu

REPO_URL=https://abezukor.github.io/abe_zsh_config


if ! command -v zsh &> /dev/null
then
    echo "ZSH Not installed, Please install first"
fi

if ! command -v git &> /dev/null
then
    echo "git Not installed, Please install first. "
fi

echo "Installing Oh My Zsh"
export RUNZSH=no
export CHSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Getting My zshrc"
curl -sSf $REPO_URL/zshrc > ~/.zshrc
#chsh -s /bin/zsh