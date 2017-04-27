@echo off
:start


set audio=
set audiod=
set audioform=
set pic=
set thumb=
set dl=
set ffpath=
set playlist3=
set customdldir=
set dir=
set downloaddir=

set /p dl="Enter URL: "

set /p playlist3="Is this a playlist? [Y/N]	"

set /p customdldir="Would you like to set a custom download directory? [Y/N]	"

if /i "%customdldir%" == "N" (
	goto:playlist2
)

if /i "%customdldir%" == "Y" (
	set /p dir="Please enter DL Location	"
)
if /i "%playlist3%" == "Y" (
	set downloaddir=-o "%dir%/%%(playlist)s/%%(title)s.%%(ext)s"
	goto:core
)
if /i "%playlist3%" == "N" (
	set downloaddir=-o "%dir%/%%(title)s.%%(ext)s"
	goto:core
)


:playlist2

if /i "%playlist3%" == "Y" (
	set downloaddir=-o "/%%(playlist)s/%%(title)s.%%(ext)s"
)

if /i "%playlist3%" == "N" (
	set downloaddir=-o "Youtube Downloads/%%(title)s.%%(ext)s"
)

:core
set /p audio="Would you like only the audio?[Y/N]	"
if /i "%audio%" == "Y" (
	set audiod=-x --extract-audio --audio-format
	set /p audioform="What format would you like it in?[best, aac, vorbis, mp3, m4a, opus, or wav]	"
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

set /p pic="Would You Like the Thumbnail Embedded?[Y/N]	"

if /i "%pic%" == "Y" (
	set thumb=--embed-thumbnail
)
if /i "%pic%" == "N" (
	set thumb=
)

:final

"youtube-dl.exe" %dl% %thumb% %audiod% "%audioform%" %downloaddir%
echo All done!
pause
goto:start