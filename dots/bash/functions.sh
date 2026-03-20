prompt_name() {
  local prompt_path="${BLUE}\u@\h:\w${RESET}"
  local git_info=""
  local branch_name=$(git branch --show-current 2>/dev/null)

  if [ -n "$branch_name" ]; then
    git_info="${BOLD_YELLOW}($branch_name)${RESET}"
  else
    git_info="${BOLD_YELLOW}()${RESET}"
  fi

  PS1="${prompt_path} ${git_info} \$ "

}
prompt_name

httpcats() {
  google-chrome "https://http.cat/$1"
}
