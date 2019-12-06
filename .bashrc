#create shortcut for middle mouse button:
#xdotool click 2     ---- to emulate middle mouse button


# HORIZONTAL=900
# VERTICAL=650
# wmctrl -r ":ACTIVE:" -e 0,-1,-1,${HORIZONTAL},${VERTICAL}
#archey
#screenfetch



#qconf -spl



# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[\033[01;32m\]\u\[\033[01;34m\]@\[\033[02;32m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi











#alias definis par Maxime Charlebois:

alias happy="export PS1='\n(^-^)/\[\e[1;31m\]$\[\e[0m\] '"
alias pointy="export PS1='\n(☞ ﾟヮﾟ)☞ \[\e[1;31m\]$\[\e[0m\] '"
alias saddy="export PS1='\n(-_-)-\[\e[1;31m\]$\[\e[0m\] '"
alias manly="export PS1='\n(^_^メ)\[\e[1;31m\]$\[\e[0m\] '"
alias geeky="export PS1='\n(＠_＠;)\[\e[1;31m\]$\[\e[0m\] '"
alias lenny="export PS1='\n( ͡° ͜ʖ ͡°)\[\e[1;31m\]$\[\e[0m\] '"


alias countLine="find . -type f \( -name "*.h" -o -name "*.c"  -o -name "*.py" -o -name "*.cpp" -o -name "*.hpp" \) -print | xargs wc -l"
alias vimc="find . -type f \( -name "*.h" -o -name "*.c"  -o -name "*.py" -o -name "*.cpp" -o -name "*.hpp" \) -exec vim {} +"


alias file644="find . -type f -exec chmod 644 {} \;"
alias dir755="find . -type d -exec chmod 755 {} \;"
alias chmod0="dir755; file644;"
alias gitl="git log --graph --all --decorate"

alias src='source $HOME/.bashrc; source $HOME/.vimrc;'

alias graham='ssh -X charleb1@graham.computecanada.ca'
scpg="charleb1@graham.computecanada.ca"
alias cedar='ssh -X charleb1@cedar.computecanada.ca'
scpc="charleb1@cedar.computecanada.ca"


alias luna='ssh -Y charlebois@133.9.185.44'
scpl='charlebois@133.9.185.44'

alias sol='ssh -Y charlebois@133.9.185.48'
scpsol='charlebois@133.9.185.48'

#alias luna='ssh -Y charlebois@luna.t.u-tokyo.ac.jp'
#scpl='charlebois@luna.t.u-tokyo.ac.jp'

alias mams='ssh -X charleb1@tremblay-ms.ccs.usherbrooke.ca'
alias mamp='ssh -X charleb1@tremblay-mp2.ccs.usherbrooke.ca'
alias mp2b='ssh -X charleb1@mp2b.calculquebec.ca'
scpb="charleb1@mp2b.calculquebec.ca"

alias cq-eeY='ssh -Y user7@colosse.calculquebec.ca'
alias cq-eeH='ssh -Y user7@helios.calculquebec.ca'

alias hemulen2='ssh charlebois@hemulen.mns.kyutech.ac.jp'
scph2='charlebois@hemulen.mns.kyutech.ac.jp'
alias hemulen='ssh maxime@hemulen.mns.kyutech.ac.jp'
scph='maxime@hemulen.mns.kyutech.ac.jp'

alias scprespack='rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' \
                  /home/maxime/dev/RESPACK/util charlebois@133.9.185.44:/home/charlebois/dev/RESPACK/. ; \
                  rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' --exclude='calc_w*' --exclude='calc_c*' --exclude='calc_j*'\
                  /home/maxime/dev/RESPACK/src  charlebois@133.9.185.44:/home/charlebois/dev/RESPACK/. ; '

