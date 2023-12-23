#!/bin/bash

for d in $HOME/workspace/ \
         $HOME/workspace/ \
         $HOME/workspace/ \
         $HOME/workspace/\
         ; do
  tmux new-window -c "$d" -n "$(basename $d)"
done
