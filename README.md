# dotfiles

## Initialize system

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init --apply $GITHUB_USERNAME
```

## Initialize distrobox container

```bash
distrobox assemble create --file ~/.distrobox/fedora.ini
distrobox enter fedora
chezmoi state delete-bucket --bucket=entryState # Reset run_onchange_* scripts
chezmoi state delete-bucket --bucket=scriptState # Reset run_once_* scripts
chezmoi apply
```
