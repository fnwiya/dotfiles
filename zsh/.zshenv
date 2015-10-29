typeset -U path PATH
export PATH="/usr/local/bin:$PATH"
path=(
   /bin(N-/)
   /usr/bin(N-/)
   /usr/local/bin(N-/)
   /usr/local/sbin(N-/)
   /Library/Frameworks/Python.framework/Versions/3.4/bin(N-/)
   $path
)