alias scprespacks1='rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' \
                    /home/maxime/dev/RESPACK/util k019907@sekirei.issp.u-tokyo.ac.jp:/home/k0199/k019907/dev/RESPACK/. ; \
                    rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' --exclude='calc_w*' --exclude='calc_c*' --exclude='calc_j*'\
                    /home/maxime/dev/RESPACK/src  k019907@sekirei.issp.u-tokyo.ac.jp:/home/k0199/k019907/dev/RESPACK/. ; '

alias scprespacks='rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' \
                   /home/maxime/dev/RESPACK/util k003117@sekirei.issp.u-tokyo.ac.jp:/home/k0031/k003117/dev/RESPACK/. ; \
                   rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' --exclude='calc_w*' --exclude='calc_c*' --exclude='calc_j*'\
                   /home/maxime/dev/RESPACK/src  k003117@sekirei.issp.u-tokyo.ac.jp:/home/k0031/k003117/dev/RESPACK/. ; '

#alias scpmvmc='rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' --exclude='*.out' --exclude='*.git*' --exclude='samples/*/*/*/output*' \
#               /home/maxime/dev/mvmc_dev_misawa/mvmc  charlebois@133.9.185.44:/home/charlebois/dev/. ; '

#alias scpmvmcs='rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' --exclude='*.out' --exclude='*.git*' --exclude='samples/*/*/*/output*' \
#               /home/maxime/dev/mvmc_dev_misawa/mvmc  k003117@sekirei.issp.u-tokyo.ac.jp:/home/k0031/k003117/dev/. ; '

alias scpmvmc2s='rsync -rav -e ssh --exclude='*.so' --exclude='*.o' --exclude='*.mod' --exclude='*.out' --exclude='*.git*' --exclude='samples/*/*/*/output*' \
               /home/maxime/dev/mvmc_dev  k019907@sekirei.issp.u-tokyo.ac.jp:/home/k0199/k019907/dev/. ; '

alias scpmvmc2m='rsync -rav -e ssh --exclude='*.so' --exclude='*.o' --exclude='*.mod' --exclude='*.out' --exclude='*.git*' --exclude='samples/*/*/*/output*' \
               /home/maxime/dev/mvmc_dev  m000317@sekirei.issp.u-tokyo.ac.jp:/home/m0003/m000317/dev/. ; '

alias scpmvmc2='rsync -rav -e ssh --exclude='*.so' --exclude='*.o' --exclude='*.mod' --exclude='*.out' --exclude='*.git*' --exclude='samples/*/*/*/output*' \
               /home/maxime/dev/mvmc_dev  charlebois@133.9.185.44:/home/charlebois/dev/. ; '

alias scpkota='rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' --exclude='*.out'\
               /home/maxime/dev/mvmc_dev_misawa  charlebois@133.9.185.44:/home/charlebois/dev/. ; '

#k019907
alias se='ssh -Y -l k019907 sekirei.issp.u-tokyo.ac.jp'
scpse='k019907@sekirei.issp.u-tokyo.ac.jp'

alias sekireim='ssh -Y -l m000317 sekirei.issp.u-tokyo.ac.jp'
scpsm='m000317@sekirei.issp.u-tokyo.ac.jp'

alias sshw="ssh -oProxyCommand='corkscrew www-proxy.mse.waseda.ac.jp 8080 %h %p' -Y"
alias scpw="scp -oProxyCommand='corkscrew www-proxy.mse.waseda.ac.jp 8080 %h %p'"

alias sekirei='ssh -Y -l k003117 sekirei.issp.u-tokyo.ac.jp'
scps='k003117@sekirei.issp.u-tokyo.ac.jp'

alias suzuki='ssh -Y -l k003115 sekirei.issp.u-tokyo.ac.jp'
scpsz='k003115@sekirei.issp.u-tokyo.ac.jp'

alias seki='ssh -Y -l r009504 sekirei.issp.u-tokyo.ac.jp'
scpseki='r009504@sekirei.issp.u-tokyo.ac.jp'

alias landau='ssh -Y -l maxime 133.11.72.155'

win='/home/maxime/win/'
#alias qcmyo='/home/maxime/dev/bin/qcm'
#alias cdg='cd /home/maxime/dev/run/graphene/'

