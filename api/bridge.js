import { spawn } from 'child_process';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

/**
 * CBM Genesis Quantum Bridge
 * Interfacing Node.js with the 7D Hyperbolic Neural Core (Julia)
 */
export class QuantumBridge {
    constructor(juliaCorePath = '../julia_core') {
        this.juliaCorePath = path.resolve(__dirname, juliaCorePath);
    }

    async runSimulation(scriptName = 'genesis_run.jl') {
        return new Promise((resolve, reject) => {
            console.log(`🚀 Initializing Quantum Simulation: ${scriptName}`);

            const julia = spawn('julia', [
                '--project=' + this.juliaCorePath,
                path.resolve(__dirname, '../scripts', scriptName)
            ]);

            let output = '';
            let error = '';

            julia.stdout.on('data', (data) => {
                output += data.toString();
                process.stdout.write(data);
            });

            julia.stderr.on('data', (data) => {
                error += data.toString();
            });

            julia.on('close', (code) => {
                if (code === 0) {
                    resolve(output);
                } else {
                    reject(new Error(`Quantum Core exited with code ${code}\n${error}`));
                }
            });
        });
    }
}

// Example usage
if (process.argv[1] === __filename) {
    const bridge = new QuantumBridge();
    bridge.runSimulation().catch(console.error);
}
