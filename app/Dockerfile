FROM python:3.8-slim

COPY requirements.txt requirements.txt
RUN python3 -m pip install --upgrade pip && pip3 install -r requirements.txt
WORKDIR /srv/app
COPY web.py .
WORKDIR /srv/app/conf
COPY web.conf .
WORKDIR /srv/app
CMD ["python3", "web.py"]