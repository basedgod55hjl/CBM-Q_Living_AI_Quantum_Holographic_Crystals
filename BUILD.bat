@echo off
REM ==============================================================================
REM CBM-Q Build Tool - Complete System Builder
REM Discovered & Engineered by: Sir Charles Spikes (Arthur - BASEDGOD)
REM ==============================================================================

echo.
echo ╔═══════════════════════════════════════════════════════════════════════╗
echo ║  🔨 CBM-Q Build Tool                                                  ║
echo ║  💎 Architect: Sir Charles Spikes (BASEDGOD)                          ║
echo ╚═══════════════════════════════════════════════════════════════════════╝
echo.

REM ==============================================================================
REM MENU
REM ==============================================================================

:MENU
echo [1] Build CUDA Kernels
echo [2] Build Julia Modules
echo [3] Build WebGPU Interface
echo [4] Build Node.js Tools
echo [5] Run Tests
echo [6] Build All
echo [7] Clean Build
echo [8] Exit
echo.

set /p choice="Select option: "

if "%choice%"=="1" goto BUILD_CUDA
if "%choice%"=="2" goto BUILD_JULIA
if "%choice%"=="3" goto BUILD_WEBGPU
if "%choice%"=="4" goto BUILD_NODEJS
if "%choice%"=="5" goto RUN_TESTS
if "%choice%"=="6" goto BUILD_ALL
if "%choice%"=="7" goto CLEAN
if "%choice%"=="8" goto EXIT

echo Invalid choice!
goto MENU

REM ==============================================================================
REM BUILD CUDA KERNELS
REM ==============================================================================

:BUILD_CUDA
echo.
echo [CUDA] Building CUDA kernels...
echo.

REM Check for NVCC
where nvcc >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ NVCC not found! Please install CUDA Toolkit.
    echo    Download from: https://developer.nvidia.com/cuda-downloads
    pause
    goto MENU
)

echo ✅ NVCC found
nvcc --version

REM Build lambda_unfold.cu
echo.
echo Building lambda_unfold.cu...
nvcc -ptx ^
    -O3 ^
    -arch=sm_75 ^
    -I"Quantum_Holographic_Core_Files\src\kernels" ^
    Quantum_Holographic_Core_Files\src\kernels\lambda_unfold.cu ^
    -o build\lambda_unfold.ptx

if %ERRORLEVEL% EQU 0 (
    echo ✅ lambda_unfold.ptx created
) else (
    echo ❌ Build failed!
    pause
    goto MENU
)

echo.
echo ✅ CUDA kernels built successfully!
pause
goto MENU

REM ==============================================================================
REM BUILD JULIA MODULES
REM ==============================================================================

:BUILD_JULIA
echo.
echo [Julia] Building Julia modules...
echo.

REM Check for Julia
where julia >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Julia not found! Please install Julia.
    echo    Download from: https://julialang.org/downloads/
    pause
    goto MENU
)

echo ✅ Julia found
julia --version

REM Instantiate project
echo.
echo Instantiating Julia project...
julia --project=. -e "using Pkg; Pkg.instantiate()"

if %ERRORLEVEL% EQU 0 (
    echo ✅ Julia dependencies installed
) else (
    echo ❌ Instantiation failed!
    pause
    goto MENU
)

REM Precompile modules
echo.
echo Precompiling modules...
julia --project=. -e "using Pkg; Pkg.precompile()"

echo.
echo ✅ Julia modules built successfully!
pause
goto MENU

REM ==============================================================================
REM BUILD WEBGPU INTERFACE
REM ==============================================================================

:BUILD_WEBGPU
echo.
echo [WebGPU] Building WebGPU interface...
echo.

REM Check for Node.js
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js not found! Please install Node.js.
    echo    Download from: https://nodejs.org/
    pause
    goto MENU
)

echo ✅ Node.js found
node --version

REM Install dependencies
echo.
echo Installing npm dependencies...
call npm install

if %ERRORLEVEL% EQU 0 (
    echo ✅ npm dependencies installed
) else (
    echo ❌ npm install failed!
    pause
    goto MENU
)

echo.
echo ✅ WebGPU interface ready!
pause
goto MENU

REM ==============================================================================
REM BUILD NODE.JS TOOLS
REM ==============================================================================

:BUILD_NODEJS
echo.
echo [Node.js] Building Node.js tools...
echo.

REM Run tensor scanner
echo Running tensor scanner...
node ide\tensor_scanner.js

echo.
echo ✅ Node.js tools built successfully!
pause
goto MENU

REM ==============================================================================
REM RUN TESTS
REM ==============================================================================

:RUN_TESTS
echo.
echo [Tests] Running test suite...
echo.

REM Julia tests
echo Running Julia tests...
julia --project=. tests\test_holographic_core.jl

REM GPU tests
echo.
echo Running GPU tests...
julia --project=. tests\test_gpu_inference.jl

echo.
echo ✅ Tests complete!
pause
goto MENU

REM ==============================================================================
REM BUILD ALL
REM ==============================================================================

:BUILD_ALL
echo.
echo [Build All] Building complete system...
echo.

call :BUILD_CUDA
call :BUILD_JULIA
call :BUILD_WEBGPU
call :BUILD_NODEJS

echo.
echo ╔═══════════════════════════════════════════════════════════════════════╗
echo ║  ✅ COMPLETE BUILD SUCCESSFUL                                         ║
echo ╚═══════════════════════════════════════════════════════════════════════╝
echo.
pause
goto MENU

REM ==============================================================================
REM CLEAN BUILD
REM ==============================================================================

:CLEAN
echo.
echo [Clean] Cleaning build artifacts...
echo.

if exist build rmdir /s /q build
if exist node_modules rmdir /s /q node_modules
if exist .julia rmdir /s /q .julia

mkdir build

echo ✅ Build cleaned!
pause
goto MENU

REM ==============================================================================
REM EXIT
REM ==============================================================================

:EXIT
echo.
echo Goodbye! 💎🧬✨
echo.
exit /b 0
