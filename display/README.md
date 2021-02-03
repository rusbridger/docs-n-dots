# Display

## Screen Backlight

The script `brightness.sh` controls the screen backlight brightness. Optionally uses `dunst` and icons from the Google Material Icons set.

```sh
brightness.sh [down | up]
```

### Dependencies

- [dunst](https://www.archlinux.org/packages/community/x86_64/dunst/)
  - The `dunstify` call in `notify()` can probably be replaced with other notification functions.
- [light-git](https://aur.archlinux.org/packages/light-git/)
- The following icons were from the Google Material Icons (Filled) set but can be from any set identified in the `dunstrc`.
  - `brightness_high`
  - `brightness_low`
- UTF-8 Encoding

## Monitors

I use an XMonad keybinding to trigger `autorandr` to switch my monitor profile. The settings for my profiles are in the `autorandr` directory.

- `docker`: `2560x1440`
- `mobile`: `1920x1080`
