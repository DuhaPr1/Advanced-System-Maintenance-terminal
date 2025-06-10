call core\animation-utils.bat :INTRO_ANIMATION
set "log_file=logs\help_%date:~-4,4%%date:~-7,2%%date:~-10,2%_%time:~0,2%%time:~3,2%%time:~6,2%.log"
set "log_file=%log_file: =0%"
echo Help System - Log started at %date% %time% > "%log_file%"