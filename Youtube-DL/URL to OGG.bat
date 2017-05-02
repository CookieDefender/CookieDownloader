@echo off
:start
set dl=
set download=


set /p dl="Enter URL: "
set downloaddir=-o "Youtube Downloads/%%(title)s.%%(ext)s"

:final
"youtube-dl.exe" %dl% -x --extract-audio --audio-format "vorbis" %downloaddir%
echo All done!
pause
goto:start