#!/bin/sh

# sync-local script from SerenityOS demo setup.

set -e

cat << 'EOF' > mnt/etc/Keyboard.ini
[Mapping]
Keymaps=en-gb,de
Keymap=en-gb
EOF

cat << 'EOF' > mnt/etc/WindowServer.ini
[Theme]
Name=Default

[Screens]
MainScreen=0

[Screen0]
Mode=Device
Device=/dev/gpu/connector0
Left=0
Top=0
Width=1920
Height=1080
ScaleFactor=1

[Fonts]
Default=Katica 10 400 0
WindowTitle=Katica 10 700 0
FixedWidth=Csilla 10 400 0

[Mouse]
AccelerationFactor=1.0
ScrollStepSize=4
CursorTheme=Default
ButtonsSwitched=false

[Graphics]
OverlayRectShadow=/res/graphics/overlay-rect-shadow.png

[Input]
DoubleClickSpeed=250

[Background]
Wallpaper=/res/wallpapers/grid.png
Mode=stretch

[Applet]
Order=Audio,WorkspacePicker,CPUGraph,MemoryGraph,NetworkGraph,Network,ClipboardHistory,Keymap

[Workspaces]
Rows=3
Columns=3
EOF

cat << 'EOF' > mnt/home/anon/.config/Terminal.ini
[Startup]
Command=Shell
[Terminal]
ShowScrollBar=true
MaxHistorySize=1024
[Window]
Opacity=238
Bell=Visible
ColorScheme=Default
EOF

cat << 'EOF' > mnt/home/anon/.config/SystemMonitor.ini
[Monitor]
Frequency=3
EOF

cat << 'EOF' > mnt/home/anon/.config/Taskbar.ini
[QuickLaunch]
Browser=Browser.af
Terminal=Terminal.af
FileManager=FileManager.af
EOF

cat << 'EOF' > mnt/home/anon/.config/FileManager.ini
[DirectoryView]
ShowDotFiles=true
ViewMode=Icon
EOF

cat << 'EOF' > mnt/home/anon/.config/Browser.ini
[Preferences]
ShowBookmarksBar=true
EnableContentFilters=true
CloseDownloadWidgetOnFinish=false
SearchEngine=https://www.duckduckgo.com/?q={}
ColorScheme=auto
Home=https://events.ccc.de/congress/2023/infos/startpage.html
EOF

cat << 'EOF' > mnt/home/anon/.config/bookmarks.json
[
	{
		"title": "37c3",
		"url": "https://events.ccc.de/congress/2023/infos/startpage.html"
	},
	{
		"title": "Fahrplan",
		"url": "https://events.ccc.de/congress/2023/hub/en/fahrplan"
	},
	{
		"title": "SerenityOS.org",
		"url": "https://serenityos.org/"
	},
	{
		"title": "GitHub",
		"url": "https://github.com/SerenityOS/serenity"
	},
	{
		"title": "DuckDuckGo",
		"url": "https://duckduckgo.com/"
	}
]
EOF

cat << 'EOF' > mnt/home/anon/.config/AudioApplet.ini
[Applet]
ShowPercent=true
EOF

chown 100 mnt/home/anon/.config/AudioApplet.ini
chown 100 mnt/home/anon/.config/Browser.ini
chown 100 mnt/home/anon/.config/SystemMonitor.ini

cat << 'EOF' > mnt/etc/timezone
Europe/Berlin
EOF

rsync -aH --inplace --update '%SCRIPT_SOURCE%/Desktop/' mnt/home/anon/Desktop

ln -sf /bin/CatDog mnt/home/anon/Desktop
ln -sf /bin/WidgetGallery mnt/home/anon/Desktop
ln -sf /bin/FontEditor mnt/home/anon/Desktop
ln -sf /bin/HackStudio mnt/home/anon/Desktop
ln -sf /bin/GMLPlayground mnt/home/anon/Desktop
ln -sf /bin/HexEditor mnt/home/anon/Desktop
ln -sf /bin/2048 mnt/home/anon/Desktop
ln -sf /bin/Chess mnt/home/anon/Desktop
ln -sf /bin/GameOfLife mnt/home/anon/Desktop
ln -sf /usr/local/bin/supertuxkart mnt/home/anon/Desktop
ln -sf /bin/Solitaire mnt/home/anon/Desktop
ln -sf /bin/Minesweeper mnt/home/anon/Desktop
ln -sf /bin/PixelPaint mnt/home/anon/Desktop
ln -sf /bin/Maps mnt/home/anon/Desktop
ln -sf /bin/Piano mnt/home/anon/Desktop
ln -sf /bin/Calendar mnt/home/anon/Desktop
ln -sf /bin/Spreadsheet mnt/home/anon/Desktop
ln -sf /bin/Assistant mnt/home/anon/Desktop
ln -sf /bin/Calculator mnt/home/anon/Desktop
ln -sf /bin/Magnifier mnt/home/anon/Desktop
ln -sf /bin/SpaceAnalyzer mnt/home/anon/Desktop
ln -sf /bin/SystemMonitor mnt/home/anon/Desktop
ln -sf /res/graphics/brand-banner-2x.png mnt/home/anon/Desktop

ln -sf ../Videos/test-webm.webm mnt/home/anon/Desktop
ln -sf '../Documents/3D Models/teapot.obj' mnt/home/anon/Desktop

chown 100 -R mnt/home/anon/Desktop
