FROM node:latest

WORKDIR /usr/src/app

COPY requirements.txt requirements.txt

COPY . .

CMD ["python", "mensaje.py"]
