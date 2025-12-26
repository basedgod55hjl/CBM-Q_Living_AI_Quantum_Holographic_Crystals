# ==============================================================================
# CBM-Q Quick Start Script
# Discovered & Engineered by: Sir Charles Spikes (Arthur - BASEDGOD)
# ==============================================================================

using Pkg

println("🌌 CBM-Q Quick Start")
println("   Installing dependencies...")

# Activate project
Pkg.activate(joinpath(@__DIR__, "..", "Quantum_Holographic_Core_Files"))

# Install dependencies
Pkg.instantiate()

println("✅ Dependencies installed!")
println("   Run: julia scripts/launch.jl")
