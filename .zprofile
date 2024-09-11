[[ -e "$HOME/.zprofile.local" ]] && \. "$HOME/.zprofile.local"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi


. "$HOME/.cargo/env"

# Homebrew security options
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha
export HOMEBREW_PHYSICAL_PROCESSOR="amd64"
export HOMEBREW_PREFIX=/opt/homebrew


export GPG_TTY=`tty`
export GOPATH=$HOME/go

export LANG="en_US.UTF-8"
export LC_ADDRESS=${LANG}
export LC_ALL=${LANG}
export LC_COLLATE=${LANG}
export LC_CTYPE=${LANG}
export LC_IDENTIFICATION=${LANG}
export LC_MEASUREMENT=${LANG}
export LC_MESSAGES=${LANG}
export LC_MONETARY=${LANG}
export LC_NAME=${LANG}
export LC_PAPER=${LANG}
export LC_TELEPHONE=${LANG}
export LC_TIME=${LANG}

export TERM=xterm-256color


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"


# Seamlessly manage your app’s Ruby environment with rbenv. https://github.com/rbenv/rbenv
eval "$(rbenv init - zsh)"


echo "Running in ARM mode (M3)"
eval "$(/opt/homebrew/bin/brew shellenv)"
alias brew='/opt/homebrew/bin/brew'


# openssl lib config
# @see https://parsinta.com/articles/setup-php-swoole-in-your-mac-os

export LDFLAGS="-L${HOMEBREW_PREFIX}/opt/llvm/lib"
export CPPFLAGS="-I${HOMEBREW_PREFIX}/opt/llvm/include"

export XDG_CONFIG_HOME="$HOME/.config"
export LOCAL_DIR=$HOME/.local

# ZSH ENV

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$XDG_CONFIG_HOME/zsh/custom"

# phive ENV
export PHIVE_HOME="$HOME/.phive"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


#export MANPATH="/usr/local/man:$MANPATH"
# export PHP_CS_FIXER_IGNORE_ENV=true


# pipx ENV variables

export PIPX_HOME="$LOCAL_DIR/pipx"
export PIPX_BIN_DIR="$LOCAL_DIR/bin"
export PIPX_MAN_DIR="$LOCAL_DIR/share/man"
export PIPX_SHARED_LIBS="$LOCAL_DIR/pipx/shared"
export PIPX_LOCAL_VENVS="$LOCAL_DIR/pipx/venvs"
export PIPX_LOG_DIR="$LOCAL_DIR/pipx/log"
export PIPX_TRASH_DIR="$LOCAL_DIR/pipx/trash"
export PIPX_VENV_CACHEDIR="$HOME/.cache/pipx"
#export PIPX_DEFAULT_PYTHON=/usr/local/bin/python3
export POETRY_VIRTUALENVS_PREFER_ACTIVE_PYTHON=true
USE_EMOJI=true



export ZPLUG_HOME=$HOMEBREW_PREFIX/opt/zplug
source $ZPLUG_HOME/init.zsh
[ -s $ZPLUG_HOME/init.zsh ] && source $ZPLUG_HOME/init.zsh


# poetry config ENV
export POETRY_CACHE_DIR="$HOME/.cache/pypoetry"
export POETRY_HOME="$LOCAL_DIR/poetry"
export POETRY_DATA_DIR="$LOCAL_DIR/share/poetry"
export POETRY_INSTALLER_MODERN_INSTALLATION=true
export POETRY_INSTALLER_PARALLEL=true
export POETRY_VIRTUALENVS_IN_PROJECT=false
export POETRY_VIRTUALENVS_OPTIONS_SYSTEM_SITE_PACKAGES=false


# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"  # This loads nvm



PATH_ARRAY=(
  /usr/local/sbin
   $HOME/.composer/vendor/bin
   $GOPATH/bin
   $HOME/.cargo/bin
   $LOCAL_DIR/bin
   $PYENV_ROOT/bin
   $GOPATH/bin
)

PATH_ARRAY_PREPEND=(
# /usr/local/opt/python/libexec/bin
# /usr/local/opt/openssl@3/bin
/opt/homebrew/opt/llvm/bin
$HOME/.pyenv/bin
/opt/homebrew/opt/mysql@8.0/bin
)

for p in "${PATH_ARRAY[@]}"
do
   export PATH="${PATH}:${p}"
done


for p in "${PATH_ARRAY_PREPEND[@]}"
do
  export PATH="${p}:${PATH}"
done

