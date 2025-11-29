# alias su to run0-su if no_new_privs is enabled
if [ "$is" = 'bash' ] && nnpenabled; then
    alias su=run0-su
    alias sudo=run0-sudo
fi

