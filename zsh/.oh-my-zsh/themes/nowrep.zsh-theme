# nowrep.zsh-theme
# Based on https://github.com/blinks zsh theme
# precmd function used from http://aperiodic.net/phil/prompt/

function precmd() {
    local TERMWIDTH
    (( TERMWIDTH = ${COLUMNS} - 1 ))

    # Truncate the path if it's too long.
    PR_FILLBAR=""
    PR_PWDLEN=""
    PR_HBAR=" "

    ZSH_THEME_GIT_PROMPT_PREFIX="("
    ZSH_THEME_GIT_PROMPT_SUFFIX=")"
    ZSH_THEME_GIT_PROMPT_DIRTY=" *"

    local gitsize=$(git_prompt_info | wc -c)
    local promptsize=${#${(%):-%n@%m---:--:---}}
    local pwdsize=${#${(%):-%~}}

    if [[ "$promptsize + $pwdsize + $gitsize" -gt $TERMWIDTH ]]; then
        ((PR_PWDLEN=$TERMWIDTH - $promptsize - $gitsize))
    else
        PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize + $gitsize)))..${PR_HBAR}.)}"
    fi

    ZSH_THEME_GIT_PROMPT_PREFIX=" [%{%B%F{blue}%}"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%{%f%k%b%B%F{green}%}]"
    ZSH_THEME_GIT_PROMPT_DIRTY=" %{%F{red}%}*%{%f%k%b%}"
}

function _prompt_char() {
  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
      echo "%{%F{blue}%}±%{%f%k%b%}"
  else
      echo ' '
  fi
}

function _user_color() {
    if [[ $EUID -ne 0 ]]; then
        echo 'green'
    else
        echo 'red'
    fi
}

# elaborate exitcode on the right when >0
return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

PROMPT='%{%f%k%b%}
%{%B%F{$(_user_color)}%}%n%{%B%F{blue}%}@%{%B%F{cyan}%}${${(%):-%m}:l}%{%B%F{green}%} \
%{%b%F{yellow}%}%$PR_PWDLEN<...<%~%<<%{%B%F{green}%}\
$(git_prompt_info)$PR_HBAR${(e)PR_FILLBAR}$(date +%X)%E%{%f%k%b%}
$(_prompt_char) %#%{%f%k%b%} '

RPROMPT='$(vi_mode_prompt_info) ${return_code} !%{%B%F{cyan}%}%!%{%f%k%b%}'
