# Walkeeb v2 ZMK firmware

This branch is a ZMK config for Walkeeb v2, using the same repo structure as the
working YeloKeeb firmware and targeting a nice!nano v2 controller.

## Confirmed sleep/reconnection fix

On 2026-09-28, Ivan confirmed that firmware `8a22cd2` fixed the inactivity/reconnection problem on both Maple65 and Walkeeb by disabling deep sleep:

```ini
CONFIG_ZMK_SLEEP=n
```

This is the default for both keyboards in `config/maple65.conf` and `config/walkeeb_v2.conf`. Keep it in all future builds unless an explicit new sleep experiment is requested. Normal idle remains enabled; Bluetooth compatibility settings and battery reporting are unchanged. Battery consumption may be higher than with deep sleep.

Start future builds from current `main`; older experiment branches may have superseded settings. GitHub Actions checks both configuration files before compiling and fails if the explicit disabled-sleep setting is missing, duplicated or changed. Run the same check locally with `pwsh -File scripts/check-sleep-settings.ps1`.

Suggested GitHub repository:

```text
https://github.com/SpaghettiPockets/walkeeb-zmk-config
```

## Layout

The keymap follows the updated KLE sketch as a 64-key keyboard with two total
layers:

- `BASE`: letters, modifiers, space keys, arrows, Backspace, Enter, Tab, Esc.
- `FN`: the only function layer, containing every bottom-right legend from the
  sketch, including F1-F12, End, Home, PgUp, PgDn, Insert, symbols, and
  Bluetooth reset controls.

There is no separate number layer and no separate F-row layer.

The keymap assumes the host computer uses a Norwegian keyboard layout. The
Norwegian letter, number-row, comma, period, and dash keys are sent as physical
HID key positions, which lets Windows/macOS/Linux produce the shifted Norwegian
symbols normally.

The Fn layer also includes firmware text macros:

- `Fn + M`: personal email.
- `Fn + N`: work email.
- `Fn + B`: street address.
- `Fn + V`: postcode and city.
- `Fn + C`: full name.

Bluetooth controls are available on the Fn layer:

- `Fn + AA`: clear the selected Bluetooth profile.
- `Fn + Delete`: clear all Bluetooth profiles.

## Hardware assumptions

- nice!nano v2 using the `nice_nano_v2` board target.
- Handwired unibody keyboard.
- 5 row x 13 column matrix.
- `col2row` diodes, meaning diode stripe/cathode side on the row side.
- Rows on nice!nano D0-D4.
- Columns on nice!nano D5, D6, D7, D8, D9, D10, D16, D14, D15, D19, D20,
  D18, D21.
- Bottom row has no switch at column 6, counting from 0.

If you use an original nice!nano v1, change `build.yaml` from:

```yaml
board: nice_nano_v2
```

to:

```yaml
board: nice_nano
```

## Important

The row/column wiring is defined in
`boards/shields/walkeeb_v2/walkeeb_v2.overlay`. With 5 row pins and 13 column
pins, the matrix has 65 possible positions. The layout uses 64 because bottom
row column 6 is intentionally empty.

## Build

Start from current `main` and push your changes to GitHub. The workflow in
`.github/workflows/build.yml` checks the sleep settings and builds firmware
automatically. Download the `firmware` artifact from the successful Actions run
for your chosen commit and extract it. Use `walkeeb_v2-nice_nano_v2.uf2` for
Walkeeb or `maple65-nice_nano_v2.uf2` for Maple65.

The archive also contains `settings-reset-nice_nano_v2.uf2`, which is not needed
for a normal update. Copy only the matching keyboard's UF2 to its nice!nano
bootloader drive.

## Files

- `build.yaml`: GitHub Actions build matrix.
- `config/west.yml`: ZMK dependency manifest.
- `zephyr/module.yml`: tells ZMK that this repo contains board/shield files.
- `boards/shields/walkeeb_v2/walkeeb_v2.keymap`: your editable keymap.
- `boards/shields/walkeeb_v2/walkeeb_v2.overlay`: GPIO and matrix wiring.
