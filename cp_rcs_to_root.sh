#!/bin/bash
# for root@arch
set -eu

DOTFILE_DIR="/home/hxm/dotfiles"

ZSRC="/home/hxm/dotfiles/zsh/"
ALI_F="aliases.zsh"
# root dir
ZDES="$HOME/.oh-my-zsh/custom/"
BACKUP_DIR="$HOME/dotfiles_backup"
# REPO="https://github.com/SpencerHoGD/mydotfiles"
LINE="======================="


if [ -d $DOTFILE_DIR ]; then
  echo "$DOTFILE_DIR exists"
  echo $LINE
else
  echo "$DOTFILE_DIR not exists"
  echo $LINE
  exit
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
    # 'gitconfig'
    'vimrc'
    'warprc'
    # 'xinitrc'
    # 'Xresources'
    'zshrc'
    # Add other files here
)

# for root@arch
for file in "${FILES_TO_SYMLINK[@]}"; do
    if [ -e "$HOME/.$file" ]; then
        # Backup existing file if it exists
        mv "$HOME/.$file" "$BACKUP_DIR/$file"
        echo "moved $HOME/.$file to $BACKUP_DIR/$file"
    fi
    
    # Create symlink
    cp "$DOTFILE_DIR/$file" "$HOME/.$file"
    echo "copyed $DOTFILE_DIR/$file" to "$HOME/.$file"
done

# move exists aliases.zsh to BACKUP_DIR
if [ -e "$ZDES/$ALI_F" ]; then
  mv "$ZDES/$ALI_F" "$BACKUP_DIR/$ALI_F"
  echo "moved $ZDES/$ALI_F to $BACKUP_DIR/$ALI_F"
else
  echo "$ZDES/$ALI_F not exists"
fi

# copy aliases.zsh from src to root
if [ -e "$ZSRC/$ALI_F" ]; then
  cp "$ZSRC/$ALI_F" "$ZDES/$ALI_F"
  echo "copyed $ZSRC/$ALI_F to $ZDES/$ALI_F"
else
  echo "copy $ZSRC/$ALI_F" to "$ZDES/$ALI_F failed"
fi

