# ZSH CONFIGURATION
#
# - use git config --add oh-my-zsh.hide-status 1
#   for very big repositories to disable status
#   checking and greatly improves speed

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nowrep"

plugins=(git archlinux colored-man-pages safe-paste)

source $ZSH/oh-my-zsh.sh

# Track cwd
osc7_cwd() {
    printf '\e]7;file://%s%s\e\\' "$(omz_urlencode -P $HOST)" "$(omz_urlencode -P "$PWD")"
}
autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd osc7_cwd

# foot workaround
bindkey "\e[27;2;13~" accept-line # shift+return
bindkey "\e[27;5;13~" accept-line # ctrl+return
bindkey "\e[27;3;9~" beep # alt+tab

# No shared history
unsetopt share_history

# Disable highlighting paste
zle_highlight=(none)

# Vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# Set longer history
export HISTSIZE=100000
export HISTFILESIZE=100000
export LISTMAX=9999
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear:ll"

# Change default shell text editor
export EDITOR=/usr/bin/nvim

# Change default shell pager
export PAGER="less -i"
export LESSHISTFILE=/dev/null
alias less=$PAGER

# fzf
export FZF_DEFAULT_COMMAND="ag -l"
export FZF_DEFAULT_OPTS="--preview 'cat {}'"

# make
export MAKEFLAGS="-j24"

# gpg
export GPG_TTY=$(tty)

# Aliases
alias ls="exa"
alias ll="ls -l"
alias monitor_off="xset dpms force off"
alias grep="grep --color=auto"
alias cdq="cd ~/Programming/Qt-C++/QupZilla"
alias cdf="cd ~/Programming/Qt-C++/falkon"
alias cdk="cd /media/Data/KDE"
alias cds="cd ~/Documents/skola"
alias cdp="cd ~/Documents/prace"
alias dmesg="journalctl -b"
alias diff="colordiff"
alias valgrind-full="valgrind --leak-check=full --show-reachable=yes --track-origins=yes"
alias kf5-env="source /media/Data/KDE/env.sh"
alias callgrind="valgrind --tool=callgrind"
alias cmake="cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -GNinja"
alias kf5-cmake="cmake .. -DCMAKE_CXX_FLAGS:STRING=-pipe -DCMAKE_INSTALL_PREFIX=/media/Data/KDE"
alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'
alias pingg='ping -c 3 8.8.8.8'
alias objdump='objdump -M intel'
alias hukotvpn="(cd ~/Documents/vpn && sudo openvpn client.conf)"
alias radeontop='radeontop -c -T'
alias rocm-smi='/opt/rocm/bin/rocm-smi'

# Sudo aliases
alias sudo="nocorrect sudo "
alias powertop="sudo powertop"
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias adb-stop="sudo adb kill-server"

# Pac aliases
alias aa='yay'
alias asearch='pacman -Ss'
alias aasearch='yay -as'
alias aup='yay -Syu'
alias ain='sudo pacman -S'
alias aain='yay -y'
alias ains='sudo pacman -U'
alias are='sudo pacman -Rsn'

function cdbuild {
    local outdir=$(echo $PWD | sed "s/source/source\/build/g")
    cd $outdir
}

function backuphome {
    cd
    tar -cvJ \
        --exclude '*.o' \
        --exclude '.git/*' \
        --exclude 'build/*' \
        --exclude 'flatpak' \
        --exclude 'Steam' \
        -f /media/Data/Backup/backup_`date +%Y%m%d`.tar.xz \
        Documents \
        Pictures \
        Programming \
        .config \
        .thunderbird \
        .mozilla \
        .oh-my-zsh \
        .ssh \
        .electrum \
        .filezilla \
        .local \
        && echo "Backup successfull!"

    cd -
}

function avahi-ip {
    avahi-resolve -n "$1".local | cut -f2
}

function encode_c7 {
    ffmpeg -i "$1" -threads 4 -vcodec libx264 -s 640x360 -strict experimental out.mp4
}

function encode_motog {
    ffmpeg -i "$1" -threads 4 -vcodec libx264 -s 1280x720 -strict experimental out.mp4
}

function encode_psvr {
    local input="$1"
    local output=${input:s/.mp4/_180_sbs.mp4}
    local height=`mediainfo --Inform="Video;%Height%" "$input"`
    local scale="w=3800:h=1900"
    local bitrate="20000k"
    if [ $height -le 1440 ]; then
        scale="w=2880:h=1440"
        bitrate="17500k"
    elif [ $height -le 1600 ]; then
        scale="w=3200:h=1600"
        bitrate="18000k"
    fi
    ffmpeg -i "$input" -y -acodec aac -ar 48000 -ac 2 -b:a 192k -vcodec libx264 -b:v $bitrate -filter:v scale=$scale -f mp4 -pix_fmt yuv420p -profile:v High -level:v 5.1 -bf 0 -slices 24 -refs 1 -threads 0 -x264opts no-cabac:aq-mode=1:aq-strength=0.7:slices=24:direct=spatial:me=tesa:subme=8:trellis=1 -flags +global_header -map_metadata -1 "$output"
}

