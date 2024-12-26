#!/bin/bash

set -eu

DOTFILE_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup"
REPO="https://github.com/SpencerHoGD/mydotfiles"
LINE="======================="


if [ -d $DOTFILE_DIR ]; then
  echo "$DOTFILE_DIR exists no need to git clone"
  echo $LINE
else
  echo "$DOTFILE_DIR not exists"
  echo "git cloneing from $REPO"
  git clone $REPO $DOTFILE_DIR
  echo $LINE
fi

# Create backup directory
if [ -d $BACKUP_DIR ]; then
  echo "$BACKUP_DIR exists and will use it"
  echo $LINE
else
  echo "mkdir $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR"
  echo $LINE
fi


# List of dotfiles to symlink
declare -a FILES_TO_SYMLINK=(
    'gitconfig'
    'vimrc'
    'warprc'
    'xinitrc'
    'Xresources'
    'zshrc'
    # Add other files here
)

for file in "${FILES_TO_SYMLINK[@]}"; do
    if [ -e "$HOME/.$file" ]; then
        # Backup existing file if it exists
        mv "$HOME/.$file" "$BACKUP_DIR/$file"
        echo "moved $HOME/.$file to $BACKUP_DIR/$file"
    fi
    
    # copy dotfiles to $HOME
    cp "$DOTFILE_DIR/$file" "$HOME/.$file"
    echo "Copyed $file to $HOME/.$file"
done
