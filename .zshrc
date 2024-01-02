# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='nvim'
fi

# I you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
autoload -Uz promptinit
promptinit
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_BEEP


# remove duplicate entries from $PATH
# zsh uses $path array along with $PATH 
typeset -U PATH path


bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


# Tmux
ZSH_TMUX_AUTOSTART=false
ZSH_TMUX_AUTOSTART_ONCE=true
ZSH_TMUX_AUTOCONNECT=true
ZSH_TMUX_FIXTERM_WITH_256COLOR=xterm-256color
ZSH_TMUX_DEFAULT_SESSION_NAME=macos
ZSH_TMUX_UNICODE=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic" # set by `omz`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="false"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="false"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=15

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="false"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ansible extract perms systemadmin npm pip rsync yarn brew composer docker docker-compose golang zsh-completions wp-cli macos universalarchive tmux doctl pnpm git-extras colored-man-pages httpie pyenv python git-flow-avh)

autoload -U compinit && compinit


source $ZSH/oh-my-zsh.sh


# You may need to manually set your language environment
# export LANG=en_US.UTF-8
# eval "$(pyenv init --path)"


function msf_docker() {
   if [ -z "$(docker network ls | grep -w msf)" ];
   then
       docker network create --subnet=172.18.0.0/16 msf
   fi
   if [ -z "$(docker ps -a | grep -w postgres)" ];
   then
       docker run --ip 172.18.0.2 --network msf --rm --name postgres -v "${HOME}/.msf4/database:/var/lib/postgresql/data" -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=msf -d postgres:11-alpine
   fi
   docker run --rm -it -u 0 --network msf --name msf --ip 172.18.0.3 -v "${HOME}/.msf4:/home/msf/.msf4" -p 8443-8500:8443-8500 tleemcjr/metasploitable2
 }

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

[[ -e "/Users/vasilsokolik/lib/oci_autocomplete.sh" ]] && source "/Users/vasilsokolik/lib/oci_autocomplete.sh"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
