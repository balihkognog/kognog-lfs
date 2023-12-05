#!/bin/bash

# KOGNOG LINUX FROM SCRATCH or KOGNOG LFS
# VERSION 3.0
# MANTAINER: BALIH KOGNOG
# CONTACT: balihkognog@gmail.com

### BASED ON ###

# LINUX FROM SCRATCH
# VERSION 12.0-systemd
# PUBLISHED SEPTEMBER 1st, 2023
# CREATED BY GERARD BEEKMANS
# MANAGING EDITOR: BRUCE DUBBS
# EDITOR: DOUGLAS R. RENO
# EDITOR: DJ LUCAS
# COPYRIGHT (c) 1999-2023, Gerard Beekmans
# All rights reserved.
# This book is licensed under a Creative Commons License.
# Computer instructions may be extracted from the book under the MIT License.
# Linux® is a registered trademark of Linus Torvalds.

# File: install-kognoglfs.sh
# Created on: 11/29/2023
# By: Balih Kognog
# Last Modified: 11/30/2023

#################
# Program Start #
#################

# while-menu-dialog: a menu driven system information program

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0

display_dialog() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 30 100
}

display_mainmenu() {
    while true; do
    exec 3>&1
    selection=$(dialog \
        --backtitle "KOGNOG LFS Ver. 3.0 | LINUX FROM SCRATCH BOOK AND INSTALLATION" \
        --title "Table of Contents" \
        --clear \
        --cancel-label "Exit" \
        --menu "Please select an option:" $HEIGHT $WIDTH 15 \
        "0" "STOP! - READ ME FIRST" \
        "." "Preface (optional - read it as many times as you want)" \
        "I" "Introduction" \
        "II" "Preparing for the Build" \
        "III" "Building the LFS Cross Toolchain and Temporary Tools" \
        "IV" "Building the LFS System" \
        "V" "Appendices" \
        2>&1 1>&3)
    exit_status=$?
    exec 3>&-
    case $exit_status in
        $DIALOG_CANCEL)
        clear
        echo "Program terminated."
        exit
        ;;
        $DIALOG_ESC)
        clear
        echo "Program aborted." >&2
        exit 1
        ;;
    esac
    case $selection in
        "0" )
        result=$(cat Documents/READ.ME)
        display_dialog "STOP! READ ME FIRST"
        ;;
        "." )
        # Calling the Preface Menu
        source Preface/menu-preface.sh
        ;;
        "I" )
        # Calling the Introduction Menu
        source ChapterI/menu-introduction.sh
        ;;
        "II" )
        result=$(echo "Opening Preparing for the Build ...")
        display_dialog "Preparing for the Build"
        ;;
        "III" )
        result=$(echo "Building the LFS Cross Toolchain and Temporary Tools ...")
        display_dialog "Building the LFS Cross Toolchain and Temporary Tools"
        ;;
        "IV" )
        result=$(echo "Opening Building the LFS System ...")
        display_dialog "Building the LFS System"
        ;;
        "V" )
        result=$(echo "Opening Appendices ...")
        display_dialog "Appendices"
        ;;
        
    esac
    done
}

# Showing Main Menu, until exit
display_mainmenu