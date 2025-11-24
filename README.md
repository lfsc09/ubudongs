# ubudongs
Opinionated Ubuntu Setup

Inspired from https://github.com/basecamp/omakub

## Changes

### Installed software

- Brave
- Chrome
- Datagrip (Optional)
- Flameshot - _lightshot substitute_
- Obs (Optional)
- Steam (Optional)
- Solaar (Optional) - _for logitech periphericals_
- Virtual Box (Optional)
- VLC
- Vscode
- Zoom (Optional)

#### Others

- Docker Engine
- LazyDocker (as App)
- Mise (language version control)
- Other packages...

### Terminal

Standard gnome terminal pumped with:

- Fastfetch
- Starship
- Vim (instead of Nano)

### Gnome Extensions

- Tophat
- AlphabeticalAppGrid - _sorts app grid_
- Coffeine - _avoid screen shutdown_

## Additional info

#### Git

The script can setup git (name, email), and ask to create SSH and GPG keys to use in Github.

If choosen to create, check them after install with:

```bash
gpg --armor --export "$(gpg --list-secret-keys --keyid-format LONG "$(git config --global user.email)" 2>/dev/null | grep -m 1 'sec' | awk '{print $2}' | cut -d'/' -f2)"
```

```bash
cat ~/.ssh/github_$(git config --global user.email | tr '@' '_' | tr '.' '_')_ed25519.pub
```

#### Cleanup

Script will cleanup (remove):

- Firefox
- Nano (replaced by vim)

## Shotcut list

#### Cycle output devices

- `<Super><Control>\`: Cycle selected output devices.

#### Change wallpaper

- `<Super><Control>space`: Cycle wallpapers.

#### Ubuntu tiling extension

- `<Super><Control>p`: Tile window to top-left.
- `<Super><Control>[`: Tile window to top half.
- `<Super><Control>]`: Tile window to top-right.
- `<Super><Control>l`: Tile window to left half.
- `<Super><Control>;`: Tile window to maximize.
- `<Super><Control>'`: Tile window to right half.
- `<Super><Control>,`: Tile window to bottom-left.
- `<Super><Control>.`: Tile window to bottom half.
- `<Super><Control>/`: Tile window to bottom-right.
