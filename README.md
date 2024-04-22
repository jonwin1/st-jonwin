# St Jonwin

My st configuration with flake.nix

<img src="./img.png" alt="Image of st terminal">

## st - simple terminal

st is a simple terminal emulator for X which sucks less.


## Requirements

- Xlib header files.
- FiraCode Nerd Font


## Installation

### Most distros

Edit config.mk to match your local setup (st is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install st (if
necessary as root):

    make clean install

### NixOS

#### Test

To test run this configuration an any system with nix run the following:

    nix run github:jonwin1/st-jonwin

#### Install

Add this repo as an input in your flake.nix:

    inputs = {
        st = {
            url = "github:jonwin1/st-jonwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

Then add this to your configuration.nix to install st:

    environment = {
        systemPackages = with pkgs; [
            inputs.st.packages."x86_64-linux".default
        ];
    };

## Installed patches

- none

## Credits

Based on Aurélien APTEL <aurelien dot aptel at gmail dot com> bt source code.

