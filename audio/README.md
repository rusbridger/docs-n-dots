# Audio

## Audio Control

Use `.scripts/audio.sh`; optionally uses dunst and some icons from the Google Material Icons set.

## [Disable PC Speaker](https://wiki.archlinux.org/index.php/PC_speaker#Disable_PC_Speaker)

```sh
rmmod pcspkr
echo "blacklist pcspkr" | tee /etc/modprobe.d/nobeep.conf
```

