# SQL Practice (Daily)

A simple structure to practice SQL every day and push to GitHub.

## How this repo works
- **prompts/**: the questions/challenges for each day (e.g., `day01.md`).
- **solutions/**: your SQL answers (e.g., `day01.sql`).
- **postgres/**: a local Postgres setup using Docker for realistic practice.
- **scripts/**: initialization scripts to create tables and seed data.
- **datasets/**: optional CSVs or data files you load into your DB.

## Quick start
1. Install Docker Desktop.
2. Start Postgres locally:
   ```bash
   docker compose -f postgres/docker-compose.yml up -d
   # initialize tables and sample data
   docker exec -i sql_practice_db psql -U practice -d practice -f /docker-entrypoint-initdb.d/init.sql
   ```
3. Try the first prompt in `prompts/day01.md` and write your answer in `solutions/day01.sql`.
4. Run your query:
   ```bash
   docker exec -i sql_practice_db psql -U practice -d practice -f /workspace/solutions/day01.sql
   ```
   (If your repo path differs inside the container, you can copy the file in with `docker cp` or psql it from the host.)
5. Commit and push (see **Git workflow** below).

## Git workflow (local -> GitHub)
```bash
git init
git add .
git commit -m "init: SQL practice scaffold"
git branch -M main
git remote add origin https://github.com/<YOUR_USERNAME>/sql-practice.git
git push -u origin main
```

Then each day:
```bash
# create your files
cp prompts/day01.md prompts/day02.md
touch solutions/day02.sql

git add prompts/day02.md solutions/day02.sql
git commit -m "day02: window functions practice"
git push
```

## Linting
This repo includes a GitHub Action that lints your `.sql` files with **sqlfluff** (PostgreSQL dialect by default). You can also run locally:
```bash
pip install sqlfluff
sqlfluff lint .
```

## Tips
- Keep solutions self‑contained so anyone can run them.
- Prefer CTEs and comments to explain your logic.
- Add small synthetic datasets in `scripts/init.sql` to practice various patterns.
Triggering GitHub
