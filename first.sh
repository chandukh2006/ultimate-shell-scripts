#!/bin/bash

################################################################################
# Script Name: detect_package_manager.sh
# Description: This script identifies which package manager your Linux OS uses.
# Purpose: Useful in production environments to write cross-distro compatible scripts.
# Supported Package Managers: apt, dnf, yum, rpm, pacman, apk, zypper, xbps
# Author: CHANDU K H
# Last Updated: 2025-04-12
################################################################################

echo " Detecting the package manager used by your system..."


# Function to check if a command exists
check_cmd() {
    if which $1 &>/dev/null; then
        echo " Package Manager Detected: $1"
        exit 0
    fi
}

# List of common package managers by OS family
check_cmd apt         # Debian/Ubuntu
check_cmd dnf         # Fedora, RHEL (newer)
check_cmd yum         # CentOS, RHEL (older)
check_cmd rpm         # Red Hat-based base utility
check_cmd pacman      # Arch Linux
check_cmd apk         # Alpine Linux
check_cmd zypper      # openSUSE
check_cmd xbps-install # Void Linux

# If none of the known managers are found
echo " Unknown package manager. Please verify manually."
exit 1
