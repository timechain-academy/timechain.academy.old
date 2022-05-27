ARG UBUNTU_VERSION=${UBUNTU_VERSION}
FROM ubuntu:${UBUNTU_VERSION} as base
RUN set -xe; \
apt install -y apt
RUN apt-get -y upgrade
RUN apt-get -y update
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install --no-install-recommends -y \
	debconf --reinstall \
	bsdmainutils \
	apt-utils sudo adduser bash-completion \
	openssh-client openssh-server \
	git make vim python3 python3-pip
# 	python3 python3-pip python3-setuptools quilt \
# 	virtualenv mkdocs \
# 	build-essential libtool autotools-dev automake pkg-config bsdmainutils g++ \
# 	libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools

# USER root

ARG PASSWORD=${PASSWORD}
ENV GIT_DISABLE_UNTRACKED_CACHE=true
ARG HOST_UID=${HOST_UID:-4000}
ARG HOST_USER=${HOST_USER:-nodummy}

ENV SSH_DIR=/home/${HOST_USER}/.ssh
ENV SOCKET_DIR=/home/${HOST_USER}/.ssh-agent
ENV SSH_AUTH_SOCK=/home/${HOST_USER}${SOCKET_DIR}/socket
ENV SSH_AUTH_PROXY_SOCK=/home/${HOST_USER}${SOCKET_DIR}/proxy-socket
VOLUME ${SOCKET_DIR}



RUN chmod 640 /etc/shadow
RUN chmod 4511 /usr/bin/passwd
RUN mkdir -p /var/cache/debconf

# RUN mkdir -p /home/${HOST_USER}
# RUN mkdir -p /home/${HOST_USER}/.ssh
RUN if [ -r ~/.ssh/id_rsa ]; then y | ssh-keygen; fi

# RUN [[ "string1" == "string2" ]] && echo "Equal" || echo "Not equal"
RUN rm -rf  /home/${HOST_USER}
RUN if [ ${HOST_UID} != 0 ]; then adduser --system --disabled-password --ingroup sudo --home /home/${HOST_USER} --uid ${HOST_UID} ${HOST_USER}; fi
RUN echo root:${PASSWORD} | chpasswd
RUN echo ${HOST_USER}:${PASSWORD} | chpasswd
RUN echo "Set disable_coredump false" >> /etc/sudo.conf

# RUN mkdir -p /home/${HOST_USER}/.ssh &&  chmod 700 /home/${HOST_USER}/.ssh
# RUN touch  /home/${HOST_USER}/.ssh/id_rsa
# RUN echo -n ${SSH_PRIVATE_KEY} | base64 --decode >  /home/${HOST_USER}/.ssh/id_rsa
# RUN  chown -R "${HOST_UID}:${HOST_UID}" /home/${HOST_USER}/.ssh
# RUN chmod 600 /home/${HOST_USER}/.ssh/id_rsa

ENTRYPOINT ["docker-entrypoint.sh"]


USER ${HOST_USER}
COPY bin /usr/local/bin
COPY opt/healthcheck.sh /opt/healthcheck.sh

WORKDIR /home/${HOST_USER}/timechain.academy
# CMD [  "bash", "-c", "eval", "$(ssh-agent -s)" ]
CMD ["ssh-agent"]
HEALTHCHECK --interval=5s --timeout=1s --retries=3 CMD ["/opt/healthcheck.sh"]

