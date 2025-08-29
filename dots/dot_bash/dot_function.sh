git_branch_name() {
  local YELLOW='\[\033[1;33m\]'
  local BLUE='\[\033[0;34m\]'
  local RESET='\[\033[0m\]'

  local prompt_path="${BLUE}\u@\h:\w${RESET}"
  local git_info=""
  local branch_name=$(git branch --show-current 2>/dev/null)

  if [ -n "$branch_name" ]; then
    git_info="${YELLOW}($branch_name)${RESET}"
  else
    git_info="${YELLOW}()${RESET}"
  fi

  PS1="${prompt_path} ${git_info} \$ "

}
git_branch_name

httpcats() {
  google-chrome "https://http.cat/$1"
}
