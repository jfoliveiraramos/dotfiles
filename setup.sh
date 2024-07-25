#!/bin/bash

cleanup() {
    cd ..
    rm -rf ./dotfiles
}

check_exit() {
    error_message=$1

    if [ $? -ne 0 ]; then
        echo $error_message
        echo "Exiting..."
        cleanup
        exit 1
    fi
}

press_key() {
    echo
    echo "Press any KEY to continue..."
    read
}

backup() {
    mkdir $backup_dir
    mv $HOME/.config/nvim/* $backup_dir
    check_exit "Something went wrong while backing up current NeoVim config"
    echo "NeoVim configuration successfuly backed up to $HOME/.config/nvim.bak"
    echo
}

setup_neovim() {

    echo
    if [ -d $HOME/.config/nvim ]; then

        echo "Do you wish to backup your current NeoVim configuration? [Y/n]"
        read input
        if [ $input = 'Y' ] || [ $input = 'y' ]; then
            backup_dir=$HOME/.config/nvim.bak
            if [ -d $backup_dir ]; then
                echo
                echo "The backup directory $backup_dir already exists."
                echo "Do you wish to overwrite it? [Y/n]"
                read input
                if [ $input = 'Y' ] || [ $input = 'y' ]; then
                    rm -rf $backup_dir
                    backup
                else
                    echo "Can't backup NeoVim configuration"
                    echo "Aborting"
                    press_key
                    return
                fi
            else
                backup
            fi
        else
            echo
            echo "Overwriting current NeoVim configuration"
            echo

        fi
    fi

    cp -r ./.config/nvim $HOME/.config/
    check_exit "Something went wrong while copying NeoVim config"
    echo "NeoVim configuration successfuly set up"
    press_key
}

setup_universal() {
    echo
    echo "Not implemented yet"
    press_key
}

clear

if [ -z $HOME ]; then
    echo "HOME variable is either empty, null or not set. Unable to determine configuration directory."
    echo "Exiting..."
    exit 1
fi

echo "Retrieving most recent configuration..."
git clone --recursive https://github.com/jfoliveiraramos/dotfiles
check_exit "Something went wrong while fetching from remote repository."
cd ./dotfiles
echo

quit=0
while [ $quit -ne 1 ]; do

    clear

    declare -a options=("Setup NeoVim Configuration" "Setup Universal Configuration")
    count=1

    echo "Pick an option:"
    echo
    for option in "${options[@]}"; do
        echo "$count) $option"
        count=$((count + 1))
    done
    echo "0) Quit"
    echo

    read input

    case $input in
    1) setup_neovim ;;
    2) setup_universal ;;
    0) quit=1 ;;
    *) echo "Invalid option" ;;
    esac

done

cleanup

clear
