FROM python:3.8-slim

RUN python3 -m pip install --upgrade pip && pip3 install configparser && pip3 install psycopg2-binary && pip3 install flask
WORKDIR /srv/app
COPY web.py .
COPY web.conf /srv/app/conf/
WORKDIR /srv/app
CMD ["python3", "web.py"]
EXPOSE 5000