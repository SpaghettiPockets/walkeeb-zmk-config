[CmdletBinding()]
param(
    [string]$ConfigDirectory = (Join-Path $PSScriptRoot '../config')
)

$ErrorActionPreference = 'Stop'

foreach ($keyboard in @('maple65', 'walkeeb_v2')) {
    $configPath = Join-Path $ConfigDirectory ($keyboard + '.conf')
    $sleepValues = @(Get-Content -LiteralPath $configPath | ForEach-Object {
        if ($_ -cmatch '^\s*CONFIG_ZMK_SLEEP\s*=\s*(.*?)\s*$') {
            $Matches[1]
        }
    })

    if ($sleepValues.Count -ne 1 -or $sleepValues[0] -cne 'n') {
        throw "$configPath must contain exactly one CONFIG_ZMK_SLEEP=n. Deep sleep is disabled following the confirmed reconnect fix."
    }

    Write-Output "${keyboard}: CONFIG_ZMK_SLEEP=n verified."
}
