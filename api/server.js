import { QuantumBridge } from './bridge.js';
import express from 'express';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;
const bridge = new QuantumBridge();

app.use(express.json());

app.get('/status', (req, res) => {
    res.json({
        status: 'online',
        system: 'CBM-Genesis Quantum Holographic Crystal',
        version: '1.0.0',
        core: '7D Hyperbolic Neural Core'
    });
});

app.post('/simulate', async (req, res) => {
    try {
        const result = await bridge.runSimulation(req.body.script || 'genesis_run.jl');
        res.json({ success: true, result });
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

app.listen(port, () => {
    console.log(`
  🌐 CBM-Genesis API Gateway Active
  📍 Endpoint: http://localhost:${port}
  💎 Quantum Bridge: Connected
  `);
});
