#!/bin/sh

declare -r DOTFILE_PATH="$HOME/dotfiles"

for f in $DOTFILE_PATH/.??* ; do
    [ "$f" = "$DOTFILE_PATH/.gitignore" ] && echo "skip"  && continue 
    [ "$f" = "$DOTFILE_PATH/.DS_Store" ] && echo "skip" && continue 

    echo $f

done

