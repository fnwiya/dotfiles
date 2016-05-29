########################################
# z
########################################
if [ -e /usr/local/etc/profile.d/z.sh ] ;then
    _Z_CMD=j
    . /usr/local/etc/profile.d/z.sh
    function precmd_z () {
      _z --add "$(pwd -P)"
    }
	precmd_functions+=precmd_z
fi
