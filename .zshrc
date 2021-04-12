# - - - - - - - - - - - - - - - - - - - -
# ZSH Settings
# - - - - - - - - - - - - - - - - - - - -

# Exports
export PATH="$(python3 -m site --user-base)/bin:$PATH"
export PATH=/usr/local/smlnj/bin:"$PATH"
. $HOME/.asdf/asdf.sh

# Integrations
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Aliases
alias dab='docker-app bash'
alias dup='docker-compose up -d'
alias dar='docker-app rails'
alias dps='docker-compose ps'
alias dst='docker-compose stop'
alias dap='docker-app up'
alias ddlog='docker compose -f docker-compose.dev.yml logs -f --tail=1000'
alias dlog='docker-compose logs -f --tail=1000'
alias dstop='docker stop $(docker ps -aq)'
alias gst='git status'

autoload -U colors && colors    # Load Colors.
setopt autocd                   # Automatically Change Directory If A Directory Is Entered.
setopt correct                  # Turn On Corrections

# Completion Options.
setopt complete_in_word         # Complete From Both Ends Of A Word.
setopt always_to_end            # Move Cursor To The End Of A Completed Word.
setopt path_dirs                # Perform Path Search Even On Command Names With Slashes.
setopt auto_menu                # Show Completion Menu On A Successive Tab Press.
setopt auto_list                # Automatically List Choices On Ambiguous Completion.
setopt auto_param_slash         # If Completed Parameter Is A Directory, Add A Trailing Slash.

# History.
HISTFILE=".zhistory"
HISTSIZE=100000
SAVEHIST=5000
setopt appendhistory notify
unsetopt beep nomatch

setopt inc_append_history       # Write To The History File Immediately, Not When The Shell Exits.
setopt share_history            # Share History Between All Sessions.
setopt hist_expire_dups_first   # Expire A Duplicate Event First When Trimming History.
setopt hist_ignore_dups         # Do Not Record An Event That Was Just Recorded Again.
setopt hist_ignore_all_dups     # Delete An Old Recorded Event If A New Event Is A Duplicate.
setopt hist_find_no_dups        # Do Not Display A Previously Found Event.
setopt hist_ignore_space        # Do Not Record An Event Starting With A Space.
setopt hist_save_no_dups        # Do Not Write A Duplicate Event To The History File.
setopt hist_verify              # Do Not Execute Immediately Upon History Expansion.
setopt extended_history         # Show Timestamp In History.

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# - - - - - - - - - - - - - - - - - - - -
# Plugins
# - - - - - - - - - - - - - - - - - - - -

zinit wait lucid light-mode for \
      OMZ::lib/compfix.zsh \
      OMZ::lib/completion.zsh \
      OMZ::lib/git.zsh \
      OMZ::lib/termsupport.zsh \
      OMZ::plugins/git-auto-fetch/git-auto-fetch.plugin.zsh \
  atinit"zicompinit; zicdreplay" \
        zdharma/fast-syntax-highlighting \
      OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
      OMZ::plugins/command-not-found/command-not-found.plugin.zsh \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  as"completion" \
      OMZ::plugins/docker/_docker \
      OMZ::plugins/composer/composer.plugin.zsh \

# Recommended Be Loaded Last
zinit load zsh-users/zsh-completions

# append asdf completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# - - - - - - - - - - - - - - - - - - - -
# Theme / Prompt Customization
# - - - - - - - - - - - - - - - - - - - -

eval "$(starship init zsh)"
