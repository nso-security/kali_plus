#!/usr/bin/env python
import sys
import subprocess
import os
#write a resource file and call it
def buildConfigurationFiles():
  #tmuxoptions ="bind-key c new-window; pipe-pane -o \"exec cat >>$HOME/slogs/\'#W_%d%m%Y_%H%M%S-tmux.log'\" \; display-message 'Toggled logging to $HOME/slogs/#W-tmux.log'"
  tmuxoptions="run-shell /opt/tmux-logging/logging.tmux"
  sessionLogsPath = "/root/slogs/"
  tmuxConfigurationFile = "/root/.tmux.conf"
  if not os.path.exists(sessionLogsPath):
    os.makedirs(sessionLogsPath) 
  filewrite = file(tmuxConfigurationFile, "w")
  filewrite.write(tmuxoptions)
  filewrite.close()





try:
  buildConfigurationFiles()

#index error
except IndexError:
  print "usage: no args"
