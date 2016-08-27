Config {
         font = "xft:Sans-9:bold"
       , bgColor = "#1c1c1c"
       , fgColor = "#585858"
       , border = NoBorder
       , borderColor = "#26a69a"
       , position = Top
       , lowerOnStart = False
       , commands = [
                      Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Swap [] 10
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%cpu% | %memory% * %swap% } %StdinReader% { <fc=#ee9a00>%date%</fc>"
       }
