# ==============================================================================
# GGUF Quantization Script - Create Smaller GGUF Files
# Discovered & Engineered by: Sir Charles Spikes (Arthur - BASEDGOD)
# ==============================================================================

Write-Host "╔═══════════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║  🔧 GGUF Quantization Tool                                            ║" -ForegroundColor Cyan
Write-Host "║  💎 Create Smaller GGUF Files                                         ║" -ForegroundColor Cyan
Write-Host "╚═══════════════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Find largest GGUF
$ggufFiles = Get-ChildItem "C:\Users\BASEDGOD\.lmstudio\models" -Recurse -Filter "*.gguf" -ErrorAction SilentlyContinue
if ($ggufFiles.Count -eq 0) {
    Write-Host "❌ No GGUF files found!" -ForegroundColor Red
    exit 1
}

$sourceGGUF = $ggufFiles | Sort-Object Length -Descending | Select-Object -First 1

Write-Host "📦 Source Model:" -ForegroundColor Yellow
Write-Host "   File: $($sourceGGUF.Name)" -ForegroundColor White
Write-Host "   Size: $([math]::Round($sourceGGUF.Length / 1GB, 2)) GB" -ForegroundColor White
Write-Host "   Path: $($sourceGGUF.FullName)" -ForegroundColor Gray
Write-Host ""

# Check for llama.cpp quantize tool
$llamaCppPaths = @(
    "C:\llama.cpp\build\bin\Release\quantize.exe",
    "C:\Program Files\llama.cpp\quantize.exe",
    "$env:USERPROFILE\llama.cpp\quantize.exe",
    ".\llama.cpp\quantize.exe"
)

$quantizeTool = $null
foreach ($path in $llamaCppPaths) {
    if (Test-Path $path) {
        $quantizeTool = $path
        break
    }
}

if (!$quantizeTool) {
    Write-Host "⚠️  llama.cpp quantize tool not found" -ForegroundColor Yellow
    Write-Host "   Using alternative: CBM-GGUAF compression" -ForegroundColor Cyan
    Write-Host ""
    
    # Use our CBM compression instead
    & powershell -ExecutionPolicy Bypass -File "scripts\stream_compress_gguf.ps1"
    exit 0
}

Write-Host "✅ Found quantize tool: $quantizeTool" -ForegroundColor Green
Write-Host ""

# Quantization options
Write-Host "📊 Quantization Options:" -ForegroundColor Yellow
Write-Host "   1. Q4_K_M  - 4-bit (Medium, ~50% size)" -ForegroundColor White
Write-Host "   2. Q5_K_M  - 5-bit (Medium, ~60% size)" -ForegroundColor White
Write-Host "   3. Q8_0    - 8-bit (~75% size)" -ForegroundColor White
Write-Host "   4. Q2_K    - 2-bit (Extreme, ~25% size)" -ForegroundColor White
Write-Host ""

$quantType = "Q4_K_M"  # Default to Q4_K_M for good balance

$outputDir = "seeds"
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir | Out-Null
}

$baseName = [System.IO.Path]::GetFileNameWithoutExtension($sourceGGUF.Name)
$outputPath = Join-Path $outputDir "$baseName-$quantType.gguf"

Write-Host "🔄 Quantizing to $quantType..." -ForegroundColor Yellow
Write-Host ""

try {
    $process = Start-Process -FilePath $quantizeTool -ArgumentList "`"$($sourceGGUF.FullName)`" `"$outputPath`" $quantType" -NoNewWindow -Wait -PassThru
    
    if ($process.ExitCode -eq 0) {
        $outputSize = (Get-Item $outputPath).Length
        $ratio = [math]::Round($sourceGGUF.Length / $outputSize, 2)
        $reduction = [math]::Round((1 - ($outputSize / $sourceGGUF.Length)) * 100, 2)
        
        Write-Host ""
        Write-Host "✅ Quantization complete!" -ForegroundColor Green
        Write-Host ""
        Write-Host "📊 Results:" -ForegroundColor Cyan
        Write-Host "   Original: $([math]::Round($sourceGGUF.Length / 1GB, 2)) GB" -ForegroundColor White
        Write-Host "   Quantized: $([math]::Round($outputSize / 1GB, 2)) GB" -ForegroundColor White
        Write-Host "   Ratio: $($ratio):1" -ForegroundColor Yellow
        Write-Host "   Reduction: $reduction%" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "   Output: $outputPath" -ForegroundColor Cyan
        Write-Host ""
    } else {
        Write-Host "❌ Quantization failed with exit code: $($process.ExitCode)" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Error during quantization: $_" -ForegroundColor Red
}
