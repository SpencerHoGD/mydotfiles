#!/bin/sh

set -eu

SRC_DOT_DIR="/home/hxm/dotfiles"

ROOT_DOT_DIR="/root/dotfiles"

ROOT_BAK_DIR="/root/dotfiles_backup"
LINE="============Done============"


# Check or sudo mkdir backup directory
if [ -d $BACKUP_DIR ]; then
  echo "$BACKUP_DIR exists and will be used"
  echo $LINE
else
  echo "mkdir $BACKUP_DIR"
  sudo mkdir -p "$BACKUP_DIR"
  echo $LINE
fi

# Check and sudo move $ROOT_DOT_DIR to BACKUP_DIR
if [ -d $ROOT_DOT_DIR ]; then
  echo "moved $ROOT_DOT_DIR to $ROOT_BAK_DIR"
  sudo mv "$ROOT_DOT_DIR" "$ROOT_BAK_DIR"
  echo $LINE
fi


# Check SRC_DOT_DIR exists and sudo cp else exit.
if [ -d $SRC_DOT_DIR ]; then
  echo "$SRC_DOT_DIR exists"
  sudo cp "$SRC_DOT_DIR" "$ROOT_DOT_DIR"
  echo "copyed $SRC_DOT_DIR to $ROOT_DOT_DIR"
  echo $LINE
else
  echo "$SRC_DOT_DIR not exists"
  exit 1
fi
