@echo off
:start
set /p dl="Enter URL: "


:final
"youtube-dl.exe" %dl% -x --extract-audio --audio-format "vorbis"
echo All done!
pause
goto:start