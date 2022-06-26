FROM python:3.8-slim-buster
FROM tiangolo/uwsgi-nginx:python3.8


RUN apt-get update
RUN apt-get install -y python3-pip curl unzip git python3-flask

RUN mkdir -p /sni
WORKDIR /sni
# COPY .env.example .env
RUN python3 -m pip install virtualenv pip-tools

RUN git clone --progress --verbose --depth 3 \
	https://github.com/NakamotoInstitute/nakamotoinstitute.org.git \
	repo

RUN curl https://nakamotoinstitute.org/static/docs/sni-docs.zip --output docs.zip

RUN unzip -o docs.zip -d docs

RUN pip install -U Flask

RUN python3 -m piptools compile /sni/repo/requirements/base.in
RUN python3 -m piptools compile /sni/repo/requirements/dev.in
RUN python3 -m piptools compile /sni/repo/requirements/prod.in
RUN python3 -m piptools sync /sni/repo/requirements/base.txt
RUN python3 -m piptools sync /sni/repo/requirements/dev.txt
# RUN python3 -m piptools sync /sni/repo/requirements/prod.txt

# CMD [ "flask", "data", "seed"]
# CMD [ "python3", "-m" , "flask", "data", "seed"]
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]