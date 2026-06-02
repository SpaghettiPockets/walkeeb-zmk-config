# Walkeeb v2 ZMK firmware

This branch is a ZMK config for Walkeeb v2, using the same repo structure as the
working YeloKeeb firmware and targeting a nice!nano v2 controller.

Suggested GitHub repository:

```text
https://github.com/SpaghettiPockets/walkeeb-zmk-config
```

## Layout

The keymap follows the updated KLE sketch as a 64-key keyboard with two total
layers:

- `BASE`: letters, modifiers, space keys, arrows, Backspace, Enter, Tab, Esc.
- `FN`: the only function layer, containing every bottom-right legend from the
  sketch, including F1-F12, End, Home, PgUp, PgDn, Insert, and symbols.

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

Push this branch to GitHub. The workflow in `.github/workflows/build.yml`
will build firmware automatically. Download the Walkeeb v2 artifact
from the latest Actions run and copy the `.uf2` file to the nice!nano bootloader
drive.

This v2 branch intentionally builds only the keyboard firmware artifact, so
there is no settings-reset UF2 to mix up during testing.

## Files

- `build.yaml`: GitHub Actions build matrix.
- `config/west.yml`: ZMK dependency manifest.
- `zephyr/module.yml`: tells ZMK that this repo contains board/shield files.
- `boards/shields/walkeeb_v2/walkeeb_v2.keymap`: your editable keymap.
- `boards/shields/walkeeb_v2/walkeeb_v2.overlay`: GPIO and matrix wiring.
