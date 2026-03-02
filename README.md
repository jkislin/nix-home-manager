# Nix Home Manager Config for use with CFA VAP

This is an experimental nix home manager setup, forked with appreciation from [Gio](https://github.com/giomrella).

Nix home manager allows us to reproducibly maintain the same environments for all users across all platforms (WSL, Linux, and Mac) and also allows users their own customizability and ability to suggest changes to our upstream version.

## Installation instructions
1. Install nix for [Linux](https://nixos.org/download/#nix-install-linux), for [Linux in WSL](https://nixos.org/download/#nix-install-windows), or for [Mac](https://nixos.org/download/#nix-install-macos).
2. Clone this repository to `~/.config/nix-home-manager`.
3. Run `nix-home-manager init ~/.config/nix-home-manager`.

## Customizing your own config
1. Ideally, fork the repository to your own user in Github, and either initially clone from there or add this new fork as a remote with `git remote add fork <your url>`.
2. Make changes to `home.nix`.
3. Commit your changes and push them to github (on your fork).
4. `nix-home-manager switch ~/.config/nix-home-manager`.

Also feel free to submit PRs to our larger CFA VAP nix-home-manager config.