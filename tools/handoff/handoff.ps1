param(
    [Parameter(Position = 0, Mandatory = $true)]
    [ValidateSet("new", "check")]
    [string] $Command,

    [Parameter()]
    [string] $Path
)

$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[Console]::OutputEncoding = $Utf8NoBom
$OutputEncoding = $Utf8NoBom

$RequiredFields = @(
    "SESSION_STATUS",
    "CONTINUE_ALLOWED",
    "STOP_REASON",
    "CURRENT_REPO_STATE",
    "CURRENT_TASK_STATE",
    "NEXT_OWNER",
    "NEXT_SESSION_NAME",
    "NEXT_SESSION_GOAL",
    "NEXT_SESSION_END_CONDITION",
    "NEXT_SESSION_FIRST_PROMPT"
)

function Get-FirstMeaningfulLine {
    param([string] $Text)

    if ([string]::IsNullOrWhiteSpace($Text)) {
        return "UNAVAILABLE"
    }

    $line = ($Text -split "`r?`n" | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -First 1)
    if ([string]::IsNullOrWhiteSpace($line)) {
        return "UNAVAILABLE"
    }

    return $line.Trim()
}

function Invoke-GitSafe {
    param(
        [string] $WorkingDirectory,
        [string[]] $Arguments
    )

    try {
        $output = & git -C $WorkingDirectory @Arguments 2>&1
        $exitCode = $LASTEXITCODE
        $text = ($output | ForEach-Object { $_.ToString() }) -join "`n"

        if ($exitCode -eq 0) {
            return [PSCustomObject]@{
                Ok = $true
                Output = $text.Trim()
                ExitCode = $exitCode
                ErrorSummary = "NONE"
            }
        }

        return [PSCustomObject]@{
            Ok = $false
            Output = $text.Trim()
            ExitCode = $exitCode
            ErrorSummary = (Get-FirstMeaningfulLine $text)
        }
    }
    catch {
        return [PSCustomObject]@{
            Ok = $false
            Output = ""
            ExitCode = -1
            ErrorSummary = (Get-FirstMeaningfulLine $_.Exception.Message)
        }
    }
}

function Add-GitError {
    param(
        [System.Collections.ArrayList] $Errors,
        [string] $Label,
        $Result
    )

    if (-not $Result.Ok) {
        [void] $Errors.Add(("{0}: {1}" -f $Label, $Result.ErrorSummary))
    }
}

function Get-StatusBranch {
    param([string] $StatusSb)

    if ([string]::IsNullOrWhiteSpace($StatusSb) -or $StatusSb -eq "UNAVAILABLE") {
        return "UNAVAILABLE"
    }

    $firstLine = ($StatusSb -split "`r?`n" | Select-Object -First 1)
    if ($firstLine -match "^##\s+(.+)$") {
        $head = $Matches[1].Trim()
        $head = ($head -split "\s+")[0]
        if ($head -match "^(.*?)\.\.\.") {
            return $Matches[1]
        }
        return $head
    }

    return "UNAVAILABLE"
}

function Get-AheadBehind {
    param([string] $StatusSb)

    if ([string]::IsNullOrWhiteSpace($StatusSb) -or $StatusSb -eq "UNAVAILABLE") {
        return "UNAVAILABLE"
    }

    $firstLine = ($StatusSb -split "`r?`n" | Select-Object -First 1)
    if ($firstLine -match "\[(.*?)\]") {
        return $Matches[1]
    }

    return "NONE_REPORTED"
}

function Get-DirtyFiles {
    param([string] $ShortStatus)

    if ([string]::IsNullOrWhiteSpace($ShortStatus)) {
        return "NONE"
    }

    if ($ShortStatus -eq "UNAVAILABLE") {
        return "UNAVAILABLE"
    }

    $files = @()
    foreach ($line in ($ShortStatus -split "`r?`n")) {
        if ([string]::IsNullOrWhiteSpace($line)) {
            continue
        }

        if ($line.Length -gt 3) {
            $files += $line.Substring(3).Trim()
        }
        else {
            $files += $line.Trim()
        }
    }

    if ($files.Count -eq 0) {
        return "NONE"
    }

    return ($files -join ", ")
}

