typeset -U path PATH
export PATH="/bin:/usr/bin:/usr/local/bin:$PATH"

path=(
    ~/bin(N-/)
    /usr/bin(N-/)
    /usr/local/bin(N-/)
    /usr/local/sbin(N-/)
    /usr/local/*/bin(N-/)
    # Debian GNU/Linux用
    /var/lib/gems/*/bin(N-/)
    # Python
    /Library/Frameworks/Python.framework/Versions/3.4/bin(N-/)
    $path
)

