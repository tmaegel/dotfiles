# dotfiles

## Setup password manager

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

## Setup system packages

```bash
yq '.packages.system.fedora.remove[]' ~/.local/share/chezmoi/.chezmoidata/packages.yaml | xargs sudo dnf -y remove
yq '.packages.system.fedora.install[]' ~/.local/share/chezmoi/.chezmoidata/packages.yaml | xargs sudo dnf -y install
```

## Setup flatpaks

```bash
flatpak remote-delete fedora
flatpak uninstall --unused --noninteractive
```

```bash
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
yq '.flatpaks[]' ~/.local/share/chezmoi/.chezmoidata/flatpaks.yaml | xargs flatpak install --system --noninteractive flathub
```

## Setup VSCode

```bash
sudo tee /etc/yum.repos.d/vscode.repo <<'EOF'
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sudo dnf -y install code
```

```bash
for extension in $(yq '.vscode.extensions[]' ~/.local/share/chezmoi/.chezmoidata/packages.yaml); do
  code --install-extension "$extension"
done
```

## Initialize distrobox (pet) container

```bash
distrobox assemble create --file ~/.distrobox/fedora.ini
distrobox enter fedora
~/distrobox/install-nix-packages.sh
```

## Install icon theme

```bash
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git
./install.sh nord
```
