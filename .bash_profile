# .bash_profile
# Get the aliases and functions

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/andoh/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/andoh/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andoh/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/andoh/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
