# Firmware defaults

Read README.md before changing or building this firmware.

On 2026-09-28, Ivan confirmed that disabling deep sleep fixed the inactivity/reconnection problem on both Maple65 and Walkeeb. The verified firmware baseline is commit 8a22cd293652d785472dc5688710b3db524ba5ab.

Preserve exactly one explicit `CONFIG_ZMK_SLEEP=n` in both `config/maple65.conf` and `config/walkeeb_v2.conf` for future builds. Do not re-enable deep sleep, remove the setting, or bypass the build check unless the user explicitly requests a new sleep experiment. Ordinary idle, Bluetooth compatibility settings, battery reporting, GPIO assignments and keymaps should remain unchanged unless the current task requires otherwise.

Start future work from current `main`. Older experiment branches and source snapshots are historical references and may contain superseded settings. Run `./scripts/check-sleep-settings.ps1` before building. GitHub Actions runs the same check before firmware compilation.

The fix is confirmed by the user's test; the precise underlying wake/reconnection fault was not isolated. This context does not authorize flashing hardware or publishing unrelated changes.
