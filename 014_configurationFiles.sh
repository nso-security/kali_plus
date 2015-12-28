#!/bin/bash -v

#Turn on TMUX Session Logging
#Reference http://unix.stackexchange.com/questions/5832/is-there-an-equivalent-of-gnu-screens-log-command-in-tmux
mkdir -p $HOME/slogs
echo bind-key H pipe-pane -o \"exec cat \>\>$HOME/slogs/\'#W_$$(date \'+%d%m%Y_%H%M%S\')-tmux.log\'\" \; display-message \'Toggled logging to $HOME/slogs/#W-tmux.log\' > ~/.tmux.conf
