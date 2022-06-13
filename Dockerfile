FROM ubuntu:22.04
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y wget build-essential zlib1g-dev libffi-dev libssl-dev libpq-dev
WORKDIR /home
RUN wget https://www.python.org/ftp/python/3.10.4/Python-3.10.4.tgz
RUN tar -xzf Python-3.10.4.tgz
WORKDIR /home/Python-3.10.4
RUN ./configure
RUN make
RUN make install
RUN rm -rf Python-3.10.4 Python-3.10.4.tgz
RUN pip3 install --upgrade pip
RUN pip3 install Django==4.0.5 psycopg2
WORKDIR /home/konbinein-backend
CMD python3 manage.py runserver 0.0.0.0:8000
