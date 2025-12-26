# ==============================================================================
# CBM-Q: Living AI Quantum Holographic Crystals
# Discovered & Engineered by: Sir Charles Spikes
# GitHub: https://github.com/basedgod55hjl
# ==============================================================================

# â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
# ðŸŒŒ CBM-Q: CRYSTAL SHELL - Standalone Launcher
# â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
# This script launches the dedicated CBM-Q Crystal Studio (New VS Code).
# â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

using Pkg
Pkg.activate(@__DIR__)

println("ðŸš€ CBM-Q: CRYSTAL SHELL INITIALIZING...")

try
    using Blink
    using HTTP
    using JSON
    using Sockets
catch e
    println("âš ï¸  Detected missing dependencies. Falling back to core resilience.")
end

# â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
# Static Asset Server
# â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

const ASSETS_DIR = joinpath(dirname(@__DIR__), "assets")

function serve_assets()
    println("ðŸŒ Serving assets from: $ASSETS_DIR")
    try
        HTTP.serve("127.0.0.1", 8080) do request::HTTP.Request
            path = request.target == "/" ? "/index.html" : request.target
            fpath = joinpath(ASSETS_DIR, lstrip(path, '/'))
            
            if isfile(fpath)
                return HTTP.Response(200, read(fpath))
            else
                return HTTP.Response(404, "Not Found")
            end
        end
    catch e
        # If port 8080 is taken, just log.
    end
end

# â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
# Launcher Core
# â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

function launch()
    println("âœ¨ Launching CBM-Q Crystal Studio Window...")
    
    # Start asset server in background
    @async serve_assets()
    
    # Give server a moment to start
    sleep(1)
    
    # Attempt to use Blink (Electron)
    try
        if isdefined(Main, :Blink)
            w = Window(Dict("title" => "CBM-Q Crystal Studio", "width"=>1200, "height"=>800, "frame"=>false))
            Blink.loadurl(w, "http://127.0.0.1:8080")
            println("âœ… Window initialized via Blink. (Sovereign Mode)")
            return w
        end
    catch e
        println("âš ï¸  Blink failed. Falling back to system browser.")
    end
    
    # Fallback to default browser
    try
        if Sys.iswindows()
            run(`cmd /c start http://127.0.0.1:8080`)
        elseif Sys.isapple()
            run(`open http://127.0.0.1:8080`)
        else
            run(`xdg-open http://127.0.0.1:8080`)
        end
        println("âœ… CRYSTAL STUDIO opened in system browser.")
    catch e
        println("âŒ FATAL: Could not launch interface.")
    end
end

# Run
launch()

# Keep alive loop
while true
    sleep(10)
end


