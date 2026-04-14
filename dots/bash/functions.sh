prompt_name() {
  local host_color
  case "$(hostname)" in
  americanbook) host_color="${BOLD_GREEN}" ;;
  swissbook) host_color="${BOLD_CYAN}" ;;
  *) host_color="${BOLD_MAGENTA}" ;;
  esac

  local prompt_path="${host_color}\u@\h${RESET}:${BLUE}\w${RESET}"
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

clip() {
  local data
  data=$(base64 <"${1:-/dev/stdin}" | tr -d '\n')
  printf '\033]52;c;%s\a' "$data"
}

httpcats() {
  google-chrome "https://http.cat/$1"
}

lyra-branch() {
  local TASK_NUMBER=$1
  local GREP_ORIGIN_STRING="origin/.*${TASK_NUMBER}.*"
  local GREP_STRING="LYRA-${TASK_NUMBER}.*"
  git checkout -b $(git branch -a | grep -o $GREP_STRING) $(git branch -a | grep -o $GREP_ORIGIN_STRING)
}
