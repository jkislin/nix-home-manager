# Nix Home Manager for the CFA VAP
> With thanks to: 
> - https://zenoix.com/posts/get-started-with-nix-and-home-manager/#what-is-home-manager
> - https://www.chrisportela.com/posts/home-manager-flake/

> See: 
> - https://nix-community.github.io/home-manager/
> - https://github.com/nix-community/home-manager

This is an extremely experimental nix home manager setup for the CFA VAP (you can also try it on WSL on your GFE. There are ways to get it running on Mac OS, too, though some changes are needed.)

Nix home manager allows us to reproducibly maintain the same environments for all users across all platforms (WSL, Linux, and Mac) and also allows users their own customizability and ability to suggest changes to our upstream version.

This is currently an extremely experimental and minimal example. Use at your own risk for now!

## Usage

### Installation instructions
1. Clone this repository as `~/.config/home-manager`.
    - gh cli: `gh repo clone jkislin/nix-home-manager ~/.config/home-manager`
    - git cli: `git clone https://github.com/jkislin/nix-home-manager.git ~/.config/home-manager`

2. Install `nix` and enable the flakes feature:
    - `sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon` will install `nix`.
    - Use `--no-daemon` instead if you are running nix inside a container or if you want to keep it limited to your user.
    - To enable flakes, edit your `~/.config/nix/nix.conf` and add a line: 
        - `experimental-features = nix-command flakes`.
        - For convenience run: `echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf`.
    - For details, see: https://nixos.org/download/#nix-install-linux.

3. Install `home-manager` and initialize based on the flake in this repository: 
    - Modify `["vapuser"]` in flake.nix to your `["your_username"]. 
    - Run `nix run home-manager -- init --switch --flake ~/.config/home-manager`
    - This will initialize the `home-manager` config you cloned in step 1 and also activate it.

### Customizing your own config
1. Make changes to `~/.config/home-manager/home.nix`.
2. Run `home-manager switch` to activate your new changes. That's it!

### Submitting your own changes as PRs
1. Open a new branch in your `.config/home-manager` repository.
2. Make changes and push your branch.
3. Open a PR.

### Rapid prototyping
- Run `make run` to jump into a development docker container with `home-manager` installed and initialized.  
- Then, run `home-manager switch --flake .` to test the `flake.nix`/`home.nix` combination in this repository.
- You can edit `home.nix` from outside the container and rerun `home-manager switch --flake .` inside the container to test edits.
- After exiting the container, make sure you run `sudo chown $USER .` to relinquish your git repo ownership back to your local environment.