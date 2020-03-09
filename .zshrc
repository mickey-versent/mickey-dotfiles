source ~/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle npm
antigen bundle wd
antigen bundle sudo
antigen bundle docker
antigen bundle command-not-found
antigen bundle brew

# Other Bundles
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle gradle/gradle-completion

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

[ -f ~/.dotfiles/.aliases.sh ] && source ~/.dotfiles/.aliases.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export POWERLEVEL9K_MODE='awesome-fontconfig'
# export POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="🧟"
# export POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="🧟 "
export POWERLEVEL9K_PROMPT_ON_NEWLINE=true
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
export POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='black'
export POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='092'
export POWERLEVEL9K_DIR_HOME_BACKGROUND='black'
export POWERLEVEL9K_DIR_HOME_FOREGROUND='092'
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
export POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='092'
export POWERLEVEL9K_TIME_BACKGROUND='black'
export POWERLEVEL9K_TIME_FOREGROUND='magenta'
export POWERLEVEL9K_STATUS_OK_BACKGROUND='black'
export POWERLEVEL9K_STATUS_OK_FOREGROUND='magenta'
export POWERLEVEL9K_STATUS_ERROR_BACKGROUND='magenta'
export POWERLEVEL9K_STATUS_ERROR_FOREGROUND='black'

export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

[[ -s "/usr/local/etc/profile.d/z.sh" ]] && . /usr/local/etc/profile.d/z.sh

hash jenv && eval "$(jenv init -)"
hash rbenv && eval "$(rbenv init -)"
