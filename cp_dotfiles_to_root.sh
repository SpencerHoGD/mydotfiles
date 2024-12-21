#!/bin/sh

set -eu

SRC_DOT_DIR="/home/hxm/dotfiles"

ROOT_DOT_DIR="/root/dotfiles"

TIMESTAMP=$(date +'%d%m%y%H%M%S')
# BACKUP_FILE="${SOURCE_FILE}.${TIMESTAMP}"

ROOT_BAK_DIR="/root/dotfiles_backup"

ROOT_ZSH_CUS="/root/.oh-my-zsh/custom"

LINE="============Done============"


# Check or sudo mkdir backup directory
if [ -d $ROOT_BAK_DIR ]; then
  echo "$ROOT_BAK_DIR exists and will be used"
  echo $LINE
else
  echo "mkdir $ROOT_BAK_DIR"
  sudo mkdir -p "$ROOT_BAK_DIR"
  echo $LINE
fi

# Check and sudo move $ROOT_DOT_DIR to BACKUP_DIR
if [ -d $ROOT_DOT_DIR ]; then
  sudo rm -rf "$ROOT_BAK_DIR/dotfiles"
  echo "Old $ROOT_BAK_DIR/dotfiles dir has been removed"
  sudo mv "$ROOT_DOT_DIR" "$ROOT_BAK_DIR"
  echo $LINE
fi


# Check SRC_DOT_DIR exists and sudo cp else exit.
if [ -d $SRC_DOT_DIR ]; then
  echo "$SRC_DOT_DIR exists"
  sudo cp -r "$SRC_DOT_DIR" "$ROOT_DOT_DIR"
  echo "copyed $SRC_DOT_DIR to $ROOT_DOT_DIR"
  echo $LINE
else
  echo "$SRC_DOT_DIR not exists"
  exit 1
fi


# List of dotfiles to symlink
declare -a FILES_TO_SYMLINK=(
  'vimrc'
  'warprc'
  'zshrc'
  # Add other files here
)

# backup rcs and make symlinks
for file in "${FILES_TO_SYMLINK[@]}"; do
  if [ -e "/root/.$file" ]; then
    # Backup existing file if it exists
    sudo mv "/root/.$file" "$ROOT_BAK_DIR/${file}.${TIMESTAMP}"
    echo "moved /root/.$file to $ROOT_BAK_DIR/$file"
  fi
  
  # Create symlink
  sudo ln -s "$ROOT_DOT_DIR/$file" "/root/.$file"
  echo "Symlinked $file to /root/.$file"
done

ali="aliases.zsh"
# Create symlink for aliases.zsh
if [ -e "$ROOT_ZSH_CUS/$ali" ]; then
  sudo mv "$ROOT_ZSH_CUS/$ali" "$ROOT_BAK_DIR/${ali}.${TIMESTAMP}"
  echo "Backuped aliases.zsh"
  echo $LINE
else
  sudo ln -s "$ROOT_DOT_DIR/zsh/$ali" "$ROOT_ZSH_CUS/$ali"
  echo "Symlinked $ROOT_DOT_DIR/zsh/$ali to $ROOT_ZSH_CUS/$ali"
fi

ln -s /root/dotfiles/zsh/aliases.zsh /root/.oh-my-zsh/custom

