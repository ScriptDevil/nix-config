# Instructions for NixOS 20.09

```bash
ln -s $PWD/etc/nixos/configuration.nix /etc/nixos/configuration.nix
ln -s $PWD/.config/nixpkgs ~/.config/nixpkgs


nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

nixos-rebuild switch
home-manager switch
```
