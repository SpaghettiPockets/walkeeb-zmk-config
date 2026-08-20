# Walkeeb layout notes

This layout was transcribed from the updated KLE sketch.

## Base layer

```text
Esc   1   2   3   4   5   6   7   8   9   0   +   Backspace
Tab   Q   W   E   R   T   Y   U   I   O   P   AA  Delete
Caps  A   S   D   F   G   H   J   K   L   OE  AE  Enter
Shift Z   X   C   V   B   N   M   ,   .   -   Up  Shift
Ctrl  Win Alt Fn  Space Enter [gap] Space Fn AltGr Left Down Right
```

`AA`, `OE`, and `AE` are the Norwegian letter keys after `P` and `L`.

The number row, comma, period, and hyphen keys are intentionally normal
Norwegian base-layer keys:

- Shift + 1 through 0 sends the Norwegian shifted number-row symbols.
- Shift + plus sends question mark on a Norwegian host layout.
- Shift + comma sends semicolon on a Norwegian host layout.
- Shift + period sends colon on a Norwegian host layout.
- Shift + hyphen sends underscore on a Norwegian host layout.

## Fn layer

Hold either `Fn` key. This is the only non-base layer.

```text
End   F1  F2  F3  F4  F5  F6  F7  F8  F9  F10 F11 F12
      <   >   '   *   diaeresis `   \   `           BTClr BTClrAll
                                                  Home
          Name Post Address WorkMail Gmail        PgUp
                                                       PgDn Insert
```

Fn macros:

```text
Fn + M = ivan.a.reigstad@gmail.com
Fn + N = ivan@sagenedata.no
Fn + B = Bentsebrugata 17d
Fn + V = 0476 Oslo
Fn + C = Ivan Alexander Reigstad
```

Bluetooth controls:

```text
Fn + AA = clear the selected Bluetooth profile
Fn + Delete = clear all Bluetooth profiles
```

## Assumed matrix

The starter firmware now uses a 5 x 13 matrix with one missing bottom-row
position at column 6:

```text
r0: Esc 1 2 3 4 5 6 7 8 9 0 + Backspace
r1: Tab Q W E R T Y U I O P AA Delete
r2: Caps A S D F G H J K L OE AE Enter
r3: Shift Z X C V B N M , . - Up Shift
r4: Ctrl Win Alt Fn Space Enter [no C6] Space Fn AltGr Left Down Right
```

## GPIO

The diode stripe/cathode side is assumed to be on the row side. In ZMK terms
that is:

```text
diode-direction = "col2row"
```

Rows:

```text
R0=D0
R1=D1
R2=D2
R3=D3
R4=D4
```

Columns:

```text
C0=D5
C1=D6
C2=D7
C3=D8
C4=D9
C5=D10
C6=D16
C7=D14
C8=D15
C9=D18
C10=D19
C11=D20
C12=D21
```
