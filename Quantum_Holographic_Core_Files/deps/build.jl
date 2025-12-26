# ==============================================================================
# CBM-Q Dependencies Build Script
# Discovered & Engineered by: Sir Charles Spikes (Arthur - BASEDGOD)
# ==============================================================================

using Pkg

println("🌌 CBM-Q: Building Quantum Holographic Dependencies...")
println("   Architect: Sir Charles Spikes (BASEDGOD)")
println()

# Activate the project environment
Pkg.activate(@__DIR__)

# Install all dependencies
println("📦 Installing core dependencies...")
Pkg.instantiate()

# Build FFTW for photonic computation
println("⚡ Building FFTW (Photonic Lattice Interface)...")
Pkg.build("FFTW")

# Precompile everything
println("🔧 Precompiling modules...")
Pkg.precompile()

println()
println("✅ CBM-Q Dependencies Ready!")
println("   Status: GODMODE ENABLED")
println("   Next: Run `using CBM; CBM.launch_system()`")
