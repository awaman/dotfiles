autoload -Uz add-zsh-hook

plugins_local=(
  tmux.zsh
  func.zsh
  alias.zsh
  bind.zsh
  os.zsh
)
for p in "${plugins_local[@]}"; do
  source "$ZDOTDIR/rc/$p"
done

plugins_repo=(
  paulirish/git-open
  robbyrussell/oh-my-zsh/plugins/git
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-completions
  zsh-users/zsh-syntax-highlighting
  yhiraki/zsh-simple-prompt
)
GHQROOT=$(ghq root)
for p in "${plugins_repo[@]}"; do
  source $GHQROOT/github.com/$p/*.plugin.zsh
done

# direnv setup
command -v direnv >/dev/null &&
  eval "$(direnv hook zsh)"

# path sort by string length
export PATH=$(echo "$PATH" |
  tr : '\n' |
  awk '{print length(), $0}' |
  sort -nr |
  cut -d ' ' -f 2 |
  tr '\n' :)

[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

command -v zprof >/dev/null &&
  zprof

# zmodload zsh/zprof && zprof

# Make status code '0'
echo .zshrc loaded
