FROM python:3.8-slim-buster

RUN apt-get install virtualenv pip-tools

VOLUME /sni
WORKDIR /sni
COPY .env.example .env
RUN pip3 install -r requirements.txt
RUN pip-sync requirements/base.txt
RUN pip-sync requirements/dev.txt

CMD [ "python3", "-m" , "flask", "data", "seed"]
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]