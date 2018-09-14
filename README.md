DOTFILES
====
```
--------------------------------------------------------------------
 _____     ______     ______      ______   __     __         ______    
/\  __-.  /\  __ \   /\__  _\    /\  ___\ /\ \   /\ \       /\  ___\   
\ \ \/\ \ \ \ \/\ \  \/_/\ \/    \ \  __\ \ \ \  \ \ \____  \ \  __\   
 \ \____-  \ \_____\    \ \_\     \ \_\    \ \_\  \ \_____\  \ \_____\ 
  \/____/   \/_____/     \/_/      \/_/     \/_/   \/_____/   \/_____/ 

--------------------------------------------------------------------

```                                                                       

工事中...

how to install dotfiles
----

```
curl https://raw.githubusercontent.com/rixycf/dotfiles/master/etc/install.sh | bash
```

1. this script download dotfiles from github.com/rixycf/dotfiles
1. create symbolic link $DOTFILE_PATH/.XXX -> $HOME/.XXX

DEMO
----
![install](https://user-images.githubusercontent.com/31855673/45528631-1c686980-b81c-11e8-962e-d441ab76eb70.gif)  


how to install tools
----
__this install script do not support macOS yet__

please execute install_binary.sh

```
/path/to/dotfiles/etc/install_binary.sh
```
__ubuntu__: following tools will be installed 

- git
- vim 
- zsh
- tmux 
