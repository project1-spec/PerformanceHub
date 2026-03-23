#!/bin/bash
echo "================================================"
echo "  PerformanceHub - Fitness Analytics Platform"
echo "================================================"
echo ""

# Check Python 3
if ! command -v python3 &> /dev/null; then
    echo "Error: python3 is required but not installed."
    exit 1
fi

# Check bcrypt
python3 -c "import bcrypt" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Installing bcrypt..."
    pip3 install bcrypt
fi

# Create static directory and move index.html if needed
mkdir -p static
if [ ! -f static/index.html ] && [ -f index.html ]; then
    cp index.html static/index.html
fi

echo "Starting PerformanceHub server..."
echo "Open http://localhost:8080 in your browser"
echo ""
echo "Demo login: demo@performancehub.com / demo123"
echo ""
python3 server.py
