# Created by newuser for 5.9
eval "$(starship init zsh)"

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
WORDCHARS=${WORDCHARS//\/} 
setopt hist_expire_dups_first 
setopt hist_ignore_dups      
setopt hist_ignore_space     
setopt hist_verify            
setopt correct            
setopt interactivecomments 
setopt nonomatch          
setopt notify             
setopt numericglobsort     
setopt promptsubst         


autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:::::*' menu select
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' rehash true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false

[ -z "$TMUX" ] && exec tmux

if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
   . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
   ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'
fi

source /usr/share/nvm/init-nvm.sh
export PATH=$PATH:~/Android/Sdk/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH
export ANDROID_HOME=~/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH
export NODE_OPTIONS="--max-old-space-size=4096"
