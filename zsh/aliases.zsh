function settitle() { echo -ne "\033]0;${1}\007"; }

# Maven
alias mci='mvn clean install -U'
alias mci-not='mvn -Dmaven.test.skip=true clean install -U'

# Shortcuts
alias vim='nvim'
alias vi='nvim'
alias ls='ls -G'
alias ll='ls -la'
