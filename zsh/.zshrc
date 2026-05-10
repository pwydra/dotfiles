# --- CORE SETTINGS ---
bindkey -e
export EDITOR=nvim
export TERM=xterm-256color

# --- COMPLETIONS (Enhanced) ---
autoload -Uz compinit
# Only check for completion updates once a day to speed up startup
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.m-1) ]]; then
  compinit -C
else
  compinit
fi

# Group completions by category (e.g., Commands, Files, Aliases)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' menu select

# Use LS_COLORS for the completion menu (matches your folder colors)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ignore case
zstyle ':completion:*' matcher-list '' 'm:{A-Za-z}={a-zA-z}' '+l:|=* r:|=*'

# --- HELPER FUNCTIONS ---
function source_if() {
  [ -f "$1" ] && source "$1"
}

# --- PLUGINS (Portable Path) ---
# Cloned via your install.sh into your home dir
source_if "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source_if "$HOME/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# --- EXTERNAL FILES ---
source_if "$HOME/dotfiles/zsh/aliases.zsh"

# --- LANGUAGE MANAGERS ---
# jenv
export PATH=$PATH:$HOME/.jenv/bin
eval "$(jenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# History
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt SHARE_HISTORY             # Share history between different instances of zsh.
setopt HIST_IGNORE_DUPS          # Do not write a duplicate event to the history file.
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000

# --- JAVA / MAVEN ---
export MAVEN_OPTS="-Xms512m -Xmx1024m"

# --- add local binaries to PATH
export PATH="/usr/local/bin:${HOME}/bin:$PATH"

# --- THE PROMPT (Must be at the end) ---
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi
