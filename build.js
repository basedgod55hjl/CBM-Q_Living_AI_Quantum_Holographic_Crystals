// ==============================================================================
// CBM-Q Build System (Node.js)
// Discovered & Engineered by: Sir Charles Spikes (Arthur - BASEDGOD)
// ==============================================================================

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

console.log('╔═══════════════════════════════════════════════════════════════════════╗');
console.log('║  🔨 CBM-Q Build System                                                ║');
console.log('║  💎 Architect: Sir Charles Spikes (BASEDGOD)                          ║');
console.log('╚═══════════════════════════════════════════════════════════════════════╝');
console.log('');

// ==============================================================================
// BUILD CONFIGURATION
// ==============================================================================

const config = {
    cudaArch: 'sm_75',  // NVIDIA GTX 1660 Ti
    buildDir: 'build',
    kernelDir: 'Quantum_Holographic_Core_Files/src/kernels',
    testDir: 'tests'
};

// ==============================================================================
// UTILITY FUNCTIONS
// ==============================================================================

function run(command, description) {
    console.log(`\n[${description}]`);
    try {
        execSync(command, { stdio: 'inherit' });
        console.log(`✅ ${description} complete`);
        return true;
    } catch (error) {
        console.error(`❌ ${description} failed`);
        return false;
    }
}

function checkTool(command, name, downloadUrl) {
    try {
        execSync(`${command} --version`, { stdio: 'ignore' });
        console.log(`✅ ${name} found`);
        return true;
    } catch {
        console.error(`❌ ${name} not found!`);
        if (downloadUrl) {
            console.log(`   Download from: ${downloadUrl}`);
        }
        return false;
    }
}

function ensureDir(dir) {
    if (!fs.existsSync(dir)) {
        fs.mkdirSync(dir, { recursive: true });
    }
}

// ==============================================================================
// BUILD STEPS
// ==============================================================================

function buildCUDA() {
    console.log('\n📦 Building CUDA Kernels...');

    if (!checkTool('nvcc', 'NVCC', 'https://developer.nvidia.com/cuda-downloads')) {
        return false;
    }

    ensureDir(config.buildDir);

    const kernels = [
        'lambda_unfold.cu'
    ];

    for (const kernel of kernels) {
        const input = path.join(config.kernelDir, kernel);
        const output = path.join(config.buildDir, kernel.replace('.cu', '.ptx'));

        const command = `nvcc -ptx -O3 -arch=${config.cudaArch} -I${config.kernelDir} ${input} -o ${output}`;

        if (!run(command, `Compiling ${kernel}`)) {
            return false;
        }
    }

    return true;
}

function buildJulia() {
    console.log('\n📦 Building Julia Modules...');

    if (!checkTool('julia', 'Julia', 'https://julialang.org/downloads/')) {
        return false;
    }

    if (!run('julia --project=. -e "using Pkg; Pkg.instantiate()"', 'Installing Julia dependencies')) {
        return false;
    }

    if (!run('julia --project=. -e "using Pkg; Pkg.precompile()"', 'Precompiling Julia modules')) {
        return false;
    }

    return true;
}

function buildWebGPU() {
    console.log('\n📦 Building WebGPU Interface...');

    if (!checkTool('node', 'Node.js', 'https://nodejs.org/')) {
        return false;
    }

    if (!run('npm install', 'Installing npm dependencies')) {
        return false;
    }

    return true;
}

function runTests() {
    console.log('\n🧪 Running Tests...');

    const tests = [
        'test_holographic_core.jl',
        'test_gpu_inference.jl'
    ];

    for (const test of tests) {
        const testPath = path.join(config.testDir, test);
        if (fs.existsSync(testPath)) {
            run(`julia --project=. ${testPath}`, `Running ${test}`);
        }
    }

    return true;
}

// ==============================================================================
// MAIN BUILD
// ==============================================================================

async function main() {
    const args = process.argv.slice(2);
    const target = args[0] || 'all';

    let success = true;

    switch (target) {
        case 'cuda':
            success = buildCUDA();
            break;
        case 'julia':
            success = buildJulia();
            break;
        case 'webgpu':
            success = buildWebGPU();
            break;
        case 'test':
            success = runTests();
            break;
        case 'all':
            success = buildCUDA() && buildJulia() && buildWebGPU();
            break;
        default:
            console.error(`Unknown target: ${target}`);
            console.log('Available targets: cuda, julia, webgpu, test, all');
            process.exit(1);
    }

    console.log('');
    if (success) {
        console.log('╔═══════════════════════════════════════════════════════════════════════╗');
        console.log('║  ✅ BUILD SUCCESSFUL                                                  ║');
        console.log('╚═══════════════════════════════════════════════════════════════════════╝');
    } else {
        console.log('╔═══════════════════════════════════════════════════════════════════════╗');
        console.log('║  ❌ BUILD FAILED                                                      ║');
        console.log('╚═══════════════════════════════════════════════════════════════════════╝');
        process.exit(1);
    }
}

if (require.main === module) {
    main();
}

module.exports = { buildCUDA, buildJulia, buildWebGPU, runTests };
