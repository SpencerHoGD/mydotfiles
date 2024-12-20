#!/bin/bash

set -eu

ZSH_DIR="$HOME/dotfiles/zsh/"
DES_DIR="$HOME/.oh-my-zsh/custom/"
BACKUP_DIR="$HOME/dotfiles_backup"
# REPO="https://github.com/SpencerHoGD/mydotfiles"
LINE="======================="


if [ -d $ZSH_DIR ]; then
  echo "$ZSH_DIR exists"
  echo $LINE
else
  echo "$ZSH_DIR not exists and exit"
  exit 1
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
    'aliases.zsh'
    # Add other files here
)

for file in "${FILES_TO_SYMLINK[@]}"; do
    if [ -e "$DES_DIR/$file" ]; then
        # Backup existing file if it exists
        mv "$DES_DIR/$file" "$BACKUP_DIR/$file"
        echo "moved $DES_DIR/$file $BACKUP_DIR/$file"
    fi
    
    # Create symlink
    ln -s "$ZSH_DIR/$file" "$DES_DIR/$file"
    echo "Symlinked $ZSH_DIR/$file to $DES_DIR/$file"
done
