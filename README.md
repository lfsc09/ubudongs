# ubudongs

Opinionated Ubuntu Setup. *(Inspired by https://github.com/basecamp/omakub)*

**For development check [Development Details](#development-details) section.**

## Installation

For fresh Ubuntu 24.04 installation with GNOME desktop:

```bash
cd /tmp && wget -qO- https://raw.githubusercontent.com/lfsc09/ubudongs/24.04/boot.sh | bash
```

**Note**: Project will be cloned at `~/.local/share/ubudongs`.

### Requirements

- **OS:** Ubuntu 24.04
- **Desktop:** GNOME desktop environment (required)

*Important: Designed for fresh installations, but can be used on existing setups. However, some configurations may conflict with existing ones.*

</br>

## Details

### Additional info

#### Git

The install script can setup one or multiple git configurations with (name, email), and ask to create SSH and GPG keys to use in Github.

If chosen to create, check them after install with:

```bash
gpg --armor --export "$(gpg --list-secret-keys --keyid-format LONG "$(git config --global user.email)" 2>/dev/null | grep -m 1 'sec' | awk '{print $2}' | cut -d'/' -f2)"
```

```bash
cat ~/.ssh/github_$(git config --global user.email | tr '@' '_' | tr '.' '_')_ed25519.pub
```

### Optional installation

#### Programs

- JetBrains Tools
- Obs Studio
- Solaar **[for logitech peripherals]**
- Zoom

### Will be installed

#### Programs

- Brave
- Chrome
- Flameshot **[similar to Windows lightshot]**
- Gimp
- Gnome Tweaks Tool
- Gparted
- Startup Disk Creator
- VLC
- VSCode

#### Fonts

- Fira Code
- JetBrains Mono

#### Dev Tools

- Docker Engine
- LazyDocker **[usable as App]**
- Mise **[language version control]**
- Standard terminal Gnome Terminal *(pumped with)*
  - Fastfetch
  - Starship
  - eza **[to increment `ls`]**
  - Vim **[instead of Nano]**

#### Gnome extensions

- Tophat **[show system monitor in waybar]**
- AlphabeticalAppGrid **[sorts app grid]**
- Unblank **[avoid screen turnoff when logging off]**
- Notification Configurator **[notification position control]**

#### Other tools

- Webapp manager **[create webapps from browsers]**
- Audio output device switcher **[cycle output devices with hotkey]**

#### Other packages

- Build toolchain **[build-essential, clang, rustc]**
- Development libraries **[SSL, readline, YAML, FFI, more..]**
- Media processing **[ffmpeg, imagemagick, libvips]**
- PDF tools **[mupdf]**
- Package managers **[flatpak, pipx]**

### Cleanup

Script will cleanup *(remove)*:

- Firefox
- Nano **[replaced by vim]**

</br>

## Hotkeys

#### Apps

- `<Super>enter`: Terminal
- `<Super>b`: Default browser
- `<Super>f`: Home folder
- `<Super>n`: Gnome text editor

#### Cycle output devices

- `<Super><Control>\`: Cycle selected output devices.
- `<Super><Control><Shift>\`: Configure cycle selected output devices.

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

</br>

## Terminal commands

| Command | Description |
| --- | --: |
| `lz` | List files with eza |
| `lza` | `lz` `+` hidden files |
| `lt` | List files tree style with eza |
| `lta` | `lt` `+` hidden files |
| `dongs` | Run fastfetch to show system info |
| `compress <folder>` | Compress a folder to tar.gz (e.g. `compress my_folder`) |
| `decompress <file>` | Decompress a tar.gz file (e.g. `decompress my_folder.tar.gz`) |
| `web2mp4 <file>` | Convert a web video to mp4 with ffmpeg (e.g. `web2mp4 video.webm`) |
| `transcode-video-1080p <file>` | Transcode a video to 1080p with ffmpeg (e.g. `transcode-video-1080p video.mkv`) |
| `transcode-video-4k <file>` | Transcode a video to 4k with ffmpeg (e.g. `transcode-video-4k video.mkv`) |
| `img2jpg <file>` | Convert an image to jpg with ffmpeg (e.g. `img2jpg image.png`) |
| `img2jpg-small <file>` | Convert an image to jpg with ffmpeg without being too big (e.g. `img2jpg-small image.png`) |
| `img2png <file>` | Convert an image to png with ffmpeg (e.g. `img2png image.jpg`) |

</br>

## Development Details

### Installation

Clone the repository.

```bash
git clone --branch 24.04 git@github.com:lfsc09/ubudongs.git
cd ubudongs
```

Configure git hooks for auto-bumping version on commit.

```bash
make

# Or

make install-hooks
```

### gsettings

Find current gsettings with:

```bash
gsettings list-recursively | grep -i "your search"

# Example:
# gsettings list-recursively | grep -i "app-folders"
```

Or list all gsettings of a property with:

```bash
gsettings list-recursively full.property.path

# Example:
# gsettings list-recursively org.gnome.desktop.background
```
