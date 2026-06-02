# Flashing Walkeeb

1. Push this repository to GitHub.
2. Open the repository on GitHub and go to the Actions tab.
3. Open the newest `Build ZMK firmware` run.
4. Download the `walkeeb-nice_nano` firmware artifact.
5. Double-tap reset on the nice!nano to enter the UF2 bootloader.
6. Copy the Walkeeb `.uf2` file to the mounted bootloader drive.

If Bluetooth pairing behaves strangely, flash the `settings-reset-nice_nano`
artifact once, then flash the normal Walkeeb firmware again.

