tput setaf 4
echo '                   -`'
echo '                  .o+`'
echo '                 `ooo/'
echo '                `+oooo:'
echo '               `+oooooo:'
echo '               -+oooooo+:'
echo '             `/:-:++oooo+:'
echo '            `/++++/+++++++:'
echo '           `/++++++++++++++:'
echo '          `/+++ooooooooooooo/`'
echo '         ./ooosssso++osssssso+`'
echo '        .oossssso-````/ossssss+`'
echo '       -osssssso.      :ssssssso.'
echo '      :osssssss/        osssso+++.'
echo '     /ossssssss/        +ssssooo/-'
echo '   `/ossssso+/:-        -:/+osssso+-'
echo '  `+sso+:-`                 `.-/+oso:'
echo ' `++:.                           `-/+/'
echo ' .`                                 `/'
tput sgr0

# Aliases
alias sl=ls
alias cd..='cd ..'
alias ls='ls --color=auto'
alias fopen='xdg-open >/dev/null 2>&1'

alias jdk=". /home/demonwav/.scripts/jdk.sh"
jdk 8 true

# Exports
export EDITOR="vim"
export VISUAL="$EDITOR"

export PS1="\$(/home/demonwav/.ps.sh \$? \$USERNAME \$HOST \"\$DIR\")"

export PATH="/home/demonwav/.cargo/bin:$PATH"

# misc zsh settings
setopt PROMPT_SUBST
setopt PROMPT_PERCENT

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
unsetopt beep
bindkey -v
bindkey "^[[1;5D" backward-word
bindkey "^[[1;6D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;6C" forward-word

bindkey "^[[1;3D" beginning-of-line
bindkey "^[[1;4D" beginning-of-line
bindkey "^[[1;3C" end-of-line
bindkey "^[[1;4C" end-of-line

# misc completion settings
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 5
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/demonwav/.zshrc'

autoload -Uz compinit
fpath=($HOME/.zfunc $HOME/.zsh/gradle-completion $fpath)
compinit

autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Default is `"/(build|integTest|out)/"`
export GRADLE_COMPLETION_EXCLUDE_PATTERN="/(build|integTest|samples|smokeTest|testFixtures|templates|out|features)/"
# Essentially turn off checking for changed scripts
export GRADLE_COMPLETION_EXCLUDE_PATTERN="gradle"
