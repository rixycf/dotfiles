#!/bin/bash
set -u

THIS_DIR=$(cd $(dirname $0); pwd)

cd $THIS_DIR

echo "ln command start"

for f in .??*; do
	["$f"=".git"] && continue
	["$f"=".gitconfig.local.template"] && continue
	["$f"=".gitmodules"] && continue
	["$f"=".gitignore"] && continue
  ["$f"=".DS_Store"] && continue

	ln -snfv ~/dotfiles/"$f" ~/
done

echo "end"
