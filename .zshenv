typeset -U path PATH
export PATH="/bin:/usr/bin:/usr/local/bin:$PATH"

path=(
   /usr/bin(N-/)
   /usr/local/bin(N-/)
   /usr/local/sbin(N-/)
   /usr/local/*/bin(N-/)
   /var/lib/gems/*/bin(N-/)
   /Library/Frameworks/Python.framework/Versions/3.4/bin(N-/)
   $path
)

