kluvin's dotfiles
=================

Blocks formatted like so:

```
# BEGIN [DEVICE]
[...]
# END [DEVICE]
```

are parsed by [qualia](https://pypi.python.org/pypi/mir.qualia/), which enables or disables them by commenting them out depending on which device they're used on.

This directory tree is [managed](https://taihen.org/managing-dotfiles-with-gnu-stow/) by [GNU stow](https://www.gnu.org/software/stow/) which symlinks files in a directory to their respective place in the $HOME tree. I'll provide a tiny install script in the future, but for now, just do this:

```
mkdir ~/.files && cd ~/.files
stow {vim,bash,X,compton,mpd,ncmpcpp}
stow {bspwm,sxhkd,termite,fish}
```

To only move a symlink a single file, navigate to where you cloned this repo, and use `stow DIRECTORY`, from the topmost level, e.g. `cd $HOME/YOUR_COPY/ && stow X`, for my *xinitrc* and *Xresources*.

---

These files are licensed under the MIT License. Which require you to include copy of the license and of its copyright notice provided in *LICENSE* file.
