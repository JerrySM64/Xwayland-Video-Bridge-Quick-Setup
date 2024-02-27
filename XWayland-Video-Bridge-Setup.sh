#!/bin/bash

# DEBUG: Redirect output to a log file
#exec > >(tee xwvb_output.log)
#exec 2>&1

# Check the Linux distribution
check_distro() {
    if [ -f "/etc/os-release" ] && grep -qi "debian" /etc/os-release; then
        echo "Debian detected."
    elif [ -f "/etc/os-release" ] && grep -qi "ubuntu" /etc/os-release; then
        echo "Ubuntu detected."
    elif [ -f "/etc/os-release" ] && grep -qi "mint" /etc/os-release; then
        echo "Linux Mint detected."
    elif [ -f "/etc/os-release" ] && grep -qi "fedora" /etc/os-release; then
        echo "Fedora detected."
    elif [ -f "/etc/os-release" ] && grep -qi "opensuse" /etc/os-release; then
        echo "openSUSE detected."
    elif [ -f "/etc/os-release" ] && grep -qi "arch" /etc/os-release; then
        echo "Arch Linux detected."
    elif [ -f "/etc/os-release" ] && grep -qi "gentoo" /etc/os-release; then
        echo "Gentoo detected."
    elif [ -f "/etc/os-release" ] && grep -qi "void" /etc/os-release; then
        echo "Void Linux detected."
    else
        echo "Unsupported distribution. Flatpak installation won't work!"
    fi
}

# Check if Flatpak is installed and install it if not
inst_flatpak() {
    if ! command -v flatpak &>/dev/null; then
        echo "Flatpak is not installed. Installing..."
        # Check the package manager used by the distro and install Flatpak accordingly
        if [ -f "/etc/os-release" ] && grep -qi "debian" /etc/os-release; then
            sudo apt update
            sudo apt install -y flatpak
        elif [ -f "/etc/os-release" ] && grep -qi "ubuntu" /etc/os-release; then
            sudo apt update
            sudo apt install -y flatpak
        elif [ -f "/etc/os-release" ] && grep -qi "mint" /etc/os-release; then
            sudo apt update
            sudo apt install -y flatpak
        elif [ -f "/etc/os-release" ] && grep -qi "fedora" /etc/os-release; then
            sudo dnf install -y flatpak
        elif [ -f "/etc/os-release" ] && grep -qi "opensuse" /etc/os-release; then
            sudo zypper in flatpak
        elif [ -f "/etc/os-release" ] && grep -qi "arch" /etc/os-release; then
            sudo pacman -Syu --noconfirm flatpak
        elif [ -f "/etc/os-release" ] && grep -qi "gentoo" /etc/os-release; then
            echo "sys-apps/flatpak X policykit seccomp systemd" | sudo tee /etc/portage/package.use/flatpak-xwvb-script
            sudo emerge -q sys-apps/flatpak
        elif [ -f "/etc/os-release" ] && grep -qi "void" /etc/os-release; then
            sudo xbps-install -S flatpak
        else
            echo "Unsupported distribution. Can't install Flatpak. Install Flatpak on your system and try again!"
            exit 1
        fi
        echo "Flatpak has been installed successfully."
    else
        echo "Flatpak is already installed."
    fi
}

# Add Flatpak repositories
add_repos() {
    echo "Adding repositories..."
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    flatpak remote-add --if-not-exists kdeapps https://distribute.kde.org/flatpak-apps-testing/
}

# Install the XWayland Video Bridge
inst_xwvb() {
    echo "Installing XWayland Video Bridge..."
    flatpak install --user --or-update https://cdn.kde.org/flatpak/xwaylandvideobridge-nightly/org.kde.xwaylandvideobridge.flatpakref
}

# Executing all functions
check_distro

inst_flatpak

add_repos

inst_xwvb

# It's done, yay!
echo "XWayland Video Bridge installed successfully. Have fun!"

