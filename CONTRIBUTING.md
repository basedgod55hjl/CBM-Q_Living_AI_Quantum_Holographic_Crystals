# Contributing to CBM Genesis

<div align="center">
  <img src="docs/images/discovery_tech_cbn_logo.png" width="400" alt="Discovery Tech CBN Logo">
  <p><b>Technology Discovered by Sir Charles Spikes - Discovery Tech CBN</b></p>
  <p><i>December 21, 2025</i></p>
</div>

---

## 🙏 Welcome Contributors

Thank you for your interest in contributing to CBM Genesis! This revolutionary quantum-inspired AGI system welcomes contributions from researchers, developers, and enthusiasts worldwide.

---

## 📋 Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [How Can I Contribute?](#how-can-i-contribute)
3. [Development Setup](#development-setup)
4. [Contribution Guidelines](#contribution-guidelines)
5. [Pull Request Process](#pull-request-process)
6. [Coding Standards](#coding-standards)
7. [Testing Requirements](#testing-requirements)
8. [Documentation](#documentation)

---

## 🤝 Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inspiring community for all. We pledge to make participation in our project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion, or sexual identity and orientation.

### Our Standards

**Positive behaviors include:**

- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

**Unacceptable behaviors include:**

- Trolling, insulting/derogatory comments, and personal attacks
- Public or private harassment
- Publishing others' private information without permission
- Other conduct which could reasonably be considered inappropriate

---

## 🎯 How Can I Contribute?

### Reporting Bugs

**Before submitting a bug report:**

1. Check the [existing issues](https://github.com/basedgod55hjl/CBM-Genesis---Quantum-AGI-System-with-7D-Hyperbolic-Neural-Core/issues)
2. Verify the bug exists in the latest version
3. Collect relevant information (browser, OS, error messages)

**Bug Report Template:**

```markdown
**Describe the bug**
A clear and concise description of what the bug is.

**To Reproduce**
Steps to reproduce the behavior:
1. Go to '...'
2. Click on '....'
3. See error

**Expected behavior**
What you expected to happen.

**Screenshots**
If applicable, add screenshots.

**Environment:**
 - OS: [e.g. Windows 11]
 - Browser: [e.g. Chrome 120]
 - CBM Version: [e.g. 1.0]

**Additional context**
Any other context about the problem.
```

### Suggesting Enhancements

**Enhancement Suggestion Template:**

```markdown
**Is your feature request related to a problem?**
A clear description of the problem.

**Describe the solution you'd like**
A clear description of what you want to happen.

**Describe alternatives you've considered**
Alternative solutions or features you've considered.

**Additional context**
Any other context or screenshots about the feature request.
```

### Contributing Code

We welcome code contributions in several areas:

**Core Engine:**

- 7D hyperbolic computation optimizations
- GPU acceleration improvements
- WebAssembly performance enhancements

**Quantum Seed Generation:**

- New entropy sources
- Advanced quantum gate implementations
- Seed compression algorithms

**Evolutionary Training:**

- Novel fitness functions
- Optimization algorithms
- Parallel evolution strategies

**Visualization:**

- New visualization modes
- Performance improvements
- Interactive features

**Documentation:**

- Tutorial creation
- API documentation
- Use case examples

---

## 🛠️ Development Setup

### Prerequisites

```bash
# Required
Node.js >= 16.0.0
Python >= 3.8
Git >= 2.30

# Optional
Docker >= 20.10
```

### Fork and Clone

```bash
# Fork the repository on GitHub
# Then clone your fork
git clone https://github.com/YOUR_USERNAME/CBM-Genesis---Quantum-AGI-System-with-7D-Hyperbolic-Neural-Core.git
cd CBM-Genesis---Quantum-AGI-System-with-7D-Hyperbolic-Neural-Core

# Add upstream remote
git remote add upstream https://github.com/basedgod55hjl/CBM-Genesis---Quantum-AGI-System-with-7D-Hyperbolic-Neural-Core.git
```

### Install Dependencies

```bash
# Python dependencies
pip install -r requirements.txt

# Node.js dependencies (if any)
npm install

# Verify installation
python src/tools/quantum_seed_engine.py --test
```

### Create a Branch

```bash
# Update your fork
git checkout main
git pull upstream main

# Create feature branch
git checkout -b feature/your-feature-name

# Or for bug fixes
git checkout -b fix/bug-description
```

---

## 📝 Contribution Guidelines

### Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/) specification:

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**

- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**

```bash
feat(quantum): add new entropy source for seed generation

Implemented quantum vacuum fluctuation simulation using
Heisenberg uncertainty principle for enhanced randomness.

Closes #123

---

fix(gpu): resolve WebGL context loss on Firefox

Fixed memory leak causing context loss after extended use.
Added proper cleanup in destructor.

Fixes #456
```

### Code Style

**JavaScript:**

```javascript
// Use ES6+ features
const processThought = async (input) => {
    const vector = await unfoldSeed(input);
    return applyLogicMatrix(vector);
};

// Clear variable names
const thoughtVector = new Float32Array(512);
const phiHarmonic = 1.618033988749;

// Comments for complex logic
// Apply 7D hyperbolic transformation using inverse square falloff
const interaction = 1 / (1 + distance ** 2);
```

**Python:**

```python
# Follow PEP 8
import numpy as np
from typing import List, Optional

class QuantumSeedFactory:
    """Factory for generating quantum-inspired seeds.
    
    Args:
        dimension: Seed dimension in bits
        phi_harmonics: Enable PHI-based harmonics
    """
    
    def __init__(self, dimension: int = 512, phi_harmonics: bool = True):
        self.dimension = dimension
        self.phi_harmonics = phi_harmonics
    
    def generate_cbm_seed(self) -> np.ndarray:
        """Generate a primordial quantum seed.
        
        Returns:
            Binary seed array with high entropy
        """
        # Implementation
        pass
```

### File Organization

```
src/
├── engines/          # Core computation engines
│   ├── cbm_engine.js
│   └── browser_god_mode.js
├── interfaces/       # User interfaces
│   └── CBM_GENESIS_OMEGA.html
├── tools/            # Python tools
│   ├── quantum_seed_engine.py
│   └── evolutionary_seed_trainer.py
└── data/             # Data files
    └── genesis_data.js

docs/                 # Documentation
├── ARCHITECTURE.md
├── API_REFERENCE.md
└── TUTORIALS.md

wasm/                 # WebAssembly modules
└── engine.wasm

tests/                # Test files
├── test_quantum_seed.py
└── test_cbm_engine.js
```

---

## 🔄 Pull Request Process

### Before Submitting

1. **Update your branch:**

   ```bash
   git checkout main
   git pull upstream main
   git checkout your-branch
   git rebase main
   ```

2. **Run tests:**

   ```bash
   # Python tests
   pytest tests/
   
   # JavaScript tests (if applicable)
   npm test
   ```

3. **Update documentation:**
   - Update relevant `.md` files
   - Add docstrings to new functions
   - Update API reference if needed

4. **Check code style:**

   ```bash
   # Python
   black src/tools/
   flake8 src/tools/
   
   # JavaScript
   eslint src/engines/
   ```

### Submitting the PR

1. **Push to your fork:**

   ```bash
   git push origin your-branch
   ```

2. **Create Pull Request on GitHub:**
   - Use a clear, descriptive title
   - Fill out the PR template completely
   - Link related issues
   - Add screenshots/videos if relevant

3. **PR Template:**

   ```markdown
   ## Description
   Brief description of changes
   
   ## Type of Change
   - [ ] Bug fix
   - [ ] New feature
   - [ ] Breaking change
   - [ ] Documentation update
   
   ## Testing
   - [ ] All tests pass
   - [ ] Added new tests
   - [ ] Manual testing completed
   
   ## Checklist
   - [ ] Code follows style guidelines
   - [ ] Self-review completed
   - [ ] Comments added for complex code
   - [ ] Documentation updated
   - [ ] No new warnings generated
   
   ## Related Issues
   Closes #123
   ```

### Review Process

1. **Automated Checks:**
   - CI/CD pipeline runs automatically
   - Code style checks
   - Test suite execution

2. **Code Review:**
   - Maintainers review within 48 hours
   - Address feedback promptly
   - Make requested changes

3. **Approval and Merge:**
   - Requires 1 approval from maintainer
   - Squash and merge preferred
   - Delete branch after merge

---

## 🧪 Testing Requirements

### Unit Tests

**Python:**

```python
# tests/test_quantum_seed.py
import pytest
from src.tools.quantum_seed_engine import QuantumSeedFactory

def test_seed_generation():
    """Test basic seed generation."""
    factory = QuantumSeedFactory(dimension=512)
    seed = factory.generate_cbm_seed()
    
    assert len(seed) == 64  # 512 bits = 64 bytes
    assert factory.measure_entropy(seed) > 0.9

def test_phi_harmonics():
    """Test PHI harmonic resonance."""
    factory = QuantumSeedFactory(phi_harmonics=True)
    seed = factory.generate_cbm_seed()
    
    # Verify PHI-based patterns
    assert factory.detect_phi_patterns(seed) > 0.5
```

**JavaScript:**

```javascript
// tests/test_cbm_engine.js
describe('OmegaBrain', () => {
    let brain;
    
    beforeEach(async () => {
        brain = new OmegaBrain({ dimension: 512 });
        await brain.initialize();
    });
    
    it('should process thoughts correctly', async () => {
        const thought = await brain.processThought("test input");
        expect(thought).toBeInstanceOf(Float32Array);
        expect(thought.length).toBe(512);
    });
    
    it('should unfold seeds', () => {
        const seed = new Uint8Array(64);
        const unfolded = brain.unfoldSeed(seed, 100);
        expect(unfolded.length).toBe(512);
    });
});
```

### Integration Tests

```python
def test_full_pipeline():
    """Test complete thought processing pipeline."""
    # Generate seed
    factory = QuantumSeedFactory(dimension=512)
    seed = factory.generate_cbm_seed()
    
    # Encode logic
    encoder = LogicMatrixEncoder(dimension=256)
    logic = encoder.encode_axioms(["If A then B"])
    
    # Process through brain
    brain = OmegaBrain(dimension=512)
    thought = brain.processThought("test", seed, logic)
    
    assert thought is not None
    assert len(thought) == 512
```

### Performance Tests

```python
import time

def test_gpu_performance():
    """Ensure GPU acceleration provides speedup."""
    brain_gpu = OmegaBrain(useGPU=True)
    brain_cpu = OmegaBrain(useGPU=False)
    
    seed = generate_test_seed()
    
    # GPU timing
    start = time.time()
    brain_gpu.unfoldSeed(seed, 1000)
    gpu_time = time.time() - start
    
    # CPU timing
    start = time.time()
    brain_cpu.unfoldSeed(seed, 1000)
    cpu_time = time.time() - start
    
    # GPU should be at least 10x faster
    assert gpu_time < cpu_time / 10
```

---

## 📚 Documentation

### Documentation Standards

1. **Code Comments:**
   - Explain *why*, not *what*
   - Document complex algorithms
   - Include mathematical formulas

2. **Docstrings:**

   ```python
   def unfold_seed(seed: np.ndarray, iterations: int) -> np.ndarray:
       """Unfold quantum seed through cellular automata evolution.
       
       Uses 7D hyperbolic space with inverse square falloff for
       cell interactions. Implements PHI-based harmonic resonance
       for optimal unfolding dynamics.
       
       Args:
           seed: Binary quantum seed array
           iterations: Number of unfolding iterations
           
       Returns:
           Unfolded state vector in high-dimensional space
           
       Raises:
           ValueError: If seed dimension is invalid
           
       Example:
           >>> factory = QuantumSeedFactory(dimension=512)
           >>> seed = factory.generate_cbm_seed()
           >>> unfolded = unfold_seed(seed, 1000)
           >>> print(unfolded.shape)
           (512,)
       """
       pass
   ```

3. **README Updates:**
   - Keep installation instructions current
   - Update feature list
   - Add new use cases

4. **API Documentation:**
   - Document all public methods
   - Include parameter types
   - Provide usage examples

---

## 🏆 Recognition

Contributors will be recognized in:

- `CONTRIBUTORS.md` file
- Release notes
- Project documentation

Significant contributions may result in:

- Co-authorship on research papers
- Speaking opportunities at conferences
- Collaboration on future projects

---

## 📧 Contact

For questions about contributing:

- **GitHub Issues**: [Create an issue](https://github.com/basedgod55hjl/CBM-Genesis---Quantum-AGI-System-with-7D-Hyperbolic-Neural-Core/issues)
- **Discussions**: [GitHub Discussions](https://github.com/basedgod55hjl/CBM-Genesis---Quantum-AGI-System-with-7D-Hyperbolic-Neural-Core/discussions)

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

---

**Thank you for contributing to the future of quantum-inspired AGI!**

**© 2025 Sir Charles Spikes - Discovery Tech CBN - All Rights Reserved**
