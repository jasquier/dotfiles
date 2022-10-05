# functions
bashopts() {
  set -o
  shopt
}

cdl() {
  cd "$@" && lsd -A1;
}

chrome() {
  "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" "$@"
}

cowfortune() {
  fortune -a | cowsay | lolcat "$@";
}

findnodemodules() {
  find . -name "node_modules" -prune;
}

lm() {
  gls -AFgo --color --time-style="+| %F %T |" "$@" | tail +2 | tr -s " " | cut -d " " -f 4-;
}

lns() {
  cat package.json | jq -C .'scripts' "$@";
}

mvnrepo() {
  mvn help:evaluate -Dexpression=settings.localRepository | grep -v "\[INFO\]";
}

pj() {
  cat package.json | jq -C;
}

trash() {
  /bin/mv -i $@ /Users/jasquier/trash;
}

update_cpu_temps() {
  date >>~/cpu_temps.txt
  osx-cpu-temp >>~/cpu_temps.txt
}

# display the five day and current weather
weather() {
  ansiweather -F | cut -d ':' -f 2- | gsed -e 's/-/\n/g'
  ansiweather | gsed -e 's/-/\n/g'
}
