# Variables
VENV_DIR = venv
AI_SERVICE_DIR = ai-service
PYTHON = $(VENV_DIR)/bin/python
PIP = $(VENV_DIR)/bin/pip
ELECTRON_DIR = electron-app
ELECTRON_FRONTEND_DIR = $(ELECTRON_DIR)/cadmium-frontend


# Define Python and Node.js commands
PYTHON = python3
PIP = $(VENV_DIR)/bin/pip
NPM = npm

# Setup virtual environment for AI Service
.PHONY: setup-venv
setup-venv:
	@echo "Creating Python virtual environment..."
	@if [ ! -d "$(VENV_DIR)" ]; then $(PYTHON) -m venv $(VENV_DIR); fi
	@echo "Installing Python dependencies..."
	@$(PIP) install --upgrade pip
	@$(PIP) install -r $(AI_SERVICE_DIR)/requirements.in

# Install Node.js dependencies for Electron App
.PHONY: install-node-modules
install-node-modules:
	@echo "Installing Node.js dependencies..."
	@cd $(ELECTRON_DIR) && $(NPM) install && $(NPM) install --save-dev vite @vitejs/plugin-react
	@cd $(ELECTRON_FRONTEND_DIR) && $(NPM) install 


# Create shared directories
.PHONY: create-shared-dirs
create-shared-dirs:
	@echo "Creating shared directories..."
	@for dir in $(SHARED_DIRS); do \
		if [ ! -d "$$dir" ]; then mkdir -p $$dir; fi; \
	done

# Initialize the environment (setup everything)
.PHONY: init
init: setup-venv install-node-modules create-shared-dirs
	@echo "Environment setup completed!"

# Start AI Service
.PHONY: start-ai-service
start-ai-service:
	@echo "Starting AI Service..."
	@. $(VENV_DIR)/bin/activate && PYTHONPATH=$(shell pwd)/$(AI_SERVICE_DIR) $(PYTHON) $(AI_SERVICE_DIR)/app/main.py


# Start Electron App
.PHONY: start-electron-app
start-electron-app:
	@echo "Starting Electron App..."
	@cd $(ELECTRON_DIR) && $(NPM) run dev

# Start both services
.PHONY: start-all
start-all:
	@echo "Starting both services concurrently..."
	@(. $(VENV_DIR)/bin/activate && PYTHONPATH=$(shell pwd)/$(AI_SERVICE_DIR) $(PYTHON) $(AI_SERVICE_DIR)/app/main.py) & \
	(cd $(ELECTRON_DIR) && $(NPM) start)

# Clean up environment
.PHONY: clean
clean:
	@echo "Cleaning up environment..."
	@rm -rf $(VENV_DIR)
	@rm -rf $(ELECTRON_DIR)/node_modules
	@for dir in $(SHARED_DIRS); do rm -rf $$dir/*; done
	@echo "Clean up completed!"

# Generate a directory tree excluding node_modules, venv, and __pycache__
.PHONY: print-tree
print-tree:
	@echo "Generating filtered directory tree..."
	@tree -I "node_modules|venv|__pycache__" | tee directory_tree.txt | pbcopy
	@echo "Directory tree copied to clipboard and saved to 'directory_tree.txt'."

.PHONY: install-dependencies
install-dependencies:
	@echo "Running dependency installation script..."
	@bash scripts/install_dependencies.sh
