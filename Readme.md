# Neovim config
## Install
```shell
curl 'https://raw.githubusercontent.com/fred-si-conf/dotfiles-neovim/main/install.sh' \
    | sh - \
    && cd "${XDG_CONFIG_HOME:-${HOME}/.config}/nvim" \
    && make install \
    && cd "${OLDPWD}"
```