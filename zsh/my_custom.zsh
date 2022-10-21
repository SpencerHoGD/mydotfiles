# You can put files here to add functionality separated per file, which
# will be ignored by git.
# Files on the custom/ directory will be automatically loaded by the init
# script, in alphabetical order.

# For example: add yourself some shortcuts to projects you often work on.
#
# brainstormr=~/Projects/development/planetargon/brainstormr
# cd $brainstormr
#
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="bg='ff5fff',bold,underline"

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
unset ZSH_AUTOSUGGEST_USE_ASYNC

ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"
ZSH_AUTOSUGGEST_HISTORY_IGNORE="?(#c50,)"

bindkey '^ ' autosuggest-accept
