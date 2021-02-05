# Script to download anime from dubbedanime.net

[![asciicast](https://asciinema.org/a/262000.svg)](https://asciinema.org/a/262000)

# Dependencies
## Executables
> awk bash dos2unix cd curl cut dd echo false ffmpeg ffprobe grep head jq lsof
> mkdir mv printf read readonly rm sed sha256sum sleep sort stat tac tail tput tr
> true wc wget xmllint js-beautify tee python3 gdbus chromedriver chromium
## Python 3 modules
> json numpy requests pydbus selenium
## Arch based distro
```
sudo pacman -Syu \
	curl dos2unix ffmpeg gawk grep jq libxml2 lsof ncurses \
	python python-jsbeautifier sed wget python-json python-numpy \
	python-requests chromium chromedriver python-selenium
```

# Install
```
git clone https://github.com/ahmubashshir/anime-scripts
cd anime-scripts/danime
cp danime.cfg.example ~/.config/danime.cfg
make prefix=~/bin install install-libbash install-spinner
${EDITOR:-nano} ~/.config/danime.cfg
```

# Update
```
make upgrade
```
