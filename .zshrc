# Options (`man zshoptions`)
## Changing Directories
setopt autocd
setopt autopushd
setopt cdablevars
setopt chaselinks
setopt pushdignoredups
setopt pushdsilent
setopt pushdtohome
## Completion
setopt autoremoveslash
setopt completealiases
## Expansion and Globbing
setopt extendedglob
setopt nullglob
## History
setopt extendedhistory
setopt histignorealldups
setopt histignorespace
setopt incappendhistory
setopt sharehistory
## Input/Output
setopt clobber
setopt interactivecomments


# Antigen
## Setup
source "$HOME/.antigen/antigen.zsh"
## List
### Framework
antigen use oh-my-zsh
### Plugins
antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "zsh-users/zsh-completions"
antigen bundle "zsh-users/zsh-history-substring-search"
antigen bundle "zdharma/fast-syntax-highlighting"
### Theme
antigen theme geometry-zsh/geometry
## Apply
antigen apply

# Alias
alias code="code-oss . &!"

# Go Settings
export GOPATH="/media/hdd1/Proyectos/go"
export PATH="$PATH:$GOPATH/bin"
