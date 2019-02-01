# oh-my-zsh Answart Theme


### COLORS

eval my_gray='$FG[237]'
# %{$my_gray%}
eval my_orange='$FG[214]'
eval my_orange1='$FG[208]'
eval my_orange2='$FG[214]'
eval my_periwinkle='$FG[075]'
eval my_dark_teal='$FG[078]'
eval my_dark_blue='$FG[032]'
eval my_purple='$FG[105]'

eval my_green='$FG[106]'
eval my_yellow='$FG[226]'
eval my_red='$FG[166]'


### _TIME

_TIME="[%t ]"
# _TIME="[%*]"


### NVM

# ZSH_THEME_NVM_PROMPT_PREFIX="%B⬡%b "
# ZSH_THEME_NVM_PROMPT_PREFIX="%{$fg[green]%}⬡ "
# ZSH_THEME_NVM_PROMPT_SUFFIX="%{$reset_color%}"


### Git [±master ╚✓▾▴●*➜-✚✖º*≡¤░═⚡○▶Ξ↑λ+✚»]

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"

ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[green]%}λ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$my_red%}λ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$my_yellow%}λ %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$my_yellow%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$my_yellow%}●%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$my_orange%}●%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_CLEAN="%{$my_green%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$my_green%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$my_red%}-%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$my_green%}➜%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_STASHED="*%{$reset_color%}"

my_git_branch () {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  echo "%{$fg_bold[white]%}${ref#refs/heads/}%{$reset_color%}"
}

my_git_branch_status() {
  _STATUS="%{$fg_bold[white]%}λ %{$reset_color%}"
  _INDEX=$(command git status --porcelain -b 2> /dev/null)

  # green λ
  if $(echo "$_INDEX" | command grep -q '^## .*ahead'); then
    _STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*behind'); then
    _STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi
  if $(echo "$_INDEX" | command grep -q '^## .*diverged'); then
    _STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    _STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED"
  elif $(echo "$_INDEX" | command grep -q '^UU '); then
    _STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED"
  fi

  echo $_STATUS
}

my_git_commit_status() {
  _STATUS=""
  _INDEX=$(command git status --porcelain 2> /dev/null)

  if [[ -n "$_INDEX" ]]; then
    # added green ✚
    if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_ADDED"
    elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_ADDED"
    fi

    # deleted red -
    if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DELETED"
    elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_DELETED"
    fi


    # untracked green ●
    if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    elif $(echo "$_INDEX" | command grep -q -E '^\?\? '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNTRACKED"
    fi

    # modified/unstaged yellow ●
    if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_MODIFIED"
    elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_MODIFIED"
    elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_MODIFIED"
    elif $(echo "$_INDEX" | command grep -q '^.[MTD] '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_UNSTAGED"
    fi

    # staged orange ●
    if $(echo "$_INDEX" | command grep -q '^[AMRD]. '); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STAGED"
    fi

    # renamed green ➜
    if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_RENAMED"
    fi

    # stashed blue *
    if $(command git rev-parse --verify refs/stash &> /dev/null); then
      _STATUS="$_STATUS$ZSH_THEME_GIT_PROMPT_STASHED"
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

# /Users/answart/.vscode/extensions
# /Users/answart/.vscode/extensions/vscode-answart-theme/themes
# SPACES
get_space () {
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

# first line
_1LEFT="$_USERNAME $_DIREC"
_1RIGHT="$_TIME "

# second line
my_second_line () {
  _SPACES=`get_space $_1LEFT $_1RIGHT`
  print
  print -rP "$_1LEFT$_SPACES$_1RIGHT"
}

setopt prompt_subst
PROMPT='> $_LIBERTY '
RPROMPT='$(my_git_prompt)'

autoload -U add-zsh-hook
# second line
add-zsh-hook precmd my_second_line
