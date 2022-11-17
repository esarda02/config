#Defaults
export EDITOR='nvim'
export BROWSER='firefox'
export PATH="$HOME/.emacs.d/bin/:$PATH"

shopt -s cdspell    #Corrects spellings
complete -d cd      #Only shows directories when press tab after typing cd


#Prompt Settings
PS1='\e[47m' # change 0 to 7 this is Light Gray or \e[40m Dark Gray    #Background colour
PS1+='\e[0;34m \w \e[0;37m' # change the w to W to shorten the path to only the current directory


openVEmacs() {
    cd ~/Documents/vanilla-emacs
    emacs -q -l init.el init.el &!
    cd
}

alias vemacs=openVEmacs
alias sshtunnel="ssh -D 8123 -f -C -q -N es299@es299.host.cs.st-andrews.ac.uk"

TERM=xterm-256color
. "$HOME/.cargo/env"
