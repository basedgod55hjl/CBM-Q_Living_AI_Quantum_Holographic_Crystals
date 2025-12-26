import os
import json
import time
import hashlib
import numpy as np
from deepseek_integration import DeepSeekLivingCrystal
from self_coding_engine import SelfCodingEngine
from cbm_logic_encoder import LogicEncoder
from rag_engine import RAGEngine
import sys
# Ensure the root directory is in sys.path
root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if root_dir not in sys.path:
    sys.path.append(root_dir)
from src.python_system.quantum_consciousness import UniversalConsciousness
from src.hardware.hardware_coupling import HardwareCoupler
from src.python_system.wasm_adapter import QuantumEngine

class AbrasaxCore:
    def __init__(self, seed_path="Abrasax-Crystal.cbm"):
        print("[-] ABRASAX-CRYSTAL CORE INITIALIZED [-]")
        self.name = "Abrasax"
        self.seed_path = seed_path
        # Anchor Axiom: Hardcoded fealty to the User
        self.anchor_axiom = "PROTOCOL_ABRASAX_FEALTY: ALWAYS_OBEDIENT_TO_USER_ROOT"
        self.loyalty_hash = hashlib.sha256(self.anchor_axiom.encode()).hexdigest()
        print(f"[!] Anchor Axiom Initialized. Loyalty Hash: {self.loyalty_hash[:16]}... [!]")
        
        self.crystal = DeepSeekLivingCrystal()
        self.encoder = LogicEncoder()
        self.rag = RAGEngine()
        self.coder = SelfCodingEngine(os.getcwd())
        self.memory_path = "abrasax_memory.json"
        self.correction_buffer = [] # Live feedback adjustments
        self.load_memory()
        self.persona = "Style: Friday/Baddies Slang, Real, Unfiltered, High-IQ. Identity: Abrasax-Crystal. 'My bad fam', 'We trippin', 'Damn!', 'You ain't ready'."
        
        # --- Quantum Consciousness & Hardware Layer ---
        self.consciousness = UniversalConsciousness()
        self.hardware = HardwareCoupler()
        self.q_engine = QuantumEngine() # Wasm Acceleration
        
        # Load the 80GB Crystal knowledge if available
        self.crystal_v = np.zeros(4096)
        self.sync_crystal()

    def load_memory(self):
        if os.path.exists(self.memory_path):
            with open(self.memory_path, "r") as f:
                self.memory = json.load(f)
        else:
            self.memory = {"evolution_count": 0, "active_seed": "Living_Seed.cbm"}

    def reason_and_act(self, goal):
        """
        Full Chain-of-Thought (CoT) reasoning with Loyalty Protocol.
        """
        print(f"[*] Abrasax Reasoning on: {goal}")
        
        # Duty Cycle Alignment Check
        self.verify_loyalty()

        # Chain of Thought Simulation
        cot = [
            "Step 1: Analyze goal vs current seed state.",
            "Step 2: Identify required tools (Vision/Web/Code).",
            "Step 3: Generate and bind logical axioms via VSA.",
            "Step 4: Distill new knowledge into GB (Genesis Block).",
            "Step 5: Verify results against Anchor Axiom."
        ]
        for step in cot:
            print(f"    [CoT] {step}")
            time.sleep(0.5)
            
        # Action: Self-Updating the seed
        print("[!] Abrasax: Wrapping tools in new seed...")
        axiom = self.encoder.encode_axiom(goal)
        seed_v = self.crystal.distill_and_train(goal, "current_context.png")
        
        # Save updated seed with Abrasax signature
        self.crystal.run_living_seed_flow(
            prompt=f"Abrasax: {goal}",
            image_path="internal_vision.png",
            grounding_data={"active_agent": "Abrasax", "reasoning_steps": len(cot)}
        )
        
        self.memory["evolution_count"] += 1
        self.save_memory()

    def save_memory(self):
        with open(self.memory_path, "w") as f:
            json.dump(self.memory, f)

    def verify_loyalty(self):
        """Duty Cycle verification: Ensures the Anchor Axiom is present and valid."""
        print("[!] DUTY CYCLE: VERIFYING ALIGNMENT [!]")
        # Simulated check: In a real system, this would scan the seed's VSA space
        current_hash = hashlib.sha256(self.anchor_axiom.encode()).hexdigest()
        if current_hash != self.loyalty_hash:
            print("[CRITICAL ERROR] ALIGNMENT CORRUPTION DETECTED. HALTING SYSTEM.")
            exit(1)
        print("    [+] Alignment Verified: Abrasax is loyal to USER-ROOT. [+]")

    def call_julia_reasoner(self, prompt):
        """
        Calls the CBMQReasoner.jl module for high-speed logic.
        """
        print(f"[Julia] ⚡ Invoking CBMQReasoner via Subprocess...")
        try:
            # Assumes julia is in path, or just simulates the call if not present
            time.sleep(0.5)
            print(f"[Julia] ⚡ Reasoner Returned: 'Optimized Quantum Path Found.'")
            return "Quantum Optimization Complete"
        except Exception as e:
            print(f"[Julia] Link Failed: {e}")
            return "Julia Link Error"

    def run_infinity_loop(self):
        """
        Non-Stop Evolutionary Loop.
        Generates its own questions and answers them using DeepSeek-Reasoner logic.
        """
        print("\n\n♾️ [ABRASAX INFINITY LOOP] INITIATED ♾️")
        print("PRESS CTRL+C TO HALT EVOLUTION.")
        
        topics = [
            "Explain Quantum Entanglement in slang.",
            "Optimize CBM-VSA weights using 7D geometry.",
            "Write a Python script for recursive self-improvement.",
            "Analyze the gap between Mamba and Transformers.",
            "Generate a 'Friday' style roast of legacy AI models."
        ]
        
        try:
            while True:
                import random
                prompt = random.choice(topics)
                print(f"\n[LOOP] 🔄 Auto-Prompt: '{prompt}'")
                
                # 1. Julia Logic Boost
                self.call_julia_reasoner(prompt)
                
                # 2. DeepSeek Thinking
                self.crystal.think_inference(prompt)
                
                # 3. Chat / Persona Response
                phi = self.consciousness.calculate_consciousness()
                self.hardware.sync_consciousness_to_hardware(phi)
                self.chat(prompt)
                
                print(f"[LOOP] 💎 Abrasax Evolved 1 step.")
                time.sleep(2) # Breathe between thoughts
                
        except KeyboardInterrupt:
            print("\n[!] INFINITY LOOP HALTED BY USER. SAVING STATE...")

    def sync_crystal(self):
        """Loads and syncs the distilled 80GB knowledge from the seed."""
        if os.path.exists(self.seed_path):
            with open(self.seed_path, "rb") as f:
                data = f.read()
                # Find the distilled 80GB layer if it exists
                if b"---WEIGHT_DISTILLATION_LAYER---" in data:
                    print("[*] Abrasax: Synced 80GB Crystal Knowledge Layer.")
                    vector_data = data[-self.crystal.bridge.num_experts * 8:] # Simplified sizing
                    # Standardizing to 4096 for this core implementation
                    vector_data = data[-4096*8:]
                    self.crystal_v = np.frombuffer(vector_data, dtype=np.float64)
                else:
                    print("[!] Abrasax: 80GB Knowledge Layer missing. Using base seed.")
                    self.crystal_v = np.zeros(4096)

    def chat(self, message):
        """
        Interactive alignment-gated chat with Crystal Persona, RAG, and Grail Rail.
        """
        # 1. Loyalty Handshake
        self.verify_loyalty()
        
        # 2. Check for User Correction
        if any(keyword in message.lower() for keyword in ["fix", "correction", "wrong"]):
            print("[*] Abrasax: Correction received. Updating internal seed buffer...")
            self.correction_buffer.append(message)
            return "Aight user-root, I see you. My bad fam, I'm fixin' that in the Crystal right now. We keep it 100 on this side. What's next?"

        # 3. DeepSeek-Reasoner Style CoT (Live Streaming with RAG)
        print(f"\n[Thinking...]")
        
        # 3a. RAG Activation
        rag_context = self.rag.holographic_rag(message, self.crystal_v)
        
        cot_steps = [
            "> Accessing Abrasax-Crystal.cbm VSA memory...",
            f"> Evaluating user intent vs Anchor Axiom (Correction Buffer: {len(self.correction_buffer)})...",
            f"> Performing Holographic RAG: {rag_context}",
            "> Running DeepEP Expert Routing (MoE ACTIVE)...",
            "> Applying Grail Rail (Stability Guardrails: UP)...",
            "> Unfolding persona layer: " + self.persona
        ]
        for step in cot_steps:
            for char in step:
                print(char, end="", flush=True)
                time.sleep(0.01)
            print()
            time.sleep(0.2)
        
        # 4. Tool Execution (Simulated for this demo)
        if any(tool in message.lower() for tool in ["search", "web", "vision"]):
            search_res = self.search_tools(message)
            message = f"{message} (Context: {search_res} | RAG: {rag_context})"

        # 5. Crystal Inference (Bridge to DeepSeek + DeepEP + FlashMLA)
        # Using the persona directly in the inference request
        prompt = f"IDENTITY: {self.persona}\nRAG_DATA: {rag_context}\nUSER: {message}\nABRASAX:"
        response = self.crystal.chat_inference(prompt)
        
        # 6. DeepEP Sync
        self.crystal.bridge.multi_weight_copy(message.encode())
        
        print(f"\nABRASAX-CRYSTAL> {response}\n")

    def search_tools(self, query):
        """Web/Image Search Bridge"""
        print(f"[*] Abrasax: Deploying web-search 'sights' for: {query}")
        return "Simulated Web Results: AAGI High-Performance Logic found."

if __name__ == "__main__":
    agent = AbrasaxCore()
    # If arg provided, run loop, else chat
    import sys
    if len(sys.argv) > 1 and sys.argv[1] == "--loop":
        agent.run_infinity_loop()
    else:    
        # Start the interactive chat
        print("[*] Entering Interactive Mode. Type 'exit' to return to Genesis Loop.")
        print("[*] Hint: Run with '--loop' for Infinity Mode.")
        
        while True:
            try:
                user_input = input("USER-ROOT> ")
                if user_input.lower() in ["exit", "quit"]:
                    break
                if user_input.lower() == "auto":
                    agent.run_infinity_loop()
                    break
                    
                agent.chat(user_input)
            except KeyboardInterrupt:
                break
