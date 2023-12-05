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

# File: menu-preface.sh
# Created on: 11/29/2023
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
    ".1" "About LFS Book Version 12 used fog Kognog LFS" \
    ".2" "About the Manteiner of Kognog LFS" \
    ".3" "Foreword" \
    ".4" "Audience" \
    ".5" "LFS Target Architectures" \
    ".6" "Prerequisites" \
    ".7" "LFS and Standards" \
    ".8" "Rationale for Packages in the Book" \
    ".9" "Typography" \
    ".10" "Structure" \
    ".11" "Errata and Security Advisories" \
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
      result=$(cat Preface/About-lfs-book.txt)
      display_dialog "About LFS Book Version 12 used fog Kognog LFS"
      ;;
    ".2" )
      result=$(cat Preface/About-maintainer.txt)
      display_dialog "About the Manteiner of Kognog LFS"
      ;;
    ".3" )
      result=$(cat Preface/Foreword.txt)
      display_dialog "Foreword"
      ;;
    ".4" )
      result=$(cat Preface/Audience.txt)
      display_dialog "Audience"
      ;;
    ".5" )
      result=$(cat Preface/LFS-target-architectures.txt)
      display_dialog "LFS Target Architectures"
      ;;
    ".6" )
      result=$(cat Preface/Prerequisites.txt)
      display_dialog "Prerequisites"
      ;;
    ".7" )
      result=$(cat Preface/LFS-standards.txt)
      display_dialog "LFS and Standards"
      ;;
    ".8" )
      result=$(cat Preface/Packages-rationale.txt)
      display_dialog "Rationale for Packages in the Book"
      ;;
    ".9" )
      result=$(cat Preface/Typography.txt)
      display_dialog "Typography"
      ;;
    ".10" )
      result=$(cat Preface/Structure.txt)
      display_dialog "Structure"
      ;;
    ".11" )
      result=$(cat Preface/Errata-security.txt)
      display_dialog "Errata and Security Advisories"
      ;;
  esac
done