# Flashing Walkeeb

1. Start from current `main`, preserve `CONFIG_ZMK_SLEEP=n` for both keyboards, and push your changes to GitHub.
2. Open the repository on GitHub and go to the Actions tab.
3. Open the successful `Build ZMK firmware` run for the commit you pushed, or the current `main` commit if you are downloading the standard firmware.
4. Download and extract the `firmware` artifact.
5. Double-tap reset on the nice!nano to enter the UF2 bootloader.
6. Copy `walkeeb_v2-nice_nano_v2.uf2` to Walkeeb's bootloader drive, or `maple65-nice_nano_v2.uf2` to Maple65's bootloader drive.

The artifact contains firmware for both keyboards and a separate
`settings-reset-nice_nano_v2.uf2`. The settings-reset file is not needed for a
normal firmware update.
