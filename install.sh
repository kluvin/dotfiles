# MIT License

# Copyright (c) 2017 Martin Kleiven
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


#! /bin/bash

# Paths to where to link dotfiles
home=$HOME
config=$HOME/.config
declare -A target_dests=(
    ['ncmpcpp']=$home
    ['compton']=$home
    ['xmonad']=$home
    ['bash']=$home
    ['vim']=$home
    ['X']=$home
    ['termite']=$config
    ['fish']=$config
    ['mpd']=$config
)

# Link dotfiles
echo "This file was automatically generated; any modifications will be removed."$'\n\n' > state.db
for subdir in $(ls -d */)
do
    subdir=$(echo ${subdir} | sed 's/\//''/')
    for target in $(ls -A ${subdir})
    do
    #                           FILE / DIRECTORY TO LINK   WHERE TO PUT LINK
        ln -sbv --suffix '-old' $(pwd)/${subdir}/${target} ${target_dests[${subdir}]}/${target}
        echo ${target_dests[${subdir}]}/${target} >> state.db
    done
done


# tl;dr: bash sucks
