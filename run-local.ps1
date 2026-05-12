// powershell -ExecutionPolicy Bypass -File .\run-local.ps1 
$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$backend = Join-Path $root "Multi-Agent-System-BSE-7A-Backend"
$frontend = Join-Path $root "Multi-Agent-System-BSE-7A-Frontend"
$pythonPath = Join-Path $backend "venv\Scripts\python.exe"
 
if (!(Test-Path $pythonPath)) {
  python -m venv (Join-Path $backend "venv")
}
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit", "-Command", "cd '$backend'; & '$pythonPath' -m uvicorn supervisor.main:app --host 127.0.0.1 --port 8000 --reload"
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit", "-Command", "cd '$backend'; & '$pythonPath' -m uvicorn agents.gemini_wrapper_agent.app:app --host 127.0.0.1 --port 5010 --reload"
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit", "-Command", "cd '$backend'; & '$pythonPath' -m uvicorn agents.citation_manager.app:app --host 127.0.0.1 --port 5016 --reload"
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit", "-Command", "cd '$frontend'; pnpm dev"
