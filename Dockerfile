FROM python:3.12-slim

RUN apt-get update && apt-get install -y rsyslog

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt 

COPY . .

EXPOSE 8000

CMD ["gunicorn", "django_ecommerce.wsgi:application", "--bind", "0.0.0.0:8000", "--access-logfile", "-", "--error-logfile", "-"]

WORKDIR /app

COPY requirements.txt .

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt 

COPY . .

EXPOSE 8000

CMD ["gunicorn", "django_ecommerce.wsgi:application", "--bind", "0.0.0.0:8000"]


