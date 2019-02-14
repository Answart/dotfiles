# oh-my-zsh Answart Theme


### COLORS

eval my_gray='$FG[237]'
eval my_red='$FG[166]'
eval my_orange='$FG[214]'
eval my_yellow='$FG[226]'
eval my_green='$FG[106]'


### _TIME

_TIME="[%t ]"
# _TIME="[%*]"


### NVM

# ZSH_THEME_NVM_PROMPT_PREFIX="%B⬡%b "
# ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[green]%}⬡ "
# ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%}"


### Git [±master ╚✓▾▴●*➜-✚✖º*≡¤░═⚡○▶Ξ↑λ+✚»⑃]
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ ⨠
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ

_white_branch="%{$fg_bold[white]%}λ %{$reset_color%}"
_green_branch="%{$my_green%}λ %{$reset_color%}"
_orange_branch="%{$fg[yellow]%}λ %{$reset_color%}"
_yellow_branch="%{$fg_bold[yellow]%}λ %{$reset_color%}"
_red_branch="%{$my_red%}λ %{$reset_color%}"

_green_plus="%{$my_green%}✚ %{$reset_color%}"
_orange_plus="%{$fg[yellow]%}✚ %{$reset_color%}"
_yellow_plus="%{$fg_bold[yellow]%}✚ %{$reset_color%}"

_green_dot="%{$my_green%}●%{$reset_color%}"
_orange_dot="%{$fg[yellow]%}●%{$reset_color%}"
_yellow_dot="%{$fg_bold[yellow]%}●%{$reset_color%}"

_green_ex="%{$my_green%}✖ %{$reset_color%}"
_orange_ex="%{$fg[yellow]%}✖ %{$reset_color%}"
_yellow_ex="%{$fg_bold[yellow]%}✖ %{$reset_color%}"

_orange_arrow="%{$fg[yellow]%}➜%{$reset_color%}"
_yellow_arrow="%{$fg_bold[yellow]%}➜%{$reset_color%}"

_blue_star="%{$reset_color%}*"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"

# ZSH_THEME_GIT_PROMPT_AHEAD="$_green_branch"
# ZSH_THEME_GIT_PROMPT_BEHIND="$_red_branch"
# ZSH_THEME_GIT_PROMPT_UNMERGED="$_orange_branch"

# ZSH_THEME_GIT_PROMPT_UNTRACKED="$_green_plus"
# ZSH_THEME_GIT_PROMPT_MODIFIED="$_orange_dot"
# ZSH_THEME_GIT_PROMPT_UNSTAGED="$_orange_dot"
# ZSH_THEME_GIT_PROMPT_STAGED="$_yellow_dot"

# ZSH_THEME_GIT_PROMPT_CLEAN=""
# ZSH_THEME_GIT_PROMPT_ADDED="$_green_plus"
# ZSH_THEME_GIT_PROMPT_DELETED="$_orange_ex"
# ZSH_THEME_GIT_PROMPT_RENAMED="$_orange_arrow"

# ZSH_THEME_GIT_PROMPT_STASHED="$_blue_star"


my_git_branch() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "%{$fg_bold[white]%}${ref#refs/heads/}%{$reset_color%}"
}

my_git_branch_status() {
  _STATUS="$_white_branch"
  _INDEX=$(command git status --porcelain -b 2> /dev/null)

  # BRANCH λ
  if $(echo "$_INDEX" | command grep -q '^\#\# .*ahead'); then
    _STATUS="$_green_branch"
  elif $(echo "$_INDEX" | command grep -q '^\#\# .*behind'); then
    _STATUS="$_red_branch"
  elif $(echo "$_INDEX" | command grep -q '^\#\# .*diverged'); then
    _STATUS="$_red_branch"
  elif $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    _STATUS="$_orange_branch"
  elif $(echo "$_INDEX" | command grep -q '^UU '); then
    _STATUS="$_orange_branch"
  fi

  echo $_STATUS
}


