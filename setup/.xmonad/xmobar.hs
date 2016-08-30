Config {
         font = "xft:Sans-9:bold"
       , bgColor = "#333134"
       , fgColor = "#D0CDD9"
       , border = NoBorder
       , borderColor = "#D0CDD9"
       , position = TopW L 100
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
                    -- , Run BatteryP ["CMB1"]
                    --                [
                    --     "-t", " <acstatus> "
                    --     ,"-L", "20"
                    --     ,"-H","80"
                    --     ,"--low","#f44336"
                    --     ,"--normal","#ffffff"
                    --     ,"--",
                    --       "-o","<left>%(<timeleft>)"
                    --       ,"-O","Charging<left>%"
                    --       ,"-i","<left>%"
                    --     ] 50
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       -- , template = "%cpu% | %memory% | %swap% } %StdinReader% { %battery%%date% "
       , template = "%cpu% | %memory% | %swap% } %StdinReader% { %date% "
       }
