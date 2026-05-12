# Multi-Agent Supervisor System

Multi-Agent Supervisor System is a Dockerized educational AI platform where a supervisor API routes student requests to specialized autonomous agents for research, citations, quizzes, study planning, lectures, plagiarism prevention, collaboration, and exam readiness.

## Features

- Supervisor API that routes requests to the correct specialist agent
- Agent registry with capabilities, keywords, required parameters, and service URLs
- Gemini wrapper agent for shared LLM access
- Citation, assignment coaching, research scout, quiz generation, concept reinforcement, study scheduler, lecture insight, exam readiness, and presentation feedback agents
- Docker Compose orchestration for frontend, supervisor, agents, Postgres, and agent-specific volumes
- PowerShell local development runner for core services
- Environment-driven API key configuration

## Tech Stack

| Layer | Technology |
| --- | --- |
| Orchestration | Docker Compose |
| Backend Services | Python, FastAPI/Uvicorn |
| Frontend | Next.js |
| AI Provider | Gemini |
| Database | PostgreSQL for study tracking |
| Local Tooling | PowerShell runner |

## Project Structure

```text
.
|-- Multi-Agent-System-BSE-7A-Backend/    Supervisor and specialist agents
|-- Multi-Agent-System-BSE-7A-Frontend/   Student-facing frontend
|-- docker-compose.yml                    Full local service orchestration
|-- registry.json                         Agent metadata and routing hints
|-- run-local.ps1                         Core local development launcher
`-- README.md
```

## Environment Variables

Create `.env` in the repository root:

```env
NEXT_PUBLIC_GEMINI_API_KEY=
SUPERVISOR_GEMINI_API_KEY=
GEMINI_WRAPPER_API_KEY=
CITATION_GEMINI_API_KEY=
PRESENTATION_FEEDBACK_GEMINI_API_KEY=
QUESTION_ANTICIPATOR_GEMINI_API_KEY=
ASSEMBLY_AI_API_KEY=
TAVILY_API_KEY=
YOUTUBE_API_KEY=
GEMINI_API_URL=
```

Only the agents that use a specific provider key require that key to be filled.

## Run With Docker Compose

```bash
docker compose up -d --build
```

View logs:

```bash
docker compose logs -f supervisor
docker compose logs -f gemini-wrapper
docker compose logs -f citation-manager-agent
```

Stop services:

```bash
docker compose down
```

## Run Core Services Locally On Windows

```powershell
powershell -ExecutionPolicy Bypass -File .\run-local.ps1
```

This starts the supervisor, Gemini wrapper, citation manager, and frontend development server in separate PowerShell windows.

## Service Map

| Service | Local URL |
| --- | --- |
| Frontend | `http://localhost:3000` |
| Supervisor API | `http://localhost:8000/health` |
| Gemini Wrapper | `http://localhost:5010` |
| Citation Manager | `http://localhost:5016` |

Additional agent ports are defined in `docker-compose.yml`.
