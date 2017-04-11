#!/bin/bash
# Make symlinks each dotfile's default location

# TODO: Verify pwd=*dir* else cd to *dir*
# Where *dir* is the cloned folder of the repo

# TODO: Automate *a lot* of things, which files goes into $XDG_CONFIG_HOME.
#       Probably add the full path to each file, i.e. including '.config',
#       then just parse the directory contents, kay?

# TODO: There's definitely a bug evaluating the variables, do fix before boom.

# TODO: Move all config files to .config

stow --target=${HOME}/.config {fish,mpd,termite}
stow ${HOME} {vim,X,xmonad,compton,bash,ncmpcpp}
