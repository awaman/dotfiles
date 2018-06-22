[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


if [ ! -d $ZPLUG_HOME ]; then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
  source $ZPLUG_HOME/init.zsh && zplug update --self
fi
source $ZPLUG_HOME/init.zsh

zplug "junegunn/fzf", as:command, use:bin/fzf-tmux, lazy:true
zplug "mollifier/anyframe"
zplug "zsh-users/zsh-completions", lazy:true
# zplug "felixr/docker-zsh-completion"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure"
zplug "hchbaw/opp.zsh", lazy:true
# zplug "aws/aws-cli", use:bin/aws_zsh_completer.sh, on:"zsh-users/zsh-completions", defer:2
zplug "plugins/git", from:oh-my-zsh, if:"(( $+commands[git] ))", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2

zplug "$ZDOTDIR", from:local, use:"{alias,bind,func,gcloud}.zsh"

case ${OSTYPE} in
  darwin*)
    alias ls="ls -G"
    alias ll="ls -lG"
    alias la="ls -laG"
    alias sed="gsed"
    ;;
  linux*)
    ;;
  msys*)
    if which start > /dev/null; then
      function mstart(){
        for arg in $@
        do
          start $arg
        done
      }
      alias start=mstart
    fi
    ;;
esac

zplug load

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=15'
bindkey ' ' autosuggest-accept


# direnv setup
eval "$(direnv hook zsh)"


if (which zprof > /dev/null) ;then
  zprof
fi
