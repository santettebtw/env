export PATH=$PATH:~/.cargo/bin/:~/.local/bin:/usr/bin:/sbin:/usr/sbin:/bin:~/go/bin:/home/sowsanti/Downloads/gcc-arm/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin

source ~/personal/.private/api_keys.sh
source "$HOME/.sdkman/bin/sdkman-init.sh"

source /usr/share/nvm/init-nvm.sh
fpath=(~/.local/scripts/zsh-completion $fpath)
autoload -Uz compinit
compinit

# fnm
FNM_PATH="/home/sowsanti/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/sowsanti/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

export AIR_HOME=/opt/air-sdk/AIRSDK
export PATH=${PATH}:/opt/air-sdk/AIRSDK/bin
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export AIR_DISTRO=debian

zmodload zsh/zle

TRAPWINCH() {
  zle && { zle reset-prompt; zle -R }
}

export THEME_SWITCHER_BASES_DIR="$HOME/dev/personal/scripts/theme-switcher/bases"
export THEME_SWITCHER_THEMES_DIR="$HOME/dev/personal/scripts/theme-switcher/themes"
export THEME_SWITCHER_BACKUPS_DIR="$HOME/dev/personal/scripts/theme-switcher/themes"

export BAT_STYLE="numbers,header-filename"
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}' --preview-border=left"

# ~~~~~~~~~~~~~~~~~~~~ ALIASES ~~~~~~~~~~~~~~~~~~~~
alias ls='ls --color=auto'
alias la='ls -la'

alias tt='tt -n 15 -theme grapemax -csv >> ~/wpm.csv'

alias sb='cd ~/Documents/Obsidian/personal'
alias ib='cd ~/Documents/Obsidian/personal/inbox'

h2d(){
  echo "ibase=16; $@"|bc
}
d2h(){
  echo "obase=16; $@"|bc
}

alias zxcv="setxkbmap ch fr -option caps:escape"
alias yxcv="setxkbmap us -option caps:escape"
alias asdf="setxkbmap us -variant real-prog-dvorak -option caps:escape"
alias aoeu="setxkbmap us -option caps:escape"

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "[WIP]: $(date)"'
