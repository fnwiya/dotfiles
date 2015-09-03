for D in `ls $HOME/.anyenv/envs`
do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
done
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH=${PYENV_ROOT}/bin:$PATH
  eval "$(pyenv init -)"
fi
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
