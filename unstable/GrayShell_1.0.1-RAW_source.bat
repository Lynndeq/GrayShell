@echo off

:launch
@echo off
if exist C:\Windows\System32\WindowsPowerShell\v1.0\PowerShell.exe (
    powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
) else (
    goto nopssh
)
powershell /c write-host -back black -fore black -nonewline Z
powershell /c write-host -back green -fore white Daemon started...
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back black -fore black -nonewline Z
powershell /c write-host -back green -fore white Configuring...
if exist C:\Windows\System32\WindowsPowerShell\v1.0\PowerShell.exe (
    goto sudoch
) else (
    goto nopssh
)
:sudoch
if exist C:\Windows\System32\Sudo.exe (
    goto confsh
) else (
    goto nosudo
)
:confsh
cd %SystemRoot%/System32
set curdir=%cd%
:start
color %color01%%color02%
cls
set input=0
set color01=0
set color02=3
set color11=0
set color12=4
set suinput=0
set currentback=green
set root=C:\Windows
set sys=C:\
set usrfil=C:\Users
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back cyan -fore cyan -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
goto cmd
:curdir
cls
powershell /c write-host -back white -fore black %curdir%
goto cmd
:chdir
cls
powershell /c write-host -fore darkcyan Enter directory path:
set /p dir="> "
cd %dir%
set curdir=%dir%
cls
goto cmd
:curdirsu
cls
powershell /c write-host -back white -fore black %curdir%
goto sucmd
:chdirsu
cls
powershell /c write-host -fore darkred Enter directory path:
set /p dir="> "
cd %dir%
set curdir=%dir%
cls
goto sucmd
:cmd
powershell /c write-host -fore darkcyan Enter the command:
set /p input="> "
if %input% == su goto sucmdenter
if %input% == xmd goto xmd
if %input% == 0 goto clearcmd
if %input% == return goto return
if %input% == chenv goto chenv
if %input% == curdir goto curdir
if %input% == chdir goto chdir
if %input% == enablechatclear goto clearcmd
if %input% == disablechatclear goto stchtnclr
if %input% == remsh goto remsh
powershell /c %input%
set input=0
goto clearcmd
:clearcmd
cls
goto cmd
:sucmdenter
cls
color %color11%%color12%
powershell /c write-host -back red -fore white WARNING!!!
powershell /c write-host -back black -fore red You was switched to Superuser Mode! This may corrupt your OS!
echo.
powershell /c write-host -fore darkred Enter the command:
set /p suinput="# "
if %suinput% == xmd goto suxmd
if %suinput% == return goto rtrn
if %suinput% == usr goto start
if %suinput% == chenv goto chenvsu
if %suinput% == 0 goto suclearcmd
if %suinput% == curdir goto curdirsu
if %suinput% == chdir goto chdirsu
if %suinput% == enablechatclear goto suclearcmd
if %suinput% == disablechatclear goto suclearcmd9
if %suinput% == remsh goto suremsh
powershell /c sudo %suinput%
set suinput=0
goto suclearcmd
:sucmd
powershell /c write-host -fore darkred Enter the command:
set /p suinput="# "
if %suinput% == xmd goto suxmd
if %suinput% == return goto rtrn
if %suinput% == usr goto start
if %suinput% == 0 goto suclearcmd
if %suinput% == chenv goto chenvsu
if %suinput% == curdir goto curdirsu
if %suinput% == chdir goto chdirsu
if %suinput% == enablechatclear goto suclearcmd
if %suinput% == disablechatclear goto suclearcmd9
if %suinput% == remsh goto suremsh
powershell /c sudo %suinput%
set suinput=0
goto suclearcmd
:sucmdchenv
color %color11%%color12%
cls
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
powershell /c write-host -fore darkred Enter the command:
set /p suinput="# "
if %suinput% == xmd goto suxmd
if %suinput% == return goto rtrn
if %suinput% == usr goto start
if %suinput% == 0 goto suclearcmd
if %suinput% == chenv goto chenvsu
if %suinput% == enablechatclear goto suclearcmd
if %suinput% == disablechatclear goto suclearcmd9
if %suinput% == remsh goto suremsh
powershell /c sudo %suinput%
set suinput=0
goto suclearcmd
:suclearcmd
cls
goto sucmd
:xmd
cls
set xmdinput=0
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back darkcyan -fore darkcyan -nonewline Z
powershell /c write-host -back darkcyan -fore white -nonewline XMD Mode
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
powershell /c write-host -fore darkred Enter the XMD command:
set /p xmdinput="$ "
if %xmdinput% == return goto return
if %xmdinput% == 0 goto xmd
if %xmdinput% == disablechatclear goto xmd9
if %xmdinput% == remsh goto remsh
cmd /c %xmdinput%
goto xmd
:suxmd
cls
set xmdinput=0
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back darkcyan -fore darkcyan -nonewline Z
powershell /c write-host -back darkcyan -fore white -nonewline XMD Mode
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
powershell /c write-host -fore darkred Enter the XMD command:
set /p xmdinput="$ "
if %xmdinput% == return goto rtrn
if %xmdinput% == 0 goto suxmd
if %xmdinput% == disablechatclear goto suxmd
if %xmdinput% == remsh goto remsh
sudo cmd /c %xmdinput%
goto xmd
:rtrn
cls
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
goto sucmd
:return
cls
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
goto cmd
:rtrn2
cls
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
goto sucmd
:chenv
cls
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Appearance customizer
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Choose your new BACK color:
powershell /c write-host -back black -fore white [BLACK=0]
powershell /c write-host -back darkblue -fore white [BLUE=1]
powershell /c write-host -back darkgreen -fore white [GREEN=2]
powershell /c write-host -back darkcyan -fore white [CYAN=3]
powershell /c write-host -back darkred -fore white [RED=4]
powershell /c write-host -back darkmagenta -fore white [PURPLE=5]
powershell /c write-host -back darkyellow -fore white [YELLOW=6]
powershell /c write-host -back darkgray -fore black [DARKGRAY=7]
powershell /c write-host -back gray -fore black [GRAY=8]
powershell /c write-host -back blue -fore white [LIGHTBLUE=9]
powershell /c write-host -back green -fore white [LIGHTGREEN=A]
powershell /c write-host -back cyan -fore white [LIGHTCYAN=B]
powershell /c write-host -back red -fore white [LIGHTRED=C]
powershell /c write-host -back magenta -fore white [LIGHTPURPLE=D]
powershell /c write-host -back yellow -fore black [LIGHTYELLOW=E]
powershell /c write-host -back white -fore black [WHITE=F]
powershell /c write-host -back black -fore white [SKIP=Press Enter]
set /p color01="> "
cls
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Appearance customizer
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Choose your new FORE color:
powershell /c write-host -back black -fore white [BLACK=0]
powershell /c write-host -back darkblue -fore white [BLUE=1]
powershell /c write-host -back darkgreen -fore white [GREEN=2]
powershell /c write-host -back darkcyan -fore white [CYAN=3]
powershell /c write-host -back darkred -fore white [RED=4]
powershell /c write-host -back darkmagenta -fore white [PURPLE=5]
powershell /c write-host -back darkyellow -fore white [YELLOW=6]
powershell /c write-host -back darkgray -fore black [DARKGRAY=7]
powershell /c write-host -back gray -fore black [GRAY=8]
powershell /c write-host -back blue -fore white [LIGHTBLUE=9]
powershell /c write-host -back green -fore white [LIGHTGREEN=A]
powershell /c write-host -back cyan -fore white [LIGHTCYAN=B]
powershell /c write-host -back red -fore white [LIGHTRED=C]
powershell /c write-host -back magenta -fore white [LIGHTPURPLE=D]
powershell /c write-host -back yellow -fore black [LIGHTYELLOW=E]
powershell /c write-host -back white -fore black [WHITE=F]
powershell /c write-host -back black -fore white [SKIP=Press Enter]
set /p color02="> "
goto start
:chenvsu
cls
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Appearance customizer
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Choose your new BACK color:
powershell /c write-host -back black -fore white [BLACK=0]
powershell /c write-host -back darkblue -fore white [BLUE=1]
powershell /c write-host -back darkgreen -fore white [GREEN=2]
powershell /c write-host -back darkcyan -fore white [CYAN=3]
powershell /c write-host -back darkred -fore white [RED=4]
powershell /c write-host -back darkmagenta -fore white [PURPLE=5]
powershell /c write-host -back darkyellow -fore white [YELLOW=6]
powershell /c write-host -back darkgray -fore black [DARKGRAY=7]
powershell /c write-host -back gray -fore black [GRAY=8]
powershell /c write-host -back blue -fore white [LIGHTBLUE=9]
powershell /c write-host -back green -fore white [LIGHTGREEN=A]
powershell /c write-host -back cyan -fore white [LIGHTCYAN=B]
powershell /c write-host -back red -fore white [LIGHTRED=C]
powershell /c write-host -back magenta -fore white [LIGHTPURPLE=D]
powershell /c write-host -back yellow -fore black [LIGHTYELLOW=E]
powershell /c write-host -back white -fore black [WHITE=F]
powershell /c write-host -back black -fore white [SKIP=Press Enter]
set /p color11="> "
cls
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Appearance customizer
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Choose your new FORE color:
powershell /c write-host -back black -fore white [BLACK=0]
powershell /c write-host -back darkblue -fore white [BLUE=1]
powershell /c write-host -back darkgreen -fore white [GREEN=2]
powershell /c write-host -back darkcyan -fore white [CYAN=3]
powershell /c write-host -back darkred -fore white [RED=4]
powershell /c write-host -back darkmagenta -fore white [PURPLE=5]
powershell /c write-host -back darkyellow -fore white [YELLOW=6]
powershell /c write-host -back darkgray -fore black [DARKGRAY=7]
powershell /c write-host -back gray -fore black [GRAY=8]
powershell /c write-host -back blue -fore white [LIGHTBLUE=9]
powershell /c write-host -back green -fore white [LIGHTGREEN=A]
powershell /c write-host -back cyan -fore white [LIGHTCYAN=B]
powershell /c write-host -back red -fore white [LIGHTRED=C]
powershell /c write-host -back magenta -fore white [LIGHTPURPLE=D]
powershell /c write-host -back yellow -fore black [LIGHTYELLOW=E]
powershell /c write-host -back white -fore black [WHITE=F]
powershell /c write-host -back black -fore white [SKIP=Press Enter]
set /p color12="> "
goto sucmdchenv
:stchtnclr
color %color01%%color02%
cls
set input=0
set color01=0
set color02=3
set color11=0
set color12=4
set suinput=0
set currentback=green
set root=C:\Windows
set sys=C:\
set usrfil=C:\Users
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
goto cmd9
:curdir9
powershell /c write-host -back white -fore black %curdir%
goto cmd9
:chdir9
powershell /c write-host -fore darkcyan Enter directory path:
set /p dir="> "
cd %dir%
set curdir=%dir%
goto cmd9
:curdirsu9
powershell /c write-host -back white -fore black %curdir%
goto sucmd9
:chdirsu9
powershell /c write-host -fore darkred Enter directory path:
set /p dir="> "
cd %dir%
set curdir=%dir%
goto sucmd9
:cmd9
powershell /c write-host -fore darkcyan Enter the command:
set /p input="> "
if %input% == su goto sucmdenter9
if %input% == xmd goto xmd9
if %input% == 0 goto clearcmd9
if %input% == return goto return9
if %input% == chenv goto chenv9
if %input% == curdir goto curdir9
if %input% == chdir goto chdir9
if %input% == enablechatclear goto clearcmd
if %input% == disablechatclear goto stchtnclr
if %input% == remsh goto remsh
powershell /c %input%
set input=0
goto clearcmd9
:clearcmd9
goto cmd9
:sucmdenter9
color %color11%%color12%
powershell /c write-host -back red -fore white WARNING!!!
powershell /c write-host -back black -fore red You was switched to Superuser Mode! This may corrupt your OS!
echo.
powershell /c write-host -fore darkred Enter the command:
set /p suinput="# "
if %suinput% == xmd goto suxmd9
if %suinput% == return goto rtrn9
if %suinput% == usr goto stchtnclr
if %suinput% == chenv goto chenvsu9
if %suinput% == 0 goto suclearcmd9
if %suinput% == curdir goto curdirsu9
if %suinput% == chdir goto chdirsu9
if %suinput% == disablechatclear goto sucmd9
if %suinput% == enablechatclear goto suclearcmd
if %suinput% == remsh goto suremsh
powershell /c sudo %suinput%
set suinput=0
goto suclearcmd9
:sucmd9
powershell /c write-host -fore darkred Enter the command:
set /p suinput="# "
if %suinput% == xmd goto suxmd9
if %suinput% == return goto rtrn9
if %suinput% == usr goto stchtnclr
if %suinput% == 0 goto suclearcmd9
if %suinput% == chenv goto chenvsu9
if %suinput% == curdir goto curdirsu9
if %suinput% == chdir goto chdirsu9
if %suinput% == disablechatclear goto sucmd9
if %suinput% == enablechatclear goto suclearcmd
if %suinput% == remsh goto suremsh
powershell /c sudo %suinput%
set suinput=0
goto suclearcmd9
:sucmdchenv9
color %color11%%color12%
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
powershell /c write-host -fore darkred Enter the command:
set /p suinput="# "
if %suinput% == xmd goto suxmd9
if %suinput% == return goto rtrn9
if %suinput% == usr goto stchtnclr
if %suinput% == 0 goto suclearcmd9
if %suinput% == chenv goto chenvsu9
if %suinput% == disablechatclear goto sucmd9
if %suinput% == enablechatclear goto suclearcmd
if %suinput% == remsh goto suremsh
powershell /c sudo %suinput%
set suinput=0
goto suclearcmd9
:suclearcmd9
goto sucmd9
:xmd9
set xmdinput=0
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back darkcyan -fore darkcyan -nonewline Z
powershell /c write-host -back darkcyan -fore white -nonewline XMD Mode
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
powershell /c write-host -fore darkred Enter the XMD command:
set /p xmdinput="$ "
if %xmdinput% == return goto return9
if %xmdinput% == 0 goto xmd9
if %xmdinput% == remsh goto remsh
cmd /c %xmdinput%
goto xmd9
:suxmd9
set xmdinput=0
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back darkcyan -fore darkcyan -nonewline Z
powershell /c write-host -back darkcyan -fore white -nonewline XMD Mode
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
powershell /c write-host -fore darkred Enter the XMD command:
set /p xmdinput="$ "
if %xmdinput% == return goto rtrn9
if %xmdinput% == 0 goto suxmd9
if %xmdinput% == remsh goto remsh
sudo cmd /c %xmdinput%
goto xmd9
:rtrn9
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
goto sucmd9
:return9
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
goto cmd9
:rtrn29
powershell /c write-host -back darkgray -fore white -nonewline GrayShell
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back red -fore white 1.0.1-RAW
echo.
goto sucmd9
:chenv9
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Appearance customizer
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Choose your new BACK color:
powershell /c write-host -back black -fore white [BLACK=0]
powershell /c write-host -back darkblue -fore white [BLUE=1]
powershell /c write-host -back darkgreen -fore white [GREEN=2]
powershell /c write-host -back darkcyan -fore white [CYAN=3]
powershell /c write-host -back darkred -fore white [RED=4]
powershell /c write-host -back darkmagenta -fore white [PURPLE=5]
powershell /c write-host -back darkyellow -fore white [YELLOW=6]
powershell /c write-host -back darkgray -fore black [DARKGRAY=7]
powershell /c write-host -back gray -fore black [GRAY=8]
powershell /c write-host -back blue -fore white [LIGHTBLUE=9]
powershell /c write-host -back green -fore white [LIGHTGREEN=A]
powershell /c write-host -back cyan -fore white [LIGHTCYAN=B]
powershell /c write-host -back red -fore white [LIGHTRED=C]
powershell /c write-host -back magenta -fore white [LIGHTPURPLE=D]
powershell /c write-host -back yellow -fore black [LIGHTYELLOW=E]
powershell /c write-host -back white -fore black [WHITE=F]
powershell /c write-host -back black -fore white [SKIP=Press Enter]
set /p color01="> "
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Appearance customizer
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Choose your new FORE color:
powershell /c write-host -back black -fore white [BLACK=0]
powershell /c write-host -back darkblue -fore white [BLUE=1]
powershell /c write-host -back darkgreen -fore white [GREEN=2]
powershell /c write-host -back darkcyan -fore white [CYAN=3]
powershell /c write-host -back darkred -fore white [RED=4]
powershell /c write-host -back darkmagenta -fore white [PURPLE=5]
powershell /c write-host -back darkyellow -fore white [YELLOW=6]
powershell /c write-host -back darkgray -fore black [DARKGRAY=7]
powershell /c write-host -back gray -fore black [GRAY=8]
powershell /c write-host -back blue -fore white [LIGHTBLUE=9]
powershell /c write-host -back green -fore white [LIGHTGREEN=A]
powershell /c write-host -back cyan -fore white [LIGHTCYAN=B]
powershell /c write-host -back red -fore white [LIGHTRED=C]
powershell /c write-host -back magenta -fore white [LIGHTPURPLE=D]
powershell /c write-host -back yellow -fore black [LIGHTYELLOW=E]
powershell /c write-host -back white -fore black [WHITE=F]
powershell /c write-host -back black -fore white [SKIP=Press Enter]
set /p color02="> "
goto cmd
:chenvsu9
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Appearance customizer
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Choose your new BACK color:
powershell /c write-host -back black -fore white [BLACK=0]
powershell /c write-host -back darkblue -fore white [BLUE=1]
powershell /c write-host -back darkgreen -fore white [GREEN=2]
powershell /c write-host -back darkcyan -fore white [CYAN=3]
powershell /c write-host -back darkred -fore white [RED=4]
powershell /c write-host -back darkmagenta -fore white [PURPLE=5]
powershell /c write-host -back darkyellow -fore white [YELLOW=6]
powershell /c write-host -back darkgray -fore black [DARKGRAY=7]
powershell /c write-host -back gray -fore black [GRAY=8]
powershell /c write-host -back blue -fore white [LIGHTBLUE=9]
powershell /c write-host -back green -fore white [LIGHTGREEN=A]
powershell /c write-host -back cyan -fore white [LIGHTCYAN=B]
powershell /c write-host -back red -fore white [LIGHTRED=C]
powershell /c write-host -back magenta -fore white [LIGHTPURPLE=D]
powershell /c write-host -back yellow -fore black [LIGHTYELLOW=E]
powershell /c write-host -back white -fore black [WHITE=F]
powershell /c write-host -back black -fore white [SKIP=Press Enter]
set /p color11="> "
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Appearance customizer
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Choose your new FORE color:
powershell /c write-host -back black -fore white [BLACK=0]
powershell /c write-host -back darkblue -fore white [BLUE=1]
powershell /c write-host -back darkgreen -fore white [GREEN=2]
powershell /c write-host -back darkcyan -fore white [CYAN=3]
powershell /c write-host -back darkred -fore white [RED=4]
powershell /c write-host -back darkmagenta -fore white [PURPLE=5]
powershell /c write-host -back darkyellow -fore white [YELLOW=6]
powershell /c write-host -back darkgray -fore black [DARKGRAY=7]
powershell /c write-host -back gray -fore black [GRAY=8]
powershell /c write-host -back blue -fore white [LIGHTBLUE=9]
powershell /c write-host -back green -fore white [LIGHTGREEN=A]
powershell /c write-host -back cyan -fore white [LIGHTCYAN=B]
powershell /c write-host -back red -fore white [LIGHTRED=C]
powershell /c write-host -back magenta -fore white [LIGHTPURPLE=D]
powershell /c write-host -back yellow -fore black [LIGHTYELLOW=E]
powershell /c write-host -back white -fore black [WHITE=F]
powershell /c write-host -back black -fore white [SKIP=Press Enter]
set /p color12="> "
goto sucmdchenv9
:remsh
cls
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Remote shell connection
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Enter the host IP:
set /p hostip="> "
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Remote shell connection
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Enter the login user: 
set /p loginuser="> "
cmd /c ssh %loginuser%@%hostip%
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back red -fore red -nonewline Z
powershell /c write-host -back red -fore white SESSIONEXP: 0x027
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back yellow -fore yellow -nonewline Z
powershell /c write-host -back yellow -fore black Press any key to continue...
pause >NUL
cls
goto cmd
:suremsh
cls
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Remote shell connection
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Enter the host IP:
set /p hostip="> "
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Remote shell connection
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back %currentback% -fore %currentback% -nonewline Z
powershell /c write-host -back green -fore white Enter the login user: 
set /p loginuser="> "
cmd /c ssh %loginuser%@%hostip%
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back red -fore red -nonewline Z
powershell /c write-host -back red -fore white SESSIONEXP: 0x027
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back yellow -fore yellow -nonewline Z
powershell /c write-host -back yellow -fore black Press any key to continue...
pause >NUL
cls
goto sucmd
:nopssh
color 04
echo You are using system with no libbssh support!
echo Please install required libs and initialize GrayShell again
echo.
echo Press any key to exit
pause >NUL
exit
:nosudo
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back red -fore red -nonewline Z
powershell /c write-host -back red -fore white You are using system with no Sudo support!
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back red -fore red -nonewline Z
powershell /c write-host -back red -fore white Please update your system to actual version or install SUDO package
powershell /c write-host -back darkgray -fore white -nonewline [GrayShell]
powershell /c write-host -back yellow -fore yellow -nonewline Z
powershell /c write-host -back yellow -fore black Press any key to continue without SU support...
pause >NUL
goto confsh
exit
