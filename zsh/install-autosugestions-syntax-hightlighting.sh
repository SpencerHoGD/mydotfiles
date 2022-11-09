#!/bin/bash
# Little introduction.
echo "This script will assist you with setting up zsh-autosuggestions and zsh-syntax-highlighting."
sleep 2s
clear

cd "~"
echo "Start clone zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sleep 1s
clear

echo "Start clone zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sleep 1s
echo "Done"
clear
