# Cadmium

Cadmium started as a personal project to make backend development less painful. Now it's grown into a powerful toolkit that combines log analysis, AI capabilities, and a clean interface to help developers work smarter.

## What makes it special?
Cadmium brings together three key innovations:
- A graph-based system for parsing and understanding logs
- Custom-trained local AI models that actually understand your code
- RAG (Retrieve-and-Generate) services that make sense of your development context

## Watch it in action
[![Cadmium Demo](https://img.youtube.com/vi/dBCNhqX9KmI/maxresdefault.jpg)](https://youtu.be/dBCNhqX9KmI)

Want to see how it all comes together? Check out our latest demo where we walk through real-world examples of Cadmium helping developers track down tricky bugs and optimize their workflow.

## Core Features

### Smart Log Analysis
We've built a graph-based system that helps you navigate even the most complex codebases. When something goes wrong, Cadmium helps you trace the issue through your logs with visual tools and AI-powered insights.

### AI Under the Hood
Cadmium runs on locally-trained AI models that we've optimized specifically for understanding code and logs. Need more horsepower? We integrate smoothly with OpenAI, Ollama, and Anthropic's APIs.

### Clean, Fast Interface
The frontend is built in React and packaged as an Electron app, giving you a snappy desktop experience with real-time log viewing and interactive dashboards.

### Platform Support
Currently runs like a charm on macOS and Linux. Windows support is in the works!

## Project Structure
```plaintext
.
├── ai-service/         # AI backend
├── electron-app/       # Frontend interface
├── db/                 # Database files
├── storage/           # App storage
├── target-codebases/  # Codebase storage
├── scripts/           # Install scripts
│   ├── install_dependencies.sh
│   ├── install_mac.sh
│   ├── install_linux.sh
│   ├── install_windows.ps1
├── Makefile          # Setup automation
├── README.md         # You are here
```

## Getting Started

### Before you begin
Make sure you have:
- Python 3.13 or newer
- Node.js 18 or newer
- Ollama installed (for macOS/Linux users)

### Setup
1. Clone it:
```bash
git clone <repository_url>
cd cadmium
```

2. Install what you need:
```bash
# On macOS/Linux:
bash scripts/install_dependencies.sh

# On Windows:
pwsh scripts/install_windows.ps1
```

## Daily Use

Fire up the AI service:
```bash
make start-ai-service
```

Launch the interface:
```bash
make start-electron-app
```

Or start everything at once:
```bash
make start-all
```

Need a directory overview? (Skips noise like `venv` and `node_modules`):
```bash
make print-tree
```

## Development

### Testing
Test the AI bits:
```bash
pytest ai-service/tests
```

Test the interface:
```bash
cd electron-app
npm test
```

### Code Quality
Check Python code:
```bash
flake8 ai-service/
```

Check JavaScript/TypeScript:
```bash
cd electron-app
npm run lint
```

## What's Next?
1. Full Windows support with proper dependency management
2. A cloud portal for advanced features
3. Even smarter AI models for better code and log analysis
4. Automated testing and deployment pipeline

## The Story So Far
Cadmium began as a way to make backend development less frustrating. We've hit some cool milestones along the way:
- Built a graph system that actually makes sense of code
- Trained AI models that understand logs like developers do
- Created an interface that doesn't get in your way

Where we're headed: We want to build a network of smart tools that fundamentally improve how we work with backend systems.

## Want to Help?
We'd love your input! Here's how:
1. Fork the repo
2. Create your feature branch (`feature/your-idea`)
3. Send us a pull request with details about your changes

## License
MIT Licensed. See the [LICENSE](LICENSE) file for the fine print.

## Questions?
Reach out to Ben at [bannawandoor@gmail.com](mailto:bannawandoor@gmail.com)