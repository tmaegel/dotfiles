# dotfiles

## Initialize system

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply $GITHUB_USERNAME
```

## Initialize distrobox container

```bash
distrobox assemble create --file ~/.distrobox/fedora.ini
distrobox enter fedora
chezmoi apply
```
