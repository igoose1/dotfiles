# $FreeBSD: releng/12.0/share/skel/dot.profile 337497 2018-08-08 19:24:20Z asomers $
#
# .profile - Bourne Shell startup script for login shells
#
# see also sh(1), environ(7).
#

# These are normally set through /etc/login.conf.  You may override them here
# if wanted.
# PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$HOME/bin; export PATH
# BLOCKSIZE=K;	export BLOCKSIZE

# Setting TERM is normally done through /etc/ttys.  Do only override
# if you're sure that you'll never log in via telnet or xterm or a
# serial line.
# TERM=xterm; 	export TERM

EDITOR=vim;   	export EDITOR
PAGER=less;  	export PAGER
BROWSER=surf;   export BROWSER

# set ENV to a file invoked each time sh is started for interactive use.
ENV=$HOME/.shrc; export ENV

# Query terminal size; useful for serial lines.
if [ -x /usr/bin/resizewin ] ; then /usr/bin/resizewin -z ; fi

# GOPATH
GOPATH=$HOME/go; export GOPATH

# Go binaries in PATH
PATH=$PATH:$GOPATH/bin/;

# Plan9 binaries in PATH
PATH=$PATH:/usr/local/plan9/bin;

PATH=$PATH:$HOME/.local/bin;

export PATH
