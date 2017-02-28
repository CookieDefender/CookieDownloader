@echo off
:start


set audio=
set audiod=
set audioform=
set pic=
set thumb=
set dl=

set /p dl="Enter URL: "


set /p audio="Would you like only the audio?[Y/N]
if /i "%audio%" == "Y" (
	set audiod=-x --extract-audio --audio-format
	set /p audioform="What format would you like it in?[best, aac, vorbis, mp3, m4a, opus, or wav]"
)
if /i "%audio%" == "N" (
	set audiod=
	goto:final
)
if /i NOT "%audioform%" == "mp3" (
	if /i NOT "%audioform%" == "m4a" (
		goto:final
	)
)

set /p pic="Would You Like the Thumbnail Embedded?[Y/N]

if /i "%pic%" == "Y" (
	set thumb=--embed-thumbnail
)
if /i "%pic%" == "N" (
	set thumb=
)

:final
"youtube-dl.exe" %dl% %thumb% %audiod% "%audioform%"
echo All done!
pause
goto:start