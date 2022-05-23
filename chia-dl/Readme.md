# Script to download anime from chia-anime.cc

[![asciicast: chia-dl demo](https://asciinema.org/a/489761.svg)](https://asciinema.org/a/489761)

# Dependencies
## Executables
> awk base64 bc convert curl cut date dd ffmpeg ffprobe 
> grep head jq js-beautify lsof lwp-request mkdir mv 
> notify-send openssl python3 rm sed sha256sum sort stat
> tac tail tput tr tty wc wget xargs xmllint
## Python 3 modules
> requests yaml numpy
## Perl modules
> LWP::Protocol::https
## Arch based distro
```sh
sudo pacman -Syu \
    bc coreutils curl ffmpeg findutils gawk grep \
    imagemagick jq libnotify libxml lsof ncurses \
    openssl perl-libwww perl-lwp-protocol-https \
    python python-jsbeautifier sed wget \
    python-numpy python-requests python-yaml
```

# Install
```sh
git clone https://github.com/ahmubashshir/anime-scripts
cd anime-scripts/chia-dl
./deps           # check for missing dependencies
cp chia-dl.cfg.example ~/.config/chia-dl.cfg
make prefix=~/bin install install-libbash
${EDITOR:-nano} ~/.config/chia-dl.cfg
```

# Update
```
make upgrade
```
