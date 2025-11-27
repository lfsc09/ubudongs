# ubudongs
Opinionated Ubuntu Setup

Inspired from https://github.com/basecamp/omakub

## Installation

For fresh Ubuntu 24.04+ installations with GNOME desktop:

```bash
cd /tmp && wget -qO- https://raw.githubusercontent.com/lfsc09/ubudongs/main/boot.sh | bash
```

**Note**: The installer will prompt you to select optional applications and configure Git. \
**Note2**: Project will be cloned at `~/.local/share/ubudongs`.

### Requirements

- **OS:** Ubuntu 24.04 or later
- **Desktop:** GNOME desktop environment (required)
- **Disk Space:**
  - Minimum: ~4 GB (no optional apps)
  - Default: ~5.5 GB (with Datagrip + Solaar)
  - Maximum: ~7 GB (all optional apps selected)

**Important:** This script is designed for fresh installations only

## Details

### Installed software

- Brave
- Chrome
- Datagrip (Optional)
- Flameshot - _lightshot substitute_
- Obs (Optional)
- Steam (Optional)
- Solaar (Optional) - _for logitech peripherals_
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
- eza - _to replace `ls`_
- Vim (instead of Nano)

### Gnome extensions

- Tophat
- AlphabeticalAppGrid - _sorts app grid_
- Unblank - _avoid screen turnoff when logging off_
- Notification Configurator - _notification position control_

### Other packages

- Build toolchain (build-essential, clang, rustc)
- Development libraries (SSL, readline, YAML, FFI, etc.)
- Media processing (ffmpeg, imagemagick, libvips)
- PDF tools (mupdf)
- Package managers (flatpak, pipx)

### Additional info

#### Git

The script can setup git (name, email), and ask to create SSH and GPG keys to use in Github.

If chosen to create, check them after install with:

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
- **Ubudongs installation directory** - Self-deletes after reboot via crontab

## Hotkeys

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
