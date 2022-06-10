# How to run on local

```bash
pipenv install --dev
```

```bash
uvicorn app.main:app --proxy-headers --host 0.0.0.0 --port 80
```

# How to run on Docker

```bash
docker build -t fastapi-demo .
docker run -p 80:80 fastapi-demo
```