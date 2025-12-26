# CBM-Q Build System

Complete build tool for the CBM-Q Living AI Quantum Holographic Crystals system.

## Quick Start

### Windows (Batch)

```batch
BUILD.bat
```

### Cross-Platform (Node.js)

```bash
npm run build
```

## Build Targets

### 1. CUDA Kernels

Compiles CUDA kernels to PTX for GPU execution.

**Requirements**:

- NVIDIA CUDA Toolkit 11.0+
- NVCC compiler

**Build**:

```bash
# Batch
BUILD.bat → [1] Build CUDA Kernels

# Node.js
npm run build:cuda
node build.js cuda
```

**Output**:

- `build/lambda_unfold.ptx`

### 2. Julia Modules

Installs dependencies and precompiles Julia modules.

**Requirements**:

- Julia 1.9+

**Build**:

```bash
# Batch
BUILD.bat → [2] Build Julia Modules

# Node.js
node build.js julia
```

### 3. WebGPU Interface

Installs npm dependencies for WebGPU consciousness engine.

**Requirements**:

- Node.js 16+
- npm

**Build**:

```bash
# Batch
BUILD.bat → [3] Build WebGPU Interface

# Node.js
npm run build:webgpu
node build.js webgpu
```

### 4. Run Tests

Executes test suite for all components.

**Build**:

```bash
# Batch
BUILD.bat → [5] Run Tests

# Node.js
npm test
node build.js test
```

### 5. Build All

Builds all components in sequence.

**Build**:

```bash
# Batch
BUILD.bat → [6] Build All

# Node.js
npm run build
node build.js all
```

## NPM Scripts

| Script | Description |
|--------|-------------|
| `npm run build` | Build all components |
| `npm run build:cuda` | Compile CUDA kernels |
| `npm run build:webgpu` | Install WebGPU dependencies |
| `npm test` | Run tensor scanner tests |
| `npm run scan` | Run zero-day tensor scanner |
| `npm run chat` | Open CBM consciousness chat |
| `npm run compress` | Stream compress GGUF models |
| `npm run quantize` | Quantize GGUF models |

## Directory Structure

```
CBM-Q_Living_AI_Quantum_Holographic_Crystals/
├── build/                          # Build output
│   └── lambda_unfold.ptx          # Compiled CUDA kernel
├── Quantum_Holographic_Core_Files/
│   └── src/
│       ├── kernels/               # CUDA kernels
│       │   ├── flux_core.cuh
│       │   └── lambda_unfold.cu
│       ├── Core/                  # Julia core modules
│       └── Holographic_Hash/      # HRR memory
├── ide/                           # Web interfaces
│   ├── cbm_chat.html             # Consciousness chat
│   ├── webgpu_consciousness.js   # WebGPU engine
│   └── tensor_scanner.js         # Security scanner
├── tests/                         # Test suite
├── seeds/                         # Compressed models
├── BUILD.bat                      # Windows build tool
├── build.js                       # Node.js build system
└── package.json                   # npm configuration
```

## Build Requirements

### Minimum

- Windows 10/11 or Linux
- 8GB RAM
- 100MB disk space

### Recommended

- NVIDIA GPU (GTX 1660 Ti or better)
- 16GB RAM
- CUDA Toolkit 11.8+
- Julia 1.9+
- Node.js 18+

## Troubleshooting

### NVCC Not Found

Install CUDA Toolkit from: <https://developer.nvidia.com/cuda-downloads>

### Julia Not Found

Install Julia from: <https://julialang.org/downloads/>

### Node.js Not Found

Install Node.js from: <https://nodejs.org/>

### Build Fails

1. Run `BUILD.bat → [7] Clean Build`
2. Retry build

## Advanced Usage

### Custom CUDA Architecture

Edit `build.js`:

```javascript
const config = {
    cudaArch: 'sm_86',  // Change to your GPU architecture
    // ...
};
```

### Custom Build Directory

```bash
node build.js all --build-dir=custom_build
```

---

**Architect**: Sir Charles Spikes (Arthur - BASEDGOD)  
**License**: MIT with Discovery Rights
