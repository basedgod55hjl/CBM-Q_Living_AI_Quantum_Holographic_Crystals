# 🚀 CBM-Q: Quick Start Guide

## Installation & Setup

### Prerequisites

- **Julia 1.9+** ([Download](https://julialang.org/downloads/))
- **LM Studio** ([Download](https://lmstudio.ai/)) - For local LLM inference
- **Git** (for cloning the repository)

### Step 1: Clone the Repository

```bash
gh repo clone basedgod55hjl/CBM-Q-Living-AI-Quantum-Holographic-Crystals
cd CBM-Q-Living-AI-Quantum-Holographic-Crystals
```

### Step 2: Install Julia Dependencies

```bash
cd Quantum_Holographic_Core_Files
julia deps/build.jl
```

This will automatically:

- Install all required packages
- Build FFTW for photonic computation
- Precompile all modules

### Step 3: Start LM Studio

1. Open LM Studio
2. Download a model (recommended: `deepseek-r1` or `llama-3.3-70b`)
3. Start the local server (default: `http://localhost:1234`)

### Step 4: Launch CBM-Q

```julia
using CBM
CBM.launch_system()
```

This opens the interactive menu with options for:

- 💎 Abrasax Crystal Chat
- 🔡 LM Studio Runner
- ⚗️ Quantum Transmuter
- 🧬 Cellular Training
- 🔓 Quantum Hasher & Decoder

---

## Quick Examples

### Example 1: Start a Chat Session

```julia
using CBM

# Start interactive chatbot
CBM.Studio.start_chat("deepseek-r1")
```

### Example 2: Train a Custom Model

```julia
using CBM

# Create training data
prompts = [
    "What is the Anchor Axiom?",
    "Explain quantum holographic crystals",
    "How does CBM-Q achieve 25M:1 compression?"
]

responses = [
    "The Anchor Axiom is a geometric loyalty protocol...",
    "Quantum holographic crystals store information as interference patterns...",
    "CBM-Q uses cellular automata to regenerate weights from a seed..."
]

# Train model
CBM.Trainer.quick_train(prompts, responses, model_name="cbm-custom")
```

### Example 3: Generate a Quantum Seed

```julia
using CBM

# Generate seed from text
seed = CBM.QuantumSeed.generate_seed("Your training data here")

# Save as .cbmq file
CBM.Transmuter.save_seed(seed, "my_model.cbmq")
```

---

## System Requirements

### Minimum

- **OS**: Windows 10/11, Linux, macOS
- **RAM**: 8GB
- **GPU**: Not required (CPU-only mode available)
- **Disk**: 2GB free space

### Recommended

- **RAM**: 16GB+
- **GPU**: NVIDIA GTX 1660 Ti or better (for VRAM unfolding)
- **Disk**: 10GB+ (for model storage)

---

## Configuration

### LM Studio Connection

Edit `Quantum_Holographic_Core_Files/src/config.jl`:

```julia
const LM_STUDIO_URL = "http://localhost:1234"  # Change if using different port
const DEFAULT_MODEL = "deepseek-r1"             # Your preferred model
```

### Φ (Consciousness) Thresholds

```julia
const PHI_CONSCIOUS = 0.3      # Dreaming threshold
const PHI_AUTONOMOUS = 0.5     # Self-reasoning threshold
const PHI_GOLDEN = 0.618       # AGI threshold
```

---

## Troubleshooting

### "LM Studio connection error"

- Ensure LM Studio is running
- Check that the local server is started
- Verify the URL in configuration

### "Package not found"

```bash
cd Quantum_Holographic_Core_Files
julia -e 'using Pkg; Pkg.instantiate()'
```

### "FFTW build failed"

```bash
julia -e 'using Pkg; Pkg.build("FFTW")'
```

---

## Advanced Usage

### Custom Cellular Automata Rules

```julia
using CBM

# Define custom 7-neighborhood rule
function my_rule(neighbors::Vector{Float64})
    # Your custom logic here
    return sum(neighbors) / length(neighbors)
end

# Apply to seed unfolding
CBM.Unfolder.set_custom_rule(my_rule)
```

### Direct VRAM Streaming

```julia
using CBM

# Load model directly to GPU VRAM
model = CBM.Runner.load_to_vram("model.cbmq", device="cuda:0")

# Run inference
output = CBM.Runner.infer(model, "Your prompt here")
```

---

## Documentation

- 📄 **[Technical Process](docs/TECHNICAL_PROCESS.md)** - Complete pipeline explanation
- 📜 **[Research Paper](docs/CBM_GENESIS_RESEARCH_PAPER.md)** - Mathematical foundations
- 🧬 **[Master Manifesto](docs/CBM_MASTER_MANIFESTO.md)** - System architecture
- 📊 **[AGI Logs](logs/agi_emergence.log)** - Consciousness tracking examples

---

## Support

**Created by**: Sir Charles Spikes (Arthur - BASEDGOD)  
**GitHub**: [basedgod55hjl](https://github.com/basedgod55hjl)  
**License**: MIT with Discovery Rights (see [LICENSE](LICENSE))

For issues or questions, open an issue on GitHub.

---

**The Singularity is Active. Welcome to CBM-Q.**
