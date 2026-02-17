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

date_box() {
  local date_output
  if [ -z "$1" ]; then
    date_output=$(date)
  else
    date_output=$(date +"$1")
  fi

  local length=${#date_output}

  local top_border="┌"
  for ((i = 0; i < length + 2; i++)); do
    top_border+="─"
  done
  top_border+="┐"

  local middle="│ $date_output │"

  local bottom_border="└"
  for ((i = 0; i < length + 2; i++)); do
    bottom_border+="─"
  done
  bottom_border+="┘"

  echo "$top_border"
  echo "$middle"
  echo "$bottom_border"
}

date_box_loop() {

  if [ "$1" = "" ]; then
    local format="%a %d %H:%M:%S"
  else
    local format="$1"
  fi
  local refresh="${2:-1}"

  trap 'echo "Exiting date loop"; return 0' INT

  while true; do
    clear

    local date_output
    if [ -z "$format" ]; then
      date_output=$(date)
    else
      date_output=$(date +"$format")
    fi

    local length=${#date_output}

    local top_border="┌"
    for ((i = 0; i < length + 2; i++)); do
      top_border+="─"
    done
    top_border+="┐"

    local middle="│ $date_output │"

    local bottom_border="└"
    for ((i = 0; i < length + 2; i++)); do
      bottom_border+="─"
    done
    bottom_border+="┘"

    echo "$top_border"
    echo "$middle"
    echo "$bottom_border"

    sleep "$refresh"
  done
}
