# dotfiles

# Setup password manager

```bash
flatpak install flathub com.bitwarden.desktop
bw config server https://vault.bitwarden.eu
bw login
export BW_SESSION=$(bw unlock --raw)
alias bw="flatpak run --command=bw com.bitwarden.desktop --session $BW_SESSION"
```

## Initialize system

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply $GITHUB_USERNAME
```

## Initialize distrobox container

```bash
distrobox assemble create --file ~/.distrobox/fedora.ini
distrobox enter fedora
~/distrobox/install-nix.sh
```
