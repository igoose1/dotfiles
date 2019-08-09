source ~/.git-prompt.sh
source ~/.profile

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux

# Basic options {{{
setopt APPEND_HISTORY SHARE_HISTORY INC_APPEND_HISTORY HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INTERACTIVE_COMMENTS
setopt GLOB_STAR_SHORT GLOB_DOTS EXTENDED_GLOB
setopt NO_NOMATCH
setopt AUTO_PUSHD PUSHD_IGNORE_DUPS
setopt PROMPT_SUBST
# }}}


zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/oskar/.zshrc'

# generate descriptions with magic.
# zstyle ':completion:*' auto-description 'specify: %d'

# Don't prompt for a huge list, page it!
# zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# Don't prompt for a huge list, menu it!
#zstyle ':completion:*:default' menu 'select=0'

# Have the newer files last so I see them first
# zstyle ':completion:*' file-sort modification reverse

# color code completion!!!!  Wohoo!
# zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

#{{{ Key bindings

# Who doesn't want home and end to work?
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

# Incremental search is elite!
bindkey -M vicmd "/" history-incremental-search-backward
bindkey -M vicmd "?" history-incremental-search-forward

# Search based on what you typed in already
bindkey -M vicmd "//" history-beginning-search-backward
bindkey -M vicmd "??" history-beginning-search-forward

bindkey "\eOP" run-help

# oh wow!  This is killer...  try it!
bindkey -M vicmd "q" push-line

# Ensure that arrow keys work as they should
bindkey '\e[A' up-line-or-history
bindkey '\e[B' down-line-or-history

bindkey '\eOA' up-line-or-history
bindkey '\eOB' down-line-or-history

bindkey '\e[C' forward-char
bindkey '\e[D' backward-char

bindkey '\eOC' forward-char
bindkey '\eOD' backward-char

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'u' undo

# Rebind the insert key.  I really can't stand what it currently does.
bindkey '\e[2~' overwrite-mode

# Rebind the delete key. Again, useless.
bindkey '\e[3~' delete-char

bindkey -M vicmd '!' edit-command-output

# it's like, space AND completion.  Gnarlbot.
# bindkey -M viins ' ' magic-space

#}}}

# Prompt
PROMPT='[%F{red}%n%f@%F{blue}%m%f][%F{yellow}%0~%f][$(__git_ps1 %b)]%# '
#RPROMPT='[%F{yellow}%?%f]'

# Alias for info
alias info='info --vi-keys'

# auto ssh-agent
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

# I call it often
alias scrots="scrot -s -e 'mv \$f /tmp/'"

PATH="/home/oskar/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/oskar/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/oskar/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/oskar/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/oskar/perl5"; export PERL_MM_OPT;
