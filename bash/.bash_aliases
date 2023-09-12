# aliases
alias bashrc='nvim ~/.bash_profile'
alias brewup='HOMEBREW_UPDATE_REPORT_ALL_FORMULAE=1 brew update && brew upgrade --display-times'
alias ls='gls -FGh --color "$@"'
alias la='gls -AFGh --color "$@"'
alias l='lsd -A1 "$@"'
alias ltr='lsd -A1rt "$@"'
alias ll='lsd -Al "$@"'
alias lll='lsd -Al --total-size "$@"'
alias lla='gls -AFGhl --color "$@"'
alias lal='gls -AFGhl --color "$@"'
alias later='gls -AFGhlrt --color "$@"'
alias tre='tree -CF "$@"'
alias trei='tree -aCF -I "node_modules|.git|.idea|target" "$@"'
alias g='git "$@"'
alias gs='git status "$@"'
alias gss='git status -s "$@"'
alias gch='git checkout "$@"'
alias gad='git add .'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com "$@"'
alias localip='ipconfig getifaddr en0 "$@"'
alias cls='clear "$@"'
alias clock='tty-clock -c -C 6 "$@"'
alias ss='echo "cols: $(tput cols)" && echo "lines: $(tput lines)" "$@"'
alias dirsizes='du -sk * | sort -n'
alias rectangle='open /Applications/Rectangle.app'
# Trim newlines and copy to clipboard
alias c="tr -d '\n' | pbcopy"
# safety first
alias cp='cp -i "$@"'
alias mv='mv -i "$@"'
alias rm='rm -i "$@"'
# Enable colored 'grep' output
alias cgrep='grep --color -n'
alias cfgrep='fgrep --color -n'
alias cegrep='egrep --color -n'
# Allow grepping of history
alias hists='history | grep --color "$@"'
# Have mkdir create intermediate dirs when doing things like 'mkdir alice/bob/caroline'
alias mkdir='mkdir -p'
# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'
# quickly open todays notes
alias notes='~/notes/opennote.sh'
# append the history list to the history file, then import it into our history db
alias hai='history -a; hist import'
# always save history before exiting
alias exit='history -a && hist import && exit'
# print the most recently visited directories
alias dirhist="cat ~/.z | sort -t '|' -k 3n | cut -d '|' -f 1 | gsed -r 's/\/Users\/jasquier/~/g'"
