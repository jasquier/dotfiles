# setup less to show lines and percentage at the cost of speed
export MANPAGER='less -M +Gg'

# increase the history size
HISTSIZE=5000
HISTFILESIZE=10000

# always append to history
shopt -s histappend

# make history immediately available to all shells
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# homebrew completions
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# bash-git-completion
if [ -f "/usr/local/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    source "/usr/local/opt/bash-git-prompt/share/gitprompt.sh"
    GIT_PROMPT_THEME=Minimal
fi

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/jasquier/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;

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
cdl() { cd "$@" && lsd -A1; }
chrome() { 
    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" http://www."$@";
}
cowfortune() { fortune -a | cowsay | lolcat "$@"; } 
curljq() { curl -s "$@" | jq; }
findnodemodules() { find . -name "node_modules" -prune; }
mvnrepo() { mvn help:evaluate -Dexpression=settings.localRepository | grep -v "\[INFO\]"; }
lm() { gls -AFgo --color --time-style="+| %F %T |" "$@" | tail +2 | tr -s " " | cut -d " " -f 4-; }
lns() { cat package.json | jq -C .'scripts' "$@"; }
trash() { /bin/mv -i $@ /Users/jasquier/trash; }
update_cpu_temps() {
    date >> ~/cpu_temps.txt
    osx-cpu-temp >> ~/cpu_temps.txt
}

# aliases
alias bashrc='vim ~/.bash_profile'
alias ls='gls -FGh --color "$@"'
alias la='gls -AFGh --color "$@"'
alias la1='lsd -A1 "$@"'
alias ll='gls -FGhl --color "$@"'
alias lla='gls -AFGhl --color "$@"'
alias lal='gls -AFGhl --color "$@"'
alias later='gls -AFGhlrt --color "$@"'
alias tre='tree -CF "$@"'
alias tren='tree -CF -I node_modules "$@"'
alias g='git "$@"'
alias gs='git status "$@"'
alias gss='git status -s "$@"'
alias gch='git checkout "$@"'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com "$@"'
alias n='npm "$@"'
alias cls='clear "$@"'
alias clock='tty-clock -c -C 6 "$@"'
alias ss='echo "cols: $(tput cols)" && echo "lines: $(tput lines)" "$@"'
alias dirsizes='du -sk * | sort -n'
alias rectangle='open /Applications/Rectangle.app'
# safety first
alias cp='cp -i "$@"'
alias mv='mv -i "$@"'
alias rm='rm -i "$@"'

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

# start-up commands
fortune | cowsay;
echo "Don't forget to check your tasks..." | lolcat;
