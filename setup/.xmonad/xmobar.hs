Config {
         font = "xft:Sans-9:bold"
       , bgColor = "#333134"
       , fgColor = "#D0CDD9"
       , border = NoBorder
       , borderColor = "#D0CDD9"
       , position = Top
       , lowerOnStart = False
       , commands = [
                      Run Cpu [
                        "-L","3"
                        ,"-H","50"
                        ,"--normal","green"
                        ,"--high","red"
                        ] 10
                    , Run Memory [
                        "-t","Mem: <usedratio>%"
                        ] 10
                    , Run Swap [
                        ] 10
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%cpu% | %memory% * %swap% } %StdinReader% { %date% "
       }
