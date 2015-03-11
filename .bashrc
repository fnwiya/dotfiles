if which pyenv > /dev/null; then
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH=${PYENV_ROOT}/shims:${PATH}
    eval "$(pyenv init -)";
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
