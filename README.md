# tmp_inodes

Waybar widget + CLI helper to monitor `/tmp` inode usage.

We keep filling up `/tmp` inodes, so this keeps an eye on it.

## Files

| File | Purpose |
|------|---------|
| `waybar_tmp_inodes.sh` | Waybar custom module — outputs JSON with text, tooltip, color |
| `check_tmp_inodes` | CLI helper — prints a summary to stdout or sends a dunst notification (`--notify`) |

## Waybar config

```json
"custom/tmp_inodes": {
    "format": "{}",
    "return-type": "json",
    "exec": "$HOME/.config/waybar/tmp_inodes/waybar_tmp_inodes.sh",
    "interval": 60,
    "tooltip": true,
    "on-click": "exec ~/bin/check_tmp_inodes --notify"
}
```

## Style

```css
#custom-tmp_inodes {
    padding: 0 8px;
}
```

Color is handled dynamically by the script (green < 80%, yellow 80–90%, red > 90%).
