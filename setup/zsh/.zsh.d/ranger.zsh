if [ -x /usr/local/bin/ranger ]; then
    function ranger() {
        if [ -z "$RANGER_LEVEL" ]; then
            /usr/local/bin/ranger $@
        else
            exit
        fi
    }
fi
