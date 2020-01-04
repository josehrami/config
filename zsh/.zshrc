# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/go/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/joramirez/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="random"
#Following instructions in: https://gist.github.com/kevin-smets/8568070
POWERLEVEL9K_MODE="awesome-patched"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export GOPATH="$HOME/go"

# Add Visual Studio Code (code)
export PATH="$PATH:$HOME/bin:$HOME/go/bin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

alias vim="nvim"

#kafkacat aliases
alias kcd='kafkacat -b data-dev.factory.tesla.com:31500 -X security.protocol=SSL -X ssl.key.location=/Users/joramirez/.kafka/joramirez.cae.factory.tesla.com.key  -X ssl.certificate.location=/Users/joramirez/.kafka/joramirez.cae.factory.tesla.com.pem -X ssl.ca.location=/Users/joramirez/.kafka/ca_chain.pem'

alias kcp='kafkacat -b data.factory.tesla.com:32500 -X security.protocol=SSL -X ssl.key.location=/Users/joramirez/.kafka/joramirez.cae.factory.tesla.com.key  -X ssl.certificate.location=/Users/joramirez/.kafka/joramirez.cae.factory.tesla.com.pem -X ssl.ca.location=/Users/joramirez/.kafka/ca_chain.pem'

alias gfskcp='kafkacat -b pvg03p1kfkdb02.teslamotors.com:9093 -X security.protocol=SSL -X ssl.key.location=/Users/joramirez/.kafka/gfs/joramirez-cn.dbplatform.tesla.com.key -X ssl.certificate.location=/Users/joramirez/.kafka/gfs/joramirez-cn.dbplatform.tesla.com.crt -X ssl.ca.location=/Users/joramirez/.kafka/gfs/ca_chain'


# -------------------------------------------------------------------------
# Ignition Designer launch helpers
# -------------------------------------------------------------------------
alias igngf3usa="javaws /Users/joramirez/Ignition/designer_ignition-gf3-fr-hmi1-dev.jnlp"
alias igncom="javaws /Users/joramirez/Ignition/designer_ignition_commons.jnlp"
alias ignstd="javaws /Users/joramirez/Ignition/designer_ignition-hmi-template.jnlp"
alias igngf3paint="javaws /Users/joramirez/Ignition/designer_ignition-gfs-paint-hmi1-dev.jnlp"
alias igngf3paintscada="javaws /Users/joramirez/Ignition/designer_ignition-gfs-paint-scada1-dev.jnlp"




# -------------------------------------------------------------------------
# Application Start Helpers
# -------------------------------------------------------------------------
alias smstart="go run /Users/joramirez/go/src/stash.teslamotors.com/cas/skidmanager/cmd/skidmanager/main.go server start"


# -------------------------------------------------------------------------
# Source artifactory
source /Users/joramirez/.atf/.artifactory

# -------------------------------------------------------------------------
# Vault config
# -------------------------------------------------------------------------

export VAULT_ADDR=https://qts-pe-prod-vault.teslamotors.com:8200
export VAULT_CACERT=/Users/joramirez/vault/corp_root_ca.pem




# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f $HOME/.project_paths ] && source $HOME/.project_paths
[ -f $HOME/.kube/.aliases ] && source $HOME/.kube/.aliases

