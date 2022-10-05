# setup less to show lines and percentage at the cost of speed
export MANPAGER='less -M +Gg'

# increase the history size
export HISTSIZE=5000
export HISTFILESIZE=10000

# use nvim for editing
export VISUAL=nvim
export EDITOR="$VISUAL"

# Add $HOME/bin to the path
export PATH="$HOME/bin:$PATH"

# Set Flask to run in development mode
export FLASK_ENV=development

# customize bat theme
export BAT_THEME="Monokai Extended"

# make history immediately available to all shells
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# always append to history
shopt -s histappend

# always confirm history substitutions
shopt -s histverify

# enable changing directories by typing the directory name without 'cd'
shopt -s autocd

# enable usage of ** in globs
shopt -s globstar

# use vi mode for line editing
set -o vi

# allow the use of ctrl-s in ctrl-r history searches
stty -ixon

# fix bash tab compeletion
## if there are multiple matches for completion, Tab should cycle through them
bind 'TAB':menu-complete

## display a list of the matching files
bind "set show-all-if-ambiguous on"

## perform partial completion on the first Tab press,
## only start cycling full results on the second Tab press
bind "set menu-complete-display-prefix on"

# source aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# source functions
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

if [ -f ~/.bash_completions ]; then
  . ~/.bash_completions
fi

if [ -f ~/.bash_commands ]; then
  . ~/.bash_commands
fi

# source cargo start up
. "$HOME/.cargo/env"

# set up cs50 variables, we removed -ggdb3 from CFLAGS and -lcrypt from LDLIBS
#export CC="clang"
#export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
#export LDLIBS="-lcs50 -lm"

# Enable tab completion for 'g' by marking it as an alias for 'git'
if type _git &>/dev/null; then
  complete -o default -o nospace -F _git g
fi

# start-up commands
## add to our command history db on shell launch
hist import
## say something fun
fortune | cowsay
## remind me to check my task list
echo "Don't forget to check your tasks..." | lolcat
