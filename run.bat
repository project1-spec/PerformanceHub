@echo off
echo ================================================
echo   PerformanceHub - Fitness Analytics Platform
echo ================================================
echo.
pip install bcrypt 2>/dev/null
if not exist static mkdir static
if not exist static\index.html copy index.html static\index.html
echo Starting PerformanceHub server...
echo Open http://localhost:8080 in your browser
echo.
echo Demo login: demo@performancehub.com / demo123
echo.
python server.py
