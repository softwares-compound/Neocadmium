# **Cadmium**

## Overview
**Cadmium** is an innovative platform designed to enhance backend development workflows by enabling intelligent log analysis, advanced AI services, and seamless frontend integration. It features a powerful **AI Service** backend and an **Electron-based frontend**, working together to provide a comprehensive tool for error analysis, code indexing, and task automation.

Originally conceived as a personal development tool, Cadmium has evolved into a robust platform, aiming to democratize backend tools with features like **graph-based log traversal**, **fine-tuned LLMs**, and **RAG services**.

---

## **Key Features**
- **Intelligent Log Analysis**:
  - Graph-based traversal for pinpointing errors in large codebases.
  - Advanced tree visualization and RAG-based insights.
- **AI-Powered Services**:
  - Fine-tuned local LLMs for log and code data.
  - Seamless integration with APIs like OpenAI, Ollama, and Anthropic.
- **Unified Frontend**:
  - Electron app with a modern React-based UI.
  - Real-time log viewing and interactive dashboards.
- **Cross-platform Support**:
  - Works on macOS and Linux (Windows support coming soon).

---

## **Directory Structure**
```plaintext
.
├── ai-service/         # Backend service for AI
├── electron-app/       # Electron-based frontend
├── db/                 # Shared directory for databases
├── storage/            # Persistent storage for the application
├── target-codebases/   # Shared directory for target codebases
├── scripts/            # Installation scripts for all platforms
│   ├── install_dependencies.sh
│   ├── install_mac.sh
│   ├── install_linux.sh
│   ├── install_windows.ps1
├── Makefile            # Automates environment setup and application start
├── README.md           # Project documentation
```

---

## **Project Goals**
1. Create a **society of intelligent agents** that collaborate to resolve development challenges.
2. Democratize backend tools with **free access** and **native performance**.
3. Build a **modular and extensible system** for error analysis and AI-driven insights.

---

## **Getting Started**

### **1. Prerequisites**
- **Python**: Version 3.13 or higher
- **Node.js**: Version 18 or higher
- **Ollama**: Installed for macOS/Linux.

### **2. Clone the Repository**
```bash
git clone <repository_url>
cd cadmium
```

### **3. Install Dependencies**
Run the main setup script:
```bash
bash scripts/install_dependencies.sh
```
For Windows, use PowerShell:
```powershell
pwsh scripts/install_windows.ps1
```

---

## **Usage**

### **Start the AI Service**
```bash
make start-ai-service
```

### **Start the Electron App**
```bash
make start-electron-app
```

### **Start Both Services**
```bash
make start-all
```

### **Generate Directory Tree**
Exclude unnecessary directories like `venv` and `node_modules`:
```bash
make print-tree
```

---

## **Development**

### **Run Tests**
```bash
# AI Service
pytest ai-service/tests

# Electron App
cd electron-app
npm test
```

### **Lint Code**
```bash
# Python Linting
flake8 ai-service/

# JavaScript/TypeScript Linting
cd electron-app
npm run lint
```

---

## **Future Enhancements**
1. **Windows Support**:
   - Extend the dependency installation process.
2. **Cloud Portal**:
   - Attract more users with advanced cloud-hosted features.
3. **Enhanced LLM Integration**:
   - Fine-tune local LLMs for better insights.
4. **CI/CD Pipeline**:
   - Add automated testing and deployment workflows.

---

## **Project History**
- **Conceived**: Initially as a personal backend tool to streamline development.
- **Development**:
  - Introduced tree-based and graph-based code traversal.
  - Enhanced with local LLM fine-tuning for intelligent log analysis.
  - Expanded to include a modern frontend for seamless interaction.
- **Vision**: Build a scalable system of intelligent agents to redefine backend development tools.

---

## **Contributing**
We welcome contributions to Cadmium! Please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request with detailed changes.

---

## **License**
This project is licensed under the [MIT License](LICENSE).

---

## **Contact**
For any questions or feedback:
- **Maintainer**: Ben
- **Email**: [bannawandoor@gmail.com](mailto:bannawandoor@gmail.com)

