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

# File: menu-introduction.sh
# Created on: 12/04/2023
# By: Balih Kognog
# Last Modified: 12/04/2023

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

while true; do
  exec 3>&1
  selection=$(dialog \
    --backtitle "KOGNOG LFS Ver. 3.0 | PREFACE" \
    --title "Table of Contents" \
    --clear \
    --cancel-label "Previous Menu" \
    --menu "Please select an option:" $HEIGHT $WIDTH 15 \
    ".1" "How to Build an LFS System" \
    ".2" "What's new since the las release of LFS" \
    ".3" "Changelog" \
    ".4" "Resources" \
    ".5" "Help" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      # Returning to the main menu
      display_mainmenu
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    ".1" )
      result=$(cat ChapterI/Howto-build.txt)
      display_dialog "How to Build an LFS System"
      ;;
    ".2" )
      result=$(cat ChapterI/Whats-new.txt)
      display_dialog "What's new since the las release of LFS"
      ;;
    ".3" )
      result=$(cat ChapterI/Changelog.txt)
      display_dialog "Changelog"
      ;;
    ".4" )
      result=$(cat ChapterI/Resources.txt)
      display_dialog "Resources"
      ;;
    ".5" )
      result=$(cat ChapterI/Help.txt)
      display_dialog "Help"
      ;;
  esac
done