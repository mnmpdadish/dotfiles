# HORIZONTAL=900
# VERTICAL=650
# wmctrl -r ":ACTIVE:" -e 0,-1,-1,${HORIZONTAL},${VERTICAL}
archey
#screenfetch






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


alias file644="find . -type f -exec chmod 644 {} \;"
alias dir755="find . -type d -exec chmod 755 {} \;"
alias chmod0="dir755; file644;"
alias gitl="git log --graph --all --decorate"

alias src='source $HOME/.bashrc; source $HOME/.vimrc;'

alias graham='ssh -X charleb1@graham.computecanada.ca'
scpg="charleb1@graham.computecanada.ca"
alias cedar='ssh -X charleb1@cedar.computecanada.ca'
scpc="charleb1@cedar.computecanada.ca"

alias luna='ssh -Y charlebois@luna.t.u-tokyo.ac.jp'
scpl='charlebois@luna.t.u-tokyo.ac.jp'

alias mams='ssh -X charleb1@tremblay-ms.ccs.usherbrooke.ca'
alias mamp='ssh -X charleb1@tremblay-mp2.ccs.usherbrooke.ca'
alias cq-eeY='ssh -Y user7@colosse.calculquebec.ca'
alias cq-eeH='ssh -Y user7@helios.calculquebec.ca'

#alias hemulen2='ssh charlebois@hemulen.mns.kyutech.ac.jp'
#scph2='charlebois@hemulen.mns.kyutech.ac.jp'
alias hemulen='ssh maxime@hemulen.mns.kyutech.ac.jp'
scph='maxime@hemulen.mns.kyutech.ac.jp'


alias scprespack='rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' --exclude='*calc_*'\
                  /home/maxime/dev/RESPACK/src  charlebois@luna.t.u-tokyo.ac.jp:/home/charlebois/dev/RESPACK/. ; \
                  rsync -rav -e ssh --exclude='*.o' --exclude='*.mod' --exclude='*calc_*'\
                  /home/maxime/dev/RESPACK/util charlebois@luna.t.u-tokyo.ac.jp:/home/charlebois/dev/RESPACK/. ; '

#alias qcmyo='/home/maxime/dev/bin/qcm'
#alias cdg='cd /home/maxime/dev/run/graphene/'

alias c='cd ..; pwd; ls'
alias sd="pushd +1; ls"
alias b="vi ~/.bashrc"
alias s=". ~/.bashrc"
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


xset r rate 200 100

