source ~/.zsh/zsh-snap/znap.zsh
znap source romkatv/powerlevel10k

# Aliases
alias dcd="docker-compose -f docker-compose.dev.yml"
alias ddlog="docker-compose -f docker-compose.dev.yml logs -f --tail=1000"
alias dlog="docker-compose logs -f --tail=1000"
alias dup="docker-compose up -d"
alias dcps="docker-compose ps"
alias dps="docker ps --format "table {{ .ID }}\t{{.Names}}\t{{.Status}}""

# Plugins
znap source marlonrichert/zsh-autocomplete
znap source asdf-vm/asdf
znap source MichaelAquilina/zsh-you-should-use
znap eval asdf-community/asdf-direnv "asdf exec $( asdf which direnv ) hook zsh" # cache the result
znap eval pip-completion 'pip completion --zsh'
znap eval pipx-completion 'register-python-argcomplete pipx'
znap eval pipenv-completion 'pipenv --completion'

# Path
fpath+=(
    ~[asdf-vm/asdf]/completions
    ~[asdf-community/asdf-direnv]/completions
    ~[zsh-users/zsh-completions]/src
)

# Use `znap compdef` to add generated completion functions:
znap compdef _kubectl 'kubectl completion  zsh'
znap compdef _rustup  'rustup completions zsh'
znap compdef _cargo   'rustup completions zsh cargo'

# thefuck
znap eval thefuck 'thefuck --alias fuck'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
