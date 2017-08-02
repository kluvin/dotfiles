install.sh
==========

**To install, simply run `bash install.sh`**

`install.sh` symlinks the provided dotfiles in their default directories. The link paths are appended to a file `state.db` which can be used to revert back to the original state by simply deleting the symlinks. Something like this should suffice:

```
# Untested, might crash and set your computer afire.
for line in $(cat state.db)
do
    rm -rf $line
done
rm -f state.db
```

The script assumes it is called from the `dotfiles` directory, or one level hierarchy above the paths to link. It also assumes the hierarchy below it look like:

```
application
       ---> file or folder to link
```

This allows for placing your configuration in both  
`$XDG_CONFIG_HOME` like  `$HOME/.config/application/config`; or  
`$HOME` like `$HOME/.applicationrc`

**Note that bash version 4 or later is required due to use of its groundbreaking hash-table feature.**