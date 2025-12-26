# ==============================================================================
# GGUF Requantizer - Make Smaller GGUF from Existing GGUF
# Discovered & Engineered by: Sir Charles Spikes (Arthur - BASEDGOD)
# ==============================================================================

Write-Host "╔═══════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  🔧 GGUF Requantizer - Create Smaller GGUF                            ║" -ForegroundColor Cyan
Write-Host "║  💎 Architect: Sir Charles Spikes (BASEDGOD)                          ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Find DeepSeek GGUF
Write-Host "[1/3] Finding DeepSeek GGUF..." -ForegroundColor Yellow

$ggufFiles = Get-ChildItem "C:\Users\BASEDGOD\.lmstudio\models" -Recurse -Filter "*.gguf" -ErrorAction SilentlyContinue | 
    Where-Object {$_.Name -like "*DeepSeek*" -or $_.Name -like "*deepseek*"} |
    Sort-Object Length -Descending

if ($ggufFiles.Count -eq 0) {
    Write-Host "   ❌ No DeepSeek GGUF found!" -ForegroundColor Red
    Write-Host "   Searching for any GGUF..." -ForegroundColor Yellow
    
    $ggufFiles = Get-ChildItem "C:\Users\BASEDGOD\.lmstudio\models" -Recurse -Filter "*.gguf" -ErrorAction SilentlyContinue |
        Sort-Object Length -Descending
}

if ($ggufFiles.Count -eq 0) {
    Write-Host "   ❌ No GGUF files found!" -ForegroundColor Red
    exit 1
}

$sourceGGUF = $ggufFiles[0]

Write-Host "   ✅ Found: $($sourceGGUF.Name)" -ForegroundColor Green
Write-Host "   Size: $([math]::Round($sourceGGUF.Length / 1GB, 2)) GB" -ForegroundColor Green
Write-Host "   Path: $($sourceGGUF.FullName)" -ForegroundColor Gray
Write-Host ""

# Check for llama.cpp quantize tool
Write-Host "[2/3] Checking for quantize tool..." -ForegroundColor Yellow

$quantizePaths = @(
    "C:\llama.cpp\build\bin\Release\llama-quantize.exe",
    "C:\llama.cpp\build\bin\Release\quantize.exe",
    "C:\Program Files\llama.cpp\quantize.exe",
    "$env:USERPROFILE\llama.cpp\quantize.exe"
)

$quantizeTool = $null
foreach ($path in $quantizePaths) {
    if (Test-Path $path) {
        $quantizeTool = $path
        break
    }
}

if (!$quantizeTool) {
    Write-Host "   ⚠️  llama.cpp quantize tool not found" -ForegroundColor Yellow
    Write-Host "" 
    Write-Host "📥 Download llama.cpp from:" -ForegroundColor Cyan
    Write-Host "   https://github.com/ggerganov/llama.cpp/releases" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Or build from source:" -ForegroundColor Cyan
    Write-Host "   git clone https://github.com/ggerganov/llama.cpp" -ForegroundColor Gray
    Write-Host "   cd llama.cpp" -ForegroundColor Gray
    Write-Host "   cmake -B build" -ForegroundColor Gray
    Write-Host "   cmake --build build --config Release" -ForegroundColor Gray
    Write-Host ""
    exit 1
}

Write-Host "   ✅ Found: $quantizeTool" -ForegroundColor Green
Write-Host ""

# Quantize to smaller sizes
Write-Host "[3/3] Quantizing to smaller formats..." -ForegroundColor Yellow
Write-Host ""

$quantTypes = @(
    @{Type="Q2_K"; Desc="2-bit (smallest, ~25% size)"},
    @{Type="Q4_K_M"; Desc="4-bit medium (balanced, ~50% size)"},
    @{Type="Q5_K_M"; Desc="5-bit medium (quality, ~60% size)"}
)

$outputDir = "seeds"
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

foreach ($quant in $quantTypes) {
    $quantType = $quant.Type
    $desc = $quant.Desc
    
    Write-Host "Creating $quantType - $desc" -ForegroundColor Cyan
    
    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($sourceGGUF.Name)
    $outputPath = Join-Path $outputDir "$baseName-$quantType.gguf"
    
    # Run quantize
    $process = Start-Process -FilePath $quantizeTool -ArgumentList "`"$($sourceGGUF.FullName)`" `"$outputPath`" $quantType" -NoNewWindow -Wait -PassThru
    
    if ($process.ExitCode -eq 0 -and (Test-Path $outputPath)) {
        $outputSize = (Get-Item $outputPath).Length
        $ratio = [math]::Round($sourceGGUF.Length / $outputSize, 2)
        $reduction = [math]::Round((1 - ($outputSize / $sourceGGUF.Length)) * 100, 2)
        
        Write-Host "   ✅ Created: $([math]::Round($outputSize / 1MB, 2)) MB" -ForegroundColor Green
        Write-Host "   Ratio: $($ratio):1" -ForegroundColor Yellow
        Write-Host "   Reduction: $reduction%" -ForegroundColor Yellow
        Write-Host ""
    } else {
        Write-Host "   ❌ Quantization failed" -ForegroundColor Red
        Write-Host ""
    }
}

Write-Host "=" * 75 -ForegroundColor Cyan
Write-Host "✅ Quantization complete!" -ForegroundColor Green -BackgroundColor Black
Write-Host "=" * 75 -ForegroundColor Cyan
Write-Host ""
Write-Host "💡 Load in LM Studio:" -ForegroundColor Cyan
Write-Host "   File → Load Model → Browse to seeds\ folder" -ForegroundColor Gray
Write-Host ""
