if [ -f ~/.bashrc_local_before ]; then
	source ~/.bashrc_local_before
fi

export PYTHONSTARTUP=$HOME/.pythonrc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
INITIAL_QUERY="${*:-}"
IFS=: read -ra selected < <(
  FZF_DEFAULT_COMMAND="$RG_PREFIX $(printf %q "$INITIAL_QUERY")" \
  fzf --ansi \
      --disabled --query "$INITIAL_QUERY" \
      --bind "change:reload:sleep 0.1; $RG_PREFIX {q} || true" \
      --delimiter : \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
)
[ -n "${selected[0]}" ] && vim "${selected[0]}" "+${selected[1]}"

if [ -f ~/.bashrc_local_after ]; then
	source ~/.bashrc_local_after
fi
