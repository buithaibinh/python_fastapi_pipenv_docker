FROM python:3.9-alpine

RUN pip install --upgrade pip

WORKDIR /app

# COPY --chown=myuser:myuser requirements.txt requirements.txt
# RUN pip install --user -r requirements.txt

COPY Pipfile* ./

RUN  pip install pipenv  \
    && pipenv requirements > requirements.txt \
    && pip install -r requirements.txt

COPY app ./app

COPY ui ./ui

CMD ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "80"]