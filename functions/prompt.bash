# chars "#" 4
# chars "?" 6
# chars "!" 8

chars() {
  jot -b "$1" $2 |
  xargs |
  tr -d ' '
 }

git_status() {
  gitstat=$(mktemp ${TMPDIR:-/tmp}/XXXXX)
  git status 2>/dev/null > $gitstat
  num=$(grep -c "modified:" $gitstat)
  chars "!" $num
  num=$(grep -c "new file:" $gitstat)
  chars "+" $num
  num=$(grep -c "untracked files:" $gitstat)
  chars "?" $num
}

git_status
