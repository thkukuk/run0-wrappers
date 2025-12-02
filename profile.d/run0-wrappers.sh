# alias <tool> to run0-<tool> if no_new_privs is enabled
if [ "$is" = 'bash' ] && nnpenabled; then
    alias su=run0-su
    alias sudo=run0-sudo
    alias pkexec=run0-pkexec
fi

