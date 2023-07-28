# Xwayland Video Bridge Quick Setup TESTING
Quick Setup Script to install the XWayland Video Bridge made by KDE. It installs Flatpak (if not already installed), adds Flathub and KDEApps as the repositories and installs the XWayland Video Bridge Flatpak. **THIS IS THE TESTING BRANCH! USE AT YOUR OWN RISK!**

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
  * Installation on Gentoo may be flaky. I added a check for systemd on Gentoo, but I can't test it right now due to my Gentoo VM being borked. When you want to use it, be aware that this is untested!