function encode_go {
    local input="$1"
    local output=${input:s/.mp4/180x180_3dh.mp4}
    local height=`mediainfo --Inform="Video;%Height%" "$input"`
    local scale="w=4096:h=2048"
    local bitrate="25000k"
    if [ $height -le 1440 ]; then
        scale="w=2880:h=1440"
        bitrate="17500k"
    elif [ $height -le 1600 ]; then
        scale="w=3200:h=1600"
        bitrate="18000k"
    fi
    ffmpeg -i "$input" -y -acodec aac -ar 48000 -ac 2 -b:a 192k -vcodec libx264 -b:v $bitrate -filter:v scale=$scale -f mp4 -pix_fmt yuv420p -profile:v High -level:v 5.1 -bf 0 -slices 24 -refs 1 -threads 0 -x264opts no-cabac:aq-mode=1:aq-strength=0.7:slices=24:direct=spatial:me=tesa:subme=8:trellis=1 -flags +global_header -map_metadata -1 "$output"
}

function encode_8bit {
    local tmpfile=/tmp/8bit.mkv
    x264 --tune animation --crf 18 -o $tmpfile "$1"
    mkvmerge -o "$1.8bit.mkv" -D "$1" -A -S -T -M -B $tmpfile
    rm $tmpfile
}

function shares-start {
    cd ~/Shares/webdav/
    nohup ./dave > /dev/null 2>&1 &
    cd - > /dev/null
}

function shares-stop {
    pkill dave
}

function dlna-start {
    sudo systemctl start minidlna
}

function dlna-stop {
    sudo systemctl stop minidlna
}

function vita-env {
    export VITASDK=/media/Data/Vita/SDK/vitasdk
    export PATH=$VITASDK/bin:$PATH
}

function 3ds-env {
    export DEVKITPRO=/media/Data/3DS/SDK
    export DEVKITARM=$DEVKITPRO/devkitARM
    export PATH=$PATH:$DEVKITARM/bin:/media/Data/3DS/tools
}

function android-env {
    export ANDROID_SDK_ROOT=/media/Data/Android/Sdk
    export ANDROID_NDK_ROOT=/media/Data/Android/android-ndk-r15c
    export PATH=/media/Data/Android/Qt-5.9.2/5.9.2/android_armv7/bin:$PATH
}

function record-desktop {
    if [ -n "$WAYLAND_DISPLAY" ]; then
        wf-recorder -a"alsa_output.pci-0000_0c_00.4.analog-stereo.monitor" -p preset=superfast
    else
        ffmpeg -video_size 2560x1440 -draw_mouse 0 -framerate 30 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i alsa_output.pci-0000_0c_00.4.analog-stereo.monitor output.mkv
    fi
}

function stream-sink {
    if pactl list sinks | grep stream_sink > /dev/null; then
        echo "Already loaded"
    else
        pw-cli create-node adapter '{
            factory.name=support.null-audio-sink
            node.name=stream_sink
            node.description="OBS Stream"
            media.class=Audio/Sink
            object.linger=true
            audio.position=[FL FR]
        }'
    fi
    pw-link 'stream_sink:monitor_FL' 'alsa_output.pci-0000_0c_00.4.analog-stereo:playback_FL'
    pw-link 'stream_sink:monitor_FR' 'alsa_output.pci-0000_0c_00.4.analog-stereo:playback_FR'
}

function tv-enable {
    swaymsg 'output HDMI-A-1 enable'
    swaymsg 'seat seat0 pointer_constraint disable'
    xoutput=$(xrandr -q | grep XWAYLAND | grep -v XWAYLAND0 | cut -d' ' -f1)
    xrandr --output $xoutput --primary
}

function tv-disable {
    swaymsg 'output HDMI-A-1 disable'
    swaymsg 'seat seat0 pointer_constraint enable'
}

function obsxcb {
    stream-sink
    obs --platform xcb
}

function extract_icons {
    name="${1%.*}"
    wrestool -x -t 14 "$1" > ${name}.ico
    index=$(icotool -l ${name}.ico | wc -l)
    icotool -i ${index} -x ${name}.ico
    rm ${name}.ico
    mv ${name}_${index}_*.png ${name}_icon.png
}

# Private
source ~/.zshrc_private