function New-Handoff {
    $workingDirectory = (Get-Location).ProviderPath
    $gitErrors = New-Object System.Collections.ArrayList

    $rootResult = Invoke-GitSafe -WorkingDirectory $workingDirectory -Arguments @("rev-parse", "--show-toplevel")
    Add-GitError -Errors $gitErrors -Label "repo root" -Result $rootResult

    if ($rootResult.Ok -and -not [string]::IsNullOrWhiteSpace($rootResult.Output)) {
        $repoPath = Get-FirstMeaningfulLine $rootResult.Output
        $gitDirectory = $repoPath
    }
    else {
        $repoPath = "UNAVAILABLE"
        $gitDirectory = $workingDirectory
    }

    $statusSbResult = Invoke-GitSafe -WorkingDirectory $gitDirectory -Arguments @("status", "-sb")
    $statusShortResult = Invoke-GitSafe -WorkingDirectory $gitDirectory -Arguments @("status", "--short")
    $commitResult = Invoke-GitSafe -WorkingDirectory $gitDirectory -Arguments @("log", "-1", "--format=%H %s")

    Add-GitError -Errors $gitErrors -Label "status -sb" -Result $statusSbResult
    Add-GitError -Errors $gitErrors -Label "status --short" -Result $statusShortResult
    Add-GitError -Errors $gitErrors -Label "latest commit" -Result $commitResult

    $statusSb = if ($statusSbResult.Ok) { if ([string]::IsNullOrWhiteSpace($statusSbResult.Output)) { "NONE" } else { $statusSbResult.Output } } else { "UNAVAILABLE" }
    $statusShort = if ($statusShortResult.Ok) { if ([string]::IsNullOrWhiteSpace($statusShortResult.Output)) { "NONE" } else { $statusShortResult.Output } } else { "UNAVAILABLE" }
    $latestCommit = if ($commitResult.Ok) { if ([string]::IsNullOrWhiteSpace($commitResult.Output)) { "UNAVAILABLE" } else { $commitResult.Output } } else { "UNAVAILABLE" }
    $branch = Get-StatusBranch $statusSb
    $aheadBehind = Get-AheadBehind $statusSb
    $dirtyFiles = Get-DirtyFiles $statusShort

    $gitErrorSummary = if ($gitErrors.Count -eq 0) { "NONE" } else { ($gitErrors -join " | ") }

    Write-Output "# AI-STUDIO Standard Handoff Package"
    Write-Output ""
    Write-Output "SESSION_STATUS: TODO"
    Write-Output "CONTINUE_ALLOWED: TODO"
    Write-Output "STOP_REASON: TODO"
    Write-Output ("CURRENT_REPO_STATE: {0}" -f (Get-FirstMeaningfulLine $statusSb))
    Write-Output "CURRENT_TASK_STATE: TODO"
    Write-Output "NEXT_OWNER: TODO"
    Write-Output "NEXT_SESSION_NAME: TODO"
    Write-Output "NEXT_SESSION_GOAL: TODO"
    Write-Output "NEXT_SESSION_END_CONDITION: TODO"
    Write-Output "NEXT_SESSION_FIRST_PROMPT: TODO"
    Write-Output ""
    Write-Output "## Repository Snapshot"
    Write-Output ""
    Write-Output ("REPO_PATH: {0}" -f $repoPath)
    Write-Output ("WORKING_DIRECTORY: {0}" -f $workingDirectory)
    Write-Output ("BRANCH: {0}" -f $branch)
    Write-Output ("GIT_STATUS_SB: {0}" -f (Get-FirstMeaningfulLine $statusSb))
    Write-Output "GIT_STATUS_SHORT:"
    if ($statusShort -eq "NONE" -or $statusShort -eq "UNAVAILABLE") {
        Write-Output ("  {0}" -f $statusShort)
    }
    else {
        foreach ($line in ($statusShort -split "`r?`n")) {
            Write-Output ("  {0}" -f $line)
        }
    }
    Write-Output ("LATEST_COMMIT: {0}" -f (Get-FirstMeaningfulLine $latestCommit))
    Write-Output ("AHEAD_BEHIND: {0}" -f $aheadBehind)
    Write-Output ("DIRTY_FILES: {0}" -f $dirtyFiles)
    Write-Output ("GIT_ERROR_SUMMARY: {0}" -f $gitErrorSummary)
    Write-Output ""
    Write-Output "## Compact Bootstrap"
    Write-Output ""
    Write-Output "COMPACT_BOOTSTRAP: TODO: Summarize objective, repo state, next owner, next goal, and first prompt in 500 chars or fewer."
}

