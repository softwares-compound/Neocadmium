# Define directories and files
VENV_DIR = venv
SHARED_DIRS = target-codebases db
ELECTRON_DIR = electron-app
AI_SERVICE_DIR = ai-service

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
	@cd $(ELECTRON_DIR) && $(NPM) install

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
	@source $(VENV_DIR)/bin/activate && cd $(AI_SERVICE_DIR) && $(PYTHON) app/main.py

# Start Electron App
.PHONY: start-electron-app
start-electron-app:
	@echo "Starting Electron App..."
	@cd $(ELECTRON_DIR) && $(NPM) start

# Start both services
.PHONY: start-all
start-all: start-ai-service start-electron-app
	@echo "Both services started!"

# Clean up environment
.PHONY: clean
clean:
	@echo "Cleaning up environment..."
	@rm -rf $(VENV_DIR)
	@rm -rf $(ELECTRON_DIR)/node_modules
	@for dir in $(SHARED_DIRS); do rm -rf $$dir/*; done
	@echo "Clean up completed!"
