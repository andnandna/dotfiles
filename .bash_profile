# .bash_profile

# User specific environment and startup programs
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/bitstar/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/Users/bitstar/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/bitstar/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/Users/bitstar/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda init <<<
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/andoh/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/andoh/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/andoh/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/andoh/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
