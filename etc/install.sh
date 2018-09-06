#!/bin/sh

declare -r GITHUB_REPOSITORY="rixycf/dotfiles"
declare -r DOTFILE_TARBALL_URL="https://api.github.com/repos/$GITHUB_REPOSITORY/tarball/master"
declare -r DOWNLOAD_PATH="$HOME"
declare -r dotfiles_name="dotfiles"
declare -r DOTFILE_PATH="$DOWNLOAD_PATH/$dotfiles_name"


## download tarball file from github.com
download() {

    local FILE="$1"
    local URL="$2"

    if command -v "curl" > /dev/null 2>&1; then
        curl -LsSo "$FILE" "$URL" > /dev/null 2>&1
        return $?
    elif
        command -v "wget" > /dev/null 2>&1 ; then
        wget -qO "$FILE" "$URL" > /dev/null 2>&1
        return $?
    fi

    return 1

}

## download_dotfiles download dotfiles dir from github and extract tarball at $HOME
download_dotfiles() {
    local tmpfile=""

    tmpfile="$(mktemp $DOWNLOAD_PATH/XXXXX)"

    # download tarball file and write $tmpfile for tarball
    download "$tmpfile" "$DOTFILE_TARBALL_URL"

    if [ -d "$DOTFILE_PATH" ]; then
        echo "please remove directory: $DOTFILE_PATH "
        rm $tmpfile
        return 1
    else
        mkdir "$DOTFILE_PATH"
    fi

    # extract tarball file
    tar zxvf $tmpfile -C $DOTFILE_PATH --strip-components 1 > /dev/null 2>&1

    echo "remove tmpfile..."
    rm $tmpfile

    return $?
}

## create symbolic link to $HOME directory
symbolic_link() {

    echo "symbolic_link..."
    for f in $DOTFILE_PATH/.??*; do
        [ "$f" = "$DOTFILE_PATH/.git" ] && continue
        [ "$f" = "$DOTFILE_PATH/.gitignore" ] && continue
        [ "$f" = "$DOTFILE_PATH/.DS_Store" ] && continue

        ln -snvf "$f" "$HOME"
    done

    echo "end !"
}

# echo $DOTFILE_TARBALL_URL
echo '
--------------------------------------------------------------------
 _____     ______     ______      ______   __     __         ______    
/\  __-.  /\  __ \   /\__  _\    /\  ___\ /\ \   /\ \       /\  ___\   
\ \ \/\ \ \ \ \/\ \  \/_/\ \/    \ \  __\ \ \ \  \ \ \____  \ \  __\   
 \ \____-  \ \_____\    \ \_\     \ \_\    \ \_\  \ \_____\  \ \_____\ 
  \/____/   \/_____/     \/_/      \/_/     \/_/   \/_____/   \/_____/ 

--------------------------------------------------------------------
                                                                       
1. this script download dotfiles from github.com/rixycf/dotfiles
2. create symbolic link $DOTFILE_PATH/.XXX -> $HOME/.XXX
3. if you want to install tools(ex. tmux, zsh...), please execute 
   install_binaries.sh.
'

download_dotfiles

# create symbolic link
## ~/.XXXrc -> $DOTFILE_PATH/.XXXrc ...
symbolic_link

