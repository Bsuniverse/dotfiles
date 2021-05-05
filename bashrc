if [ -f ~/.bashrc_local_before ]; then
	source ~/.bashrc_local_before
fi

export PYTHONSTARTUP=$HOME/.pythonrc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ -f ~/.bashrc_local_after ]; then
	source ~/.bashrc_local_after
fi
