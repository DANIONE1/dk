FROM python:3.9-slim

WORKDIR /myjenapp

COPY requirements_appJenk.txt requirements.txt

RUN pip install -r requirements.txt

COPY . .

CMD ["python", "mensaje.py"]
