#!/usr/bin/env sh

REPOSITORIES_ROOT="git@github.com:fred-si-conf"

CONFIG_DIRECTORY="${XDG_CONFIG_HOME:-${HOME}/.config}"
NEOVIM_DIRECTORY="${CONFIG_DIRECTORY}/nvim"

error() {
    echo "Error: $1" > /dev/stderr
    exit "${2:-1}"
}

if [ -e "${NEOVIM_DIRECTORY}" ]; then
    error "directory ${NEOVIM_DIRECTORY} already exists"
fi

if ! which git > /dev/null 2>&1; then
    error "Git dependency not found"
fi

git clone "${REPOSITORIES_ROOT}/dotfiles-neovim.git" "${NEOVIM_DIRECTORY}"
git clone "${REPOSITORIES_ROOT}/skeleton.git" "${NEOVIM_DIRECTORY}/skeleton"
