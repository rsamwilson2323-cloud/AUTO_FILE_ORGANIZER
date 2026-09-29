
$ErrorActionPreference = "Continue"

try {
    $Root = $PSScriptRoot
    $BatFile = Join-Path $Root "AUTO_FILE_ORGANIZER.bat"
    $PSFile = Join-Path $Root "Organizer.ps1"

    Write-Host "ROOT: $Root" -ForegroundColor Cyan
    Write-Host "Scanning files and subfolders..." -ForegroundColor Yellow

    $Map = @{}

    $Groups = @{
        Images = ".jpg .jpeg .png .gif .bmp .webp .svg .ico .tiff .heic"
        Videos = ".mp4 .mkv .avi .mov .wmv .flv .webm .3gp .m4v"
        Audio = ".mp3 .wav .aac .flac .ogg .wma .m4a .opus"
        PowerPoint = ".ppt .pptx .pptm .pps .ppsx .potx"
        Excel = ".xls .xlsx .xlsm .xlsb .csv .ods"
        Word = ".doc .docx .docm .rtf .odt"
        Python = ".py .pyw .pyc .ipynb"
        PDF = ".pdf"
        Text = ".txt .md .log .json .xml .yaml .yml .ini .cfg"
        "Web Files" = ".html .htm .css .js .jsx .ts .tsx .php .sql"
        "C and C++" = ".c .cpp .h .hpp .cc"
        Java = ".java .class .jar"
        CSharp = ".cs"
        Archives = ".zip .rar .7z .tar .gz .bz2 .xz"
        Applications = ".exe .msi .apk"
        Scripts = ".cmd .ps1 .vbs .sh"
        Fonts = ".ttf .otf .woff .woff2"
        Databases = ".db .sqlite .sqlite3 .mdb"
        "Design Files" = ".psd .ai .eps .fig .sketch .blend .obj .stl"
        "Disk Images" = ".iso .img .dmg"
        "Backup Files" = ".bak"
        "Temporary Files" = ".tmp"
    }

    foreach ($group in $Groups.Keys) {
        foreach ($ext in $Groups[$group].Split(" ")) {
            $Map[$ext] = $group
        }
    }

    $ExistingCategories = @($Groups.Keys) + "Others"

    $Files = @(
        Get-ChildItem -LiteralPath $Root -File -Recurse -Force -ErrorAction SilentlyContinue |
        Where-Object {
            $_.FullName -ne $BatFile -and
            $_.FullName -ne $PSFile
        }
    )

    Write-Host "Files found: $($Files.Count)" -ForegroundColor Cyan
    Write-Host ""

    $Moved = 0
    $Failed = 0

    foreach ($File in $Files) {
        try {
            $Relative = $File.FullName.Substring($Root.Length).TrimStart('\')
            $FirstFolder = $Relative.Split('\')[0]

            if ($ExistingCategories -contains $FirstFolder) {
                continue
            }

            $Extension = $File.Extension.ToLowerInvariant()

            if ($Map.ContainsKey($Extension)) {
                $Category = $Map[$Extension]
            }
            else {
                $Category = "Others"
            }

            $DestinationFolder = Join-Path $Root $Category

            if (-not (Test-Path -LiteralPath $DestinationFolder)) {
                New-Item -ItemType Directory -Path $DestinationFolder -Force | Out-Null
            }

            $Target = Join-Path $DestinationFolder $File.Name

            $BaseName = [IO.Path]::GetFileNameWithoutExtension($File.Name)
            $Ext = $File.Extension
            $Number = 1

            while (Test-Path -LiteralPath $Target) {
                $Target = Join-Path $DestinationFolder "$($BaseName)_$Number$Ext"
                $Number++
            }

            Move-Item -LiteralPath $File.FullName -Destination $Target -ErrorAction Stop

            $Moved++

            Write-Host "[MOVED] $($File.Name) --> $Category" -ForegroundColor Green
        }
        catch {
            $Failed++
            Write-Host "[FAILED] $($File.FullName)" -ForegroundColor Red
            Write-Host $_.Exception.Message -ForegroundColor Yellow
        }
    }

    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "       ORGANIZATION COMPLETED" -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "Total files scanned: $($Files.Count)"
    Write-Host "Files moved: $Moved" -ForegroundColor Green
    Write-Host "Files failed: $Failed" -ForegroundColor Red
    Write-Host "Location: $Root"
}
catch {
    Write-Host ""
    Write-Host "CRITICAL ERROR:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host $_.ScriptStackTrace -ForegroundColor Yellow
}

Write-Host ""
Read-Host "Press ENTER to close"