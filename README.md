# gotify-send

**View gotify notifications directly in your desktop session**

✓ Desktop environment agnostic<br>
✓ Compatible with daemons like mako and dunst<br>
✓ Displays gotify application icons<br>
✓ Optional hook feature<br>
✓ Lightweight and fast

## Dependencies

> [!NOTE]
> If you don't want dash installed on your system you can simply change the shebang to bash, gotify-send will still work

- [dash](https://wiki.archlinux.org/title/Dash)
- [curl](https://github.com/curl/curl)
- [jq](https://github.com/jqlang/jq)
- [websocat](https://github.com/vi/websocat)

## Installation

There's 2 ways to run gotify-send:

A) just start the script<br>
B) systemd service (recommended)

For option A you need to set *GOTIFY_URL* and *GOTIFY_TOKEN* environment variables and run `./gotify-send`

**Option B)**

```bash
# Clone and cd
git clone https://github.com/DarioDarko/gotify-send
cd gotify-send

# Make gotify-send executable and copy it
chmod +x gotify-send
mkdir -p ~/.local/bin
cp gotify-send ~/.local/bin

# Edit configuration
# HOOK and HOOK_ALLOWED_APPS are optional settings you can ignore
vim gotify-send.env

# Copy gotify-send config
mkdir -p ~/.config/gotify-send
cp gotify-send.env ~/.config/gotify-send

# Enable systemd service
mkdir -p ~/.config/systemd/user
cp gotify-send.service ~/.config/systemd/user
systemctl --user enable --now gotify-send
```

## Hook

> [!WARNING]
> Use with caution, gotify-send spawns whatever process you configure as the hook!<br>
> Also keep in mind, that *anyone* with access to your gotify app tokens can trigger execution of the hook. So you should **not** use it for critical commands like `rm` or anything with `ssh`!<br>

The gotify-send hook is an optional feature you can use to ... well, that's up to you. The notification will be forwarded to any script or application you please

**Example usecases**

- Text to Speech notifications
- Pause audio/video playback for important notifications
- Auto-enable *Do Not Disturb* mode on meeting notifications
- Remote control your PC with your smartphone
- Log notifications to a database

All relevant notification details will be passed as:

> --title "$title"<br>
> --message "$message"<br>
> --priority "$priority"<br>
> --appid "$appid"

**Configuration**

```ini
# Path to your hook
HOOK=/path/to/hook

# Gotify apps that are allowed to trigger hook execution
HOOK_ALLOWED_APPS=1,2,3,4
```

Configure the hook in *~/.config/gotify-send/gotify-send.env* or start gotify-send with `--hook "/path/to/hook"` and `--hook-allowed-apps "1,2,3,4"`. Enable gotify apps by adding their app id to the comma separated list, apps that are not explicitly allowed will be ignored. If you don't want to use this feature leave HOOK= and HOOK_ALLOWED_APPS= empty

You can find an example on how to use the hook [here](https://raw.githubusercontent.com/DarioDarko/gotify-send/refs/heads/main/gotify-send-hook.sh)

## Removal

```bash
# Disable systemd service
systemctl --user disable --now gotify-send

# Remove gotify-send
rm ~/.local/bin/gotify-send

# Remove config
rm -r ~/.config/gotify-send
```

Having trouble using gotify-send? Feel free to open an issue