alias c='cd ..; pwd; ls'
alias sd="pushd +1; ls"
alias b="vi ~/.bashrc"
alias s=". ~/.bashrc"
alias diag="du -hs * | sort -h"
alias pdf="qpdfview "
EDITOR=vim

alias go='nautilus .'
alias lls='ls -ltrh'
alias export1='scp -r ./src/ charleb1@tremblay-ms.ccs.usherbrooke.ca:/home/charleb1/qcm/.'
#alias scpm="charleb1@tremblay-ms.ccs.usherbrooke.ca"
alias scpqcm='scp /home/maxime/drop/qcm/qcm.tar.gz charleb1@tremblay-ms.ccs.usherbrooke.ca:/home/charleb1/.'
alias scpqcm2='scp /home/maxime/drop/qcm/qcm2.tar.gz charleb1@tremblay-ms.ccs.usherbrooke.ca:/home/charleb1/.'
scpm="charleb1@tremblay-ms.ccs.usherbrooke.ca"


alias scpiq='scp -r /home/maxime/drop/backupPostDoc/iq/* cham1617@bethe.physique.usherbrooke.ca:/home/source_code/.'
alias bethe='ssh -Y cham1617@bethe.physique.usherbrooke.ca'

alias gedit='pluma'


alias gitlog='git log --graph --all --decorate'
alias mario='~/dev/game/palettePNG/palettePNG ~/dev/game/palettePNG/linux_sprite_palette.png'



export PATH=$PATH:$HOME/dev/bin/

## programme a patrick
export PATH=$HOME/dev/Patrick_IS/local/bin:$HOME/ALPS/bin:$PATH
export LD_LIBRARY_PATH=$HOME/dev/Patrick_IS/local/lib:$HOME/ALPS/lib:$LD_LIBRARY_PATH
#export PATH=$HOME/dev/Patrick_IS/SkipList10.6/ImpuritySolver:$PATH
export LD_LIBRARY_PATH=/opt/alps/lib:$LD_LIBRARY_PATH
export PATH=$PATH:/opt/alps/bin
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
export PYTHONPATH=/opt/alps/lib:$PYTHONPATH
export PYTHONPATH=$HOME/bin:$PYTHONPATH
export PYTHONPATH=$HOME/bin/AlexandreFoley:$PYTHONPATH
export PATH=$HOME/bin/respack:$PATH
export PATH=$HOME/bin/xtapp:$PATH

export PYTHONPATH=$HOME/dev/mvmc_dev/tool/dvmc:$PYTHONPATH
export PATH=$HOME/dev/mvmc_dev/tool/dvmc:$PATH




# si lgfortran manque a l'appel, met quelque chose du genre: 
# sudo ln -s /usr/lib/x86_64-linux-gnu/libgfortran.so.3 /usr/local/lib/libgfortran.so


alias connect='sudo mount -t vboxsf linux /home/maxime/win && sudo mount -t vboxsf Dropbox /home/maxime/drop'
alias tmp1='sudo mount -t vboxsf linux /home/maxime/win && sudo mount -t vboxsf Dropbox /home/maxime/drop'

#############################################
source /opt/intel/bin/compilervars.sh intel64
#############################################

#sudo mount -t vboxsf linux /home/maxime/win
#sudo mount -t vboxsf Dropbox /home/maxime/drop


export PYTHONSTARTUP=~/.pystartup


alias netup='sudo service network-manager restart'
alias VESTA='/home/maxime/install/VESTA-x86_64/VESTA'
alias vesta='/home/maxime/install/VESTA-x86_64/VESTA'
alias vi='vim'

xset r rate 200 150

#sudo update-alternatives --config x-terminal-emulator 


alias conmp2='ssh -X simoli@tremblay-mp2.ccs.usherbrooke.ca'
scpo=simoli@tremblay-mp2.ccs.usherbrooke.ca


export CXX=/usr/bin/gcc-8

PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname)\a"'