function Get-FieldValue {
    param(
        [string[]] $Lines,
        [string] $FieldName
    )

    $fieldPattern = "^\s*{0}\s*:\s*(.*)$" -f [regex]::Escape($FieldName)
    $requiredPattern = "^\s*({0})\s*:" -f (($RequiredFields | ForEach-Object { [regex]::Escape($_) }) -join "|")

    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i] -match $fieldPattern) {
            $inlineValue = $Matches[1].Trim()
            if (-not [string]::IsNullOrWhiteSpace($inlineValue)) {
                return $inlineValue
            }

            for ($j = $i + 1; $j -lt $Lines.Count; $j++) {
                if ($Lines[$j] -match $requiredPattern) {
                    break
                }
                if (-not [string]::IsNullOrWhiteSpace($Lines[$j])) {
                    return $Lines[$j].Trim()
                }
            }

            return ""
        }
    }

    return $null
}

function Get-CompactBootstrap {
    param([string[]] $Lines)

    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i] -match "^\s*COMPACT_BOOTSTRAP\s*:\s*(.*)$") {
            $value = $Matches[1].Trim()
            $collected = New-Object System.Collections.ArrayList
            if (-not [string]::IsNullOrWhiteSpace($value)) {
                [void] $collected.Add($value)
            }

            for ($j = $i + 1; $j -lt $Lines.Count; $j++) {
                if ($Lines[$j] -match "^\s*#" -or $Lines[$j] -match "^\s*[A-Z0-9_]+\s*:") {
                    break
                }
                [void] $collected.Add($Lines[$j])
            }

            return (($collected -join "`n").Trim())
        }
    }

    for ($i = 0; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i] -match "Compact Bootstrap") {
            $collected = New-Object System.Collections.ArrayList
            for ($j = $i + 1; $j -lt $Lines.Count; $j++) {
                if ($Lines[$j] -match "^\s*#" -and $collected.Count -gt 0) {
                    break
                }
                if ($Lines[$j] -notmatch '^\s*```') {
                    [void] $collected.Add($Lines[$j])
                }
            }

            return (($collected -join "`n").Trim())
        }
    }

    return $null
}

function Check-Handoff {
    param([string] $InputPath)

    if ([string]::IsNullOrWhiteSpace($InputPath)) {
        Write-Output "HANDOFF_CHECK: FAIL"
        Write-Output "Missing required parameter: -Path"
        exit 2
    }

    if (-not (Test-Path -LiteralPath $InputPath -PathType Leaf)) {
        Write-Output "HANDOFF_CHECK: FAIL"
        Write-Output ("File not found: {0}" -f $InputPath)
        exit 2
    }

    $content = Get-Content -LiteralPath $InputPath -Raw -Encoding UTF8
    $lines = $content -split "`r?`n"
    $missing = New-Object System.Collections.ArrayList

    foreach ($field in $RequiredFields) {
        $value = Get-FieldValue -Lines $lines -FieldName $field
        if ($null -eq $value -or [string]::IsNullOrWhiteSpace($value)) {
            [void] $missing.Add($field)
        }
    }

    $compact = Get-CompactBootstrap -Lines $lines
    $failures = New-Object System.Collections.ArrayList

    if ($missing.Count -gt 0) {
        [void] $failures.Add("Missing or empty required fields:")
        foreach ($field in $missing) {
            [void] $failures.Add(("- {0}" -f $field))
        }
    }

    if ($null -eq $compact -or [string]::IsNullOrWhiteSpace($compact)) {
        [void] $failures.Add("Compact Bootstrap is missing or empty.")
    }
    elseif ($compact.Length -gt 500) {
        [void] $failures.Add(("Compact Bootstrap is too long: {0} characters (max 500)." -f $compact.Length))
    }

    if ($failures.Count -gt 0) {
        Write-Output "HANDOFF_CHECK: FAIL"
        foreach ($failure in $failures) {
            Write-Output $failure
        }
        exit 1
    }

    Write-Output "HANDOFF_CHECK: PASS"
    Write-Output ("Required fields present: {0}" -f $RequiredFields.Count)
    Write-Output ("Compact Bootstrap length: {0}" -f $compact.Length)
    exit 0
}

switch ($Command) {
    "new" {
        New-Handoff
        exit 0
    }
    "check" {
        Check-Handoff -InputPath $Path
    }
}
