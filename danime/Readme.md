# Script to download anime from 1anime.to

[![asciicast](https://asciinema.org/a/262000.svg)](https://asciinema.org/a/262000)

# Dependencies
## Executables
> awk curl cut dd false ffmpeg ffprobe grep head jq lsof
> mkdir mv printf rm sed sha256sum sleep sort stat tail tput tr
> true wc wget xmllint js-beautify python3
## Python 3 modules
> json numpy requests pydbus selenium
## Arch based distro
```
sudo pacman -Syu \
	curl ffmpeg gawk grep jq libxml2 lsof ncurses \
	python python-jsbeautifier sed wget python-json python-numpy \
	python-requests
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
