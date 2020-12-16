# Steam

## Fonts

Install `steam-fonts` to fix the scrambed fonts on menus.

## Counter-Strike: Global Offensive

Use the following launch settings.

```sh
-windowed -freq 60 -refresh 60 -processheap
```

## Left 4 Dead 2

Some of the ports of Left 4 Dead maps are too dark and the `video.txt` file needs to be adjusted. Add this setting to `~/.steam/steam/steamapps/common/Left\ 4\ Dead\ 2/left4dead2/cfg/video.txt`.

```json
"setting.mat_tonemapping_occlusion_use_stencil" "1"
```

