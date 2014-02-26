if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.script" ] ; then
    PATH="$HOME/.script:$PATH"
fi