my_git_commit_status() {
  _STATUS=""
  _INDEX=$(command git status --porcelain 2> /dev/null)

  if [[ -n "$_INDEX" ]]; then

    # GREEN ●
    ## new files
    if $(echo "$INDEX" | grep '^?? '); then
      _STATUS="$_STATUS$_green_dot"
    elif $(echo "$_INDEX" | command grep -q -E '^\?\? '); then
      _STATUS="$_STATUS$_green_dot"
    fi

    # ORANGE ●
    # new files modified
    if $(echo "$INDEX" | grep '^AM '); then
      _STATUS="$_STATUS$_orange_dot"
    elif $(echo "$_INDEX" | command grep -q -E '^\A\M '); then
      _STATUS="$_STATUS$_orange_dot"
    ## modified files
    elif $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
      _STATUS="$_STATUS$_orange_dot"
    elif $(echo "$_INDEX" | command grep -q -E '^\ M '); then
      _STATUS="$_STATUS$_orange_dot"
    elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
      _STATUS="$_STATUS$orange_dot"
    elif $(echo "$_INDEX" | command grep -q -E '^\ T '); then
      _STATUS="$_STATUS$_orange_dot"
    elif $(echo "$_INDEX" | command grep -q '^.\[MTD\] '); then
      _STATUS="$_STATUS$_orange_dot"
    fi

    # YELLOW ●
    ## staged new files
    if $(echo "$INDEX" | grep '^A  '); then
      _STATUS="$_STATUS$_yellow_dot"
    elif $(echo "$_INDEX" | command grep -q -E '^\A  '); then
      _STATUS="$_STATUS$_yellow_dot"
    ## staged modified files
    elif $(echo "$_INDEX" | command grep -q '^\[\AMRD\]\. '); then
      _STATUS="$_STATUS$_yellow_dot"
    fi

    ## DELETED FILES ✖
    if $(echo "$_INDEX" | command grep -q -E ' D '); then
      _STATUS="$_STATUS$_green_ex"
    fi
    if $(echo "$_INDEX" | command grep -q -E '^\D  '); then
      _STATUS="$_STATUS$_yellow_ex"
    fi

    ## RENAMED FILES ➜
    if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
      _STATUS="$_STATUS$_orange_arrow"
    elif $(echo "$_INDEX" | command grep -q '^\R  '); then
      _STATUS="$_STATUS$_orange_arrow"
    fi
    if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
      _STATUS="$_STATUS$_yellow_arrow"
    elif $(echo "$_INDEX" | command grep -q '^\R  '); then
      _STATUS="$_STATUS$_yellow_arrow"
    fi

    # STASHED *
    if $(command git rev-parse --verify refs/stash &> /dev/null); then
      _STATUS="$_STATUS$_blue_star"
    fi
  fi

  echo $_STATUS
}

my_git_prompt () {
  local _branch=$(my_git_branch)
  local _branch_status=$(my_git_branch_status)
  local _commit_status=$(my_git_commit_status)

  if [[ "${_branch}x" != "x" ]]; then
    _result="$ZSH_THEME_GIT_PROMPT_PREFIX$_branch_status$_branch"
    if [[ "${_commit_status}x" != "x" ]]; then
      _result="$_result $_commit_status"
    fi
    _result="$_result$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
  echo $_result
}


### PATHS

_PATH="%{$fg_bold[white]%}~%{$reset_color%}"
_DIREC="%{$fg_bold[white]%}/%c%{$reset_color%}"
_USERNAME="@%m"

if [[ $EUID -eq 0 ]]; then
  # _USERNAME="%{$fg_bold[red]%}%n%{$reset_color%}@%m"
  _LIBERTY="%{$fg[red]%}#%{$reset_color%}"
else
  # _USERNAME="%{$fg_bold[white]%}%n%{$reset_color%}@%m"
  _LIBERTY="%{$fg[green]%}$%{$reset_color%}"
fi


# SPACES
calc_space() {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  echo $SPACES
}


### END SETUP

_ROW_1_LEFT="$_USERNAME $_DIREC"
_ROW_1_RIGHT="$_TIME "
_ROW_2_LEFT='> $_LIBERTY '
_ROW_2_RIGHT='$(my_git_prompt)'

first_line() {
  _SPACES=`calc_space $_ROW_1_LEFT $_ROW_1_RIGHT`
  print
  print -rP "$_ROW_1_LEFT$_SPACES$_ROW_1_RIGHT"
}

# second line
setopt prompt_subst
PROMPT=$_ROW_2_LEFT
RPROMPT=$_ROW_2_RIGHT

autoload -U add-zsh-hook
# first line
add-zsh-hook precmd first_line
