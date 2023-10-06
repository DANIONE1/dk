FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt requirements.txt

COPY . .

CMD ["python", "mensaje.py"]
