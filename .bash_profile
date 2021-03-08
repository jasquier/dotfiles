# setup less to show lines and percentage at the cost of speed
export MANPAGER='less -M +Gg'

# increase the history size
HISTSIZE=5000
HISTFILESIZE=10000

# always append to history
shopt -s histappend

# always confirm history substitutions
shopt -s histverify

# make history immediately available to all shells
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# allow the use of ctrl-s in ctrl-r history searches
stty -ixon

# homebrew completions
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# bash-git-completion
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    GIT_PROMPT_MASTER_BRANCHES='@(master|main)'
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
    GIT_PROMPT_THEME=Minimal
fi

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/jasquier/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

# gh autocomplete setup
eval "$(gh completion --shell bash)"

# thefuck command
eval $(thefuck --alias)

# z command
. /usr/local/etc/profile.d/z.sh

# customize bat theme
export BAT_THEME="Monokai Extended"

# old prompt used before git-bash-prompt
# export PS1='\n\w $(__git_ps1 " (%s)")\nλ '

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# set up cs50 variables, we removed -ggdb3 from CFLAGS and -lcrypt from LDLIBS
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcs50 -lm"

# functions
bashopts() { set -o; shopt; }
cdl() { cd "$@" && lsd -A1; }
chrome() {
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" "$@";
}
cowfortune() { fortune -a | cowsay | lolcat "$@"; }
findnodemodules() { find . -name "node_modules" -prune; }
mvnrepo() { mvn help:evaluate -Dexpression=settings.localRepository | grep -v "\[INFO\]"; }
lm() { gls -AFgo --color --time-style="+| %F %T |" "$@" | tail +2 | tr -s " " | cut -d " " -f 4-; }
lns() { cat package.json | jq -C .'scripts' "$@"; }
pj() { cat package.json | jq; }
trash() { /bin/mv -i $@ /Users/jasquier/trash; }
update_cpu_temps() {
    date >> ~/cpu_temps.txt
    osx-cpu-temp >> ~/cpu_temps.txt
}

# aliases
alias bashrc='vim ~/.bash_profile'
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
alias trei='tree -aCF -I "node_modules|.git" "$@"'
alias g='git "$@"'
alias gs='git status "$@"'
alias gss='git status -s "$@"'
alias gch='git checkout "$@"'
alias ip='dig +short myip.opendns.com @resolver1.opendns.com "$@"'
alias localip='ipconfig getifaddr en0 "$@"'
alias n='npm "$@"'
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
# npm ls --depth 0 shorthand
alias npmls='npm ls --depth 0'
# quickly open todays notes
alias note='~/notes/opennote.sh'
# append the history list the the history file, then import it into our history db
alias hai='history -a; hist import'

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fix bash tab compeletion
# If there are multiple matches for completion, Tab should cycle through them
bind 'TAB':menu-complete

# Display a list of the matching files
bind "set show-all-if-ambiguous on"

# Perform partial completion on the first Tab press,
# only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"

# Add $HOME/bin to the path
export PATH="$HOME/bin:$PATH"

# Set Flask to run in development mode
export FLASK_ENV=development

# Enable tab completion for 'g' by marking it as an alias for 'git'
if type _git &> /dev/null; then
    complete -o default -o nospace -F _git g;
fi;

# Enable tab completion for 'n' by marking it as an alias for 'npm'
#if type npm &> /dev/null; then
#    complete -o default -o nospace -F npm n;
#fi;

# Enable changing directories by typing the directory name without 'cd'
shopt -s autocd

# Enable usage of ** in globs
shopt -s globstar

# Add to our command history db on shell launch
hist import

# start-up commands
fortune | cowsay;
echo "Don't forget to check your tasks..." | lolcat;
