

# Added by Toolbox App
# export PATH="$PATH:/usr/local/bin"


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


if [ "$(uname -p)" = "i386" ]; then
  echo "Running in i386 mode (Rosetta)"
  eval "$(/usr/local/homebrew/bin/brew shellenv)"
  alias brew='/usr/local/homebrew/bin/brew'
else
  echo "Running in ARM mode (M3)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias brew='/opt/homebrew/bin/brew'
fi


# Created by `pipx` on 2024-01-07 18:56:44
export PATH="$PATH:/Users/vasilsokolik/.local/bin"
