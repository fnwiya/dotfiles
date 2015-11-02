########################################
# directory
########################################
setopt auto_cd           # ディレクトリ名だけでcdする
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
#cdしたあとで、自動的に ls する(OS 別の設定)
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        function chpwd() { ls -A -G -F}
        ;;
    linux*)
        #Linux用の設定
        function chpwd() { ls -A -F --color=auto}
        ;;
esac
