export PATH=$PATH:~/.cargo/bin/:~/.local/bin:/usr/bin:/sbin:/usr/sbin:/bin:~/go/bin:/home/sowsanti/Downloads/gcc-arm/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin

[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

alias tt='tt -n 15 -theme grapemax -csv >> ~/wpm.csv'
source /usr/share/nvm/init-nvm.sh
fpath=(~/.local/scripts/zsh-completion $fpath)
autoload -Uz compinit
compinit
alias bbl='~/Downloads/Blablaland-Desktop-Client.AppImage --target=http://127.0.0.1:8000/'
alias bblc='~/Downloads/Blablaland-Desktop-Console.AppImage --target=http://127.0.0.1:8000/console/view'
alias bblco='~/Downloads/Blablaland-Desktop-Client.AppImage --target=https://blablaland.co/'

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
alias t='tmux'
alias v='nvim'
alias sv='sudo nvim'
alias ls='ls --color=auto'
alias la='ls -la'

alias sb='cd ~/Documents/Obsidian/personal'
alias ib='cd ~/Documents/Obsidian/personal/inbox'

h2d(){
  echo "ibase=16; $@"|bc
}
d2h(){
  echo "obase=16; $@"|bc
}

alias zsdf="setxkbmap ch fr -option caps:escape"
alias ysdf="setxkbmap us -option caps:escape"
alias asdf="setxkbmap us -variant real-prog-dvorak -option caps:escape"
alias asdf="setxkbmap us -variant real-prog-dvorak -option caps:escape"
alias aoeu="setxkbmap us -option caps:escape"

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit -m "[WIP]: $(date)"'
