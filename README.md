# Dot Files

**Dot Files** is a personal configuration setup for macOS, featuring a custom menu bar and window management hot keys.

![A menu bar on macOS, displaying a currently playing song.](https://www.dropbox.com/scl/fi/xh0s8ids5i4qk1tt2gnl4/Dot-Files-Menu-Bar.png?rlkey=hj9fcnv3rrja6o76y060ktqlx&st=xmpoinsw&raw=1)

The configuration installs the following primary binaries:
* `brew` (a package manager for macOS),
* `sketchybar` (a status bar manager),
* `yabai` (a window management utility), and
* `skhd` (a hotkey daemon).


## Usage
### Installing the Packages and Downloading Configuration Files
Follow the instructions below to set up the configuration files for window management and displaying the menu bar. The instructions assume that the user is familiar with Terminal, is running macOS, and has `git` already setup on their system.

#### Creating a Configuration Directory
Create a new configuration directory `.config` within the user’s home directory. Open Terminal and run the following command.

```bash
mkdir .config
cd .config
```

#### Cloning the Configuration
Copy the configuration files into the `.config` directory by running the following command.
```bash
git clone https://github.com/EdwardNgg/Dot-Files .
```

#### Installing Packages
To install the necessary packages and start services, run the installation script.
```bash
./.install.sh
```
