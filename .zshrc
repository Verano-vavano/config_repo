# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)

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

function cgrep () {
	cat * | grep -R $1
	return $?
}

function gphm () {
	git push $1 HEAD:main
	return $?
}

function try_patch () {
	patch --dry-run <$1
}

function find_root () {
	find / -name $1 2>/dev/null
}

PATH+=:~/.local/bin

alias cdr="while [ ! -d .git -a `pwd` != $(echo ~) -a `pwd` != '/' ]; do; cd ..; done"
alias cdp="cd ~/Desktop"
alias cdp3="cdp; cd Cercle_3"
alias cdp4="cdp; cd Cercle_4"
alias cdp5="cdp; cd Cercle_5"
alias cdp6="cdp; cd Cercle_6"
alias sourcezsh="source ~/.zshrc"
alias gccw="gcc -Wall -Wextra -Werror -I includes/ srcs/*.c"
alias wcl="wc -l"
alias valg="valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=valgrind-out.txt"
alias vv="vim valgrind-out.txt"
alias sl="echo wrong; sl; ls"
alias kys="echo \"that is not very nice ;(\""
alias ks="echo \"you meant ls ?\"; ls"
alias "cd.."="cd .."
alias cds="cd srcs"
alias cdm="cd mandatory"
alias cdc="cd classes"
alias cdb="cd bonus"
alias cdi="cd includes"
alias cdsc="cds; cdc"
alias cdrs="cdr; cds"
alias cdsci="cdsc; cdi"
alias cdg="cd $(git rev-parse --show-toplevel)"
alias norm=norminette
alias gp="git push"
alias gph="git push && git push hub"
alias gps="git push && git push school"
alias gpsh="git push shrt"
alias gplsh="git pull shrt"
alias v='vim'
alias rmv='rm -f valgrind*'
alias rmrf='rm -rf'
alias vimr="vim -M"
alias cleaks='cat valgrind-out.txt | grep "definitely lost\|indirectly lost" | awk "{\$4 != 0}"'
alias cl=cleaks
alias clsum='cat valgrind-out.txt | grep "definitely lost\|indirectly lost" | awk "\$4 != 0 {print}"'
alias rs='tput reset; stty sane'
alias z="zellij options --disable-mouse-mode"
alias lg="lazygit"
alias sf="setxkbmap fr"

# emulate bash PROMPT_COMMAND (only for zsh)
precmd() { eval "$PROMPT_COMMAND" }
# open new terminal in same dir
PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
[[ -f "${HOME}/.cwd" ]] && ( cd "$(< ${HOME}/.cwd)" 2>/dev/null || echo "\e[0;32;1mRC => Cannot access last directory\e[0;32;1;3m ($(< ${HOME}/.cwd))\e[0m" >&2)
;
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/bin/nvim-linux64/bin/"
lfcd() {
    dir=$(lf -print-last-dir "$@")
    while ! cd "$dir" 2> /dev/null
    do
        dir=$(dirname "$dir")
    done
}
bindkey -s ^f ^ulfcdn
autoload edit-command-line; zle -N edit-command-line
bindkey ^e edit-command-line
bindkey -s ^g ^ulazygitn

alias ls="ls --color=always"
alias ll="eza -la"
export PATH=/home/hdupire/.brew/bin:/home/hdupire/.brew/bin:/home/hdupire/bin:/home/hdupire/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/hdupire/.local/bin:/home/hdupire/.local/bin:/home/hdupire/.local/bin/nvim-linux64/bin/:/home/hdupire/.local/bin:/home/hdupire/.local/bin:/home/hdupire/.local/bin/nvim-linux64/bin/

alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
alias dcubf="docker-compose up --build --force-recreate"
alias dcud="docker-compose up -d"
alias dcdv="docker-compose down -v"
alias drm="docker container rm"
alias dcs="docker-compose stop"
alias dps="docker ps"
alias dspa="docker system prune -af"
alias dvls="docker volume ls"

dvpa () {
	volumes="$(docker volume ls -q --filter dangling=true)"
	if [ -n "$volumes" ]; then
		echo "$volumes" | while read line
		do
			echo -n "deleting "
			docker volume rm "${line}" -f
		done
		echo "done"
	else
		echo "no volumes to delete"
	fi
}

function dbash() {
	docker exec -it $1 bash
}

alias siege_test="siege -b -c250 -t1M -v"

alias battery='cat /sys/class/power_supply/axp288_fuel_gauge/capacity'
alias clip="xclip -sel c"

alias svenv="source ~/user_venv/bin/activate"

function ssl_info {
	openssl x509 -in $1 -text -noout | less
}
