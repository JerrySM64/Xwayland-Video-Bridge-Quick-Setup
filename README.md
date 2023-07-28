# Xwayland-Video-Bridge-Quick-Setup
Quick Setup Script to install the XWayland Video Bridge made by KDE. It installs Flatpak (if not already installed), adds Flathub and KDEApps as the repositories and installs the XWayland Video Bridge Flatpak.

## Supported Distros:
* Arch Linux
* Debian 12 or later
* Fedora 38 or later
* Gentoo
* Linux Mint 21 or later
* openSUSE Tumbleweed
* Ubuntu 22.04 LTS or later
* Void Linux

  ## What if my distro is not in the list of supported distros?
  No problem! Make sure Flatpak is installed and run the script. If it recognizes a installed Flatpak installation, it will continue. No matter if the distribution is supported or not!

  ## Is support for more distros planned?
  Yes. Right now, I'm looking at adding support for Solus and maybe MX Linux.

  ## Gotchas
  * Installation on Gentoo may fail. The reason for that is that the script creates a flatpak-xwvb-script file with Flatpak's USE Flags in /etc/portage/package.use and systemd is part of those USE flags. This **may** lead to issues with Gentoo on OpenRC. If you're using OpenRC on Gentoo, remove the systemd USE Flag or if you're sure you already have those in your make.conf, you can remove the line altoghether
