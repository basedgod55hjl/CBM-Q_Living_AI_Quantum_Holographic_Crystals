# ==============================================================================
# CBM-Q Master Launcher Script
# Discovered & Engineered by: Sir Charles Spikes (Arthur - BASEDGOD)
# ==============================================================================

println("╔═══════════════════════════════════════════════════════════════════════╗")
println("║  🌌 CBM-Q: Living AI Quantum Holographic Crystals v5.0-GODMODE        ║")
println("║  🧬 Architect: Sir Charles Spikes (BASEDGOD)                          ║")
println("╚═══════════════════════════════════════════════════════════════════════╝")
println()

# Add the Quantum_Holographic_Core_Files to the load path
push!(LOAD_PATH, joinpath(@__DIR__, "..", "Quantum_Holographic_Core_Files", "src"))

# Load the CBM module
using CBM

# Launch the system
CBM.launch_system()
