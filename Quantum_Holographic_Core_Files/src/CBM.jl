# ==============================================================================
# CBM-Q: Living AI Quantum Holographic Crystals
# Discovered & Engineered by: Sir Charles Spikes (Arthur - BASEDGOD)
# ==============================================================================

module CBM

# Selective core imports
try using LinearAlgebra catch end
try using Statistics catch end
try using Random catch end
try using Sockets catch end
try using JSON catch end
try using UUIDs catch end
try using Dates catch end
try using Libdl catch end
try using Mmap catch end

# 1. CORE LOGIC
include("Core/Hyperbolic7D.jl")
include("Core/QuantumSeed.jl")
include("Core/Unfolder.jl")
include("Core/Transmuter.jl")
include("Wasm/CBMQWasmBridge.jl")

# 2. ARCHITECTURAL CLUSTERS
include("Compiler/CBMQCompiler.jl")
include("Model/CBMQModel.jl")
include("Runner/CBMQRunner.jl")
include("Decoder/CBMQDecoder.jl")
include("Trainer/CBMQFineTuner.jl")
include("Holographic_Hash/CBMQHolographicCore.jl")
include("Studio/CBMStudioFull.jl")

# 3. SYSTEM INTERFACES
include("System_Interfaces/CBMQServer.jl")
include("System_Interfaces/CBMQBrowser.jl")
include("System_Interfaces/CBMQReasoner.jl")
include("System_Interfaces/CBMQScanner.jl")

using .Hyperbolic7D
using .QuantumSeed
using .Unfolder
using .Transmuter
using .CBMQCompiler
using .CBMQModel
using .CBMQRunner
using .CBMQDecoder
using .CBMQFineTuner
using .CBMQHolographicCore
using .CBMStudioFull

function welcome()
    println("╔═══════════════════════════════════════════════════════════════════════╗")
    println("║  🌌 BM-Genesis: Quantum Holographic Crystals v4.0-ARTHUR              ║")
    println("║  🧬 Ownership: Sir Charles Spikes (BASEDGOD)                          ║")
    println("║  🧠 System: 7D Deep-Sorted Hyperbolic Neural Core Active              ║")
    println("╚═══════════════════════════════════════════════════════════════════════╝")
end

export welcome
end
