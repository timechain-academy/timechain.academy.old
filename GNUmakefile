SHELL := /bin/bash

PWD                                     ?= pwd_unknown

THIS_FILE                               := $(lastword $(MAKEFILE_LIST))
export THIS_FILE
TIME                                    := $(shell date +%s)
export TIME

ARCH                                    :=$(shell uname -m)
export ARCH
ifeq ($(ARCH),x86_64)
TRIPLET                                 :=x86_64-linux-gnu
export TRIPLET
endif
ifeq ($(ARCH),arm64)
TRIPLET                                 :=aarch64-linux-gnu
export TRIPLET
endif

ifneq ($(target),)
SERVICE_TARGET := $(target)
else
SERVICE_TARGET := ubuntu
endif
export SERVICE_TARGET

ifeq ($(nocache),true)
NOCACHE:=--no-cache
endif
ifeq ($(verbose),true)
NOCACHE:=--verbose
endif

ifeq ($(user),root)
HOST_USER :=root
HOST_UID  :=$(strip $(if $(uid),$(uid),0))
else
#allow override by adding user= and/ or uid=  (lowercase!).
#uid= defaults to 0 if user= set (i.e. root).
#USER retrieved from env, UID from shell.
HOST_USER :=$(strip $(if $(USER),$(USER),nodummy))
HOST_UID  :=$(strip $(if $(shell id -u),$(shell id -u),4000))
endif
export HOST_USER
export HOST_UID


PYTHON                                  := $(shell which python)
export PYTHON
PYTHON2                                 := $(shell which python2)
export PYTHON2
PYTHON3                                 := $(shell which python3)
export PYTHON3

PIP                                     := $(shell which pip)
export PIP
PIP2                                    := $(shell which pip2)
export PIP2
PIP3                                    := $(shell which pip3)
export PIP3

python_version_full                     := $(wordlist 2,4,$(subst ., ,$(shell python3 --version 2>&1)))
python_version_major                    := $(word 1,${python_version_full})
python_version_minor                    := $(word 2,${python_version_full})
python_version_patch                    := $(word 3,${python_version_full})

my_cmd.python.3                         := $(PYTHON3) some_script.py3
my_cmd                                  := ${my_cmd.python.${python_version_major}}

PYTHON_VERSION                          := ${python_version_major}.${python_version_minor}.${python_version_patch}
PYTHON_VERSION_MAJOR                    := ${python_version_major}
PYTHON_VERSION_MINOR                    := ${python_version_minor}

export python_version_major
export python_version_minor
export python_version_patch
export PYTHON_VERSION


#PROJECT_NAME defaults to name of the current directory.
ifeq ($(project),)
PROJECT_NAME							:= timechain-academy#$(notdir $(PWD))
else
PROJECT_NAME							:= $(project)
endif
export PROJECT_NAME

ifeq ($(user),root)
HOST_USER := root
HOST_UID  := $(strip $(if $(uid),$(uid),0))
else
#allow override by adding user= and/ or uid=  (lowercase!).
#uid= defaults to 0 if user= set (i.e. root).
#USER retrieved from env, UID from shell.
HOST_USER :=  $(strip $(if $(USER),$(USER),nodummy))
HOST_UID  :=  $(strip $(if $(shell id -u),$(shell id -u),4000))
endif
ifneq ($(uid),)
HOST_UID  := $(uid)
endif

ifeq ($(ssh-pkey),)
SSH_PRIVATE_KEY := $(HOME)/.ssh/id_rsa
else
SSH_PRIVATE_KEY := $(ssh-pkey)
endif
export SSH_PRIVATE_KEY

ifeq ($(alpine),)
ALPINE_VERSION := 3.15
else
ALPINE_VERSION := $(alpine)
endif
export ALPINE_VERSION

ifeq ($(dind),)
DIND_VERSION := 20.10.16
else
DIND_VERSION := $(dind)
endif
export DIND_VERSION

ifeq ($(debian),)
DEBIAN_VERSION := bookworm
else
DEBIAN_VERSION := $(debian)
endif
export DEBIAN_VERSION

ifeq ($(ubuntu),)
UBUNTU_VERSION := jammy
else
UBUNTU_VERSION := $(ubuntu)
endif
export UBUNTU_VERSION

ifeq ($(nocache),true)
NO_CACHE := --no-cache
else
NO_CACHE :=
endif
export NO_CACHE

ifeq ($(verbose),true)
VERBOSE := --verbose
else
VERBOSE :=
endif
export VERBOSE

ifneq ($(passwd),)
PASSWORD := $(passwd)
else
PASSWORD := changeme
endif
export PASSWORD

DOCKER:=$(shell which docker)
export DOCKER
DOCKER_COMPOSE:=$(shell which docker-compose)
export DOCKER_COMPOSE

#GIT CONFIG
GIT_USER_NAME							:= $(shell git config user.name)
export GIT_USER_NAME
GIT_USER_EMAIL							:= $(shell git config user.email)
export GIT_USER_EMAIL
GIT_SERVER								:= https://github.com
export GIT_SERVER

GIT_REPO_NAME							:= $(PROJECT_NAME)
export GIT_REPO_NAME

#Usage
#make push profile=timechain-academy
#note on GH_TOKEN.txt file below
ifeq ($(profile),)
GIT_PROFILE								:=$(GIT_USER_NAME)
ifeq ($(GIT_REPO_ORIGIN),git@github.com:timechain-academy/timechain.academy.git)
GIT_PROFILE								:=timechain-academy
endif
ifeq ($(GIT_REPO_ORIGIN),https://github.com/$(GITHUB_USER_NAME)/timechain.academy.git)
GIT_PROFILE								:=$(GITHUB_USER_NAME)
endif
else
GIT_PROFILE								:=$(profile)
endif
export GIT_PROFILE

GIT_BRANCH								:= $(shell git rev-parse --abbrev-ref HEAD)
export GIT_BRANCH
GIT_HASH								:= $(shell git rev-parse --short HEAD)
export GIT_HASH
GIT_PREVIOUS_HASH						:= $(shell git rev-parse --short HEAD^1)
export GIT_PREVIOUS_HASH
GIT_REPO_ORIGIN							:= $(shell git remote get-url origin)
export GIT_REPO_ORIGIN
GIT_REPO_PATH							:= $(HOME)/$(GIT_REPO_NAME)
export GIT_REPO_PATH



PORT:=8000
export PORT

#REF: https://linuxize.com/post/bash-printf-command/
#Width directive
#Here is an example:
#
#printf "%20s %d\n" Mark 305
#Copy
#%20s means set the field at least 20 characters long. Blanks are added before the text because, by default, the output is right-justified. To align the text to left, use the - flag (%-20s).
#
#      Mark 305
#
#\\ - Displays a backslash character.
#\b - Displays a backspace character.
#\n - Displays a new line.
#\r - Displays a carriage return.
#\t - Displays a horizontal tab.
#\v - Displays a vertical tab.


.PHONY: - help init build serve push signin git-add
-:
	#NOTE: 2 hashes are detected as 1st column output with color
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?##/ {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

help:## 	verbose help
# help:print help
# 	test
# 		test
# 			test
# 				test
# 	test:test
# 		test:test
# 			test:test
# 				test:test
# 	test:	test
# 		test:		test
# 			test:			test
# 				test:				test
## help:print help
## 	test
## 		test
## 			test
## 				test
## 	test:test
## 		test:test
## 			test:test
## 				test:test
## 	test:	test
## 		test:		test
## 			test:			test
## 				test:				test
### help:print help
### 	test
### 		test
### 			test
### 				test
### 	test:test
### 		test:test
### 			test:test
### 				test:test
### 	test:	test
### 		test:		test
### 			test:			test
### 				test:				test
	@sed -n 's/^# //p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/# /'
	@sed -n 's/^## //p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/## /'
	@sed -n 's/^### //p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/### /'

.PHONY: report
report:## 	report
	@echo ''
	@echo '	[ARGUMENTS]	'
	@echo '      args:'
	@echo '        - THIS_FILE=${THIS_FILE}'
	@echo '        - TIME=${TIME}'
	@echo '        - PROJECT_NAME=${PROJECT_NAME}'
	@echo '        - HOME=${HOME}'
	@echo '        - PWD=${PWD}'
	@echo '        - PYTHON=${PYTHON}'
	@echo '        - PYTHON3=${PYTHON3}'
	@echo '        - PYTHON_VERSION=${PYTHON_VERSION}'
	@echo '        - PYTHON_VERSION_MAJOR=${PYTHON_VERSION_MAJOR}'
	@echo '        - PYTHON_VERSION_MINOR=${PYTHON_VERSION_MINOR}'
	@echo '        - PIP=${PIP}'
	@echo '        - PIP3=${PIP3}'
	@echo '        - ARCH=${ARCH}'
	@echo '        - TRIPLET=${TRIPLET}'
	@echo '        - PORT=${PORT}'
	@echo '        - GIT_USER_NAME=${GIT_USER_NAME}'
	@echo '        - GIT_USER_EMAIL=${GIT_USER_EMAIL}'
	@echo '        - GIT_SERVER=${GIT_SERVER}'
	@echo '        - GIT_PROFILE=${GIT_PROFILE}'
	@echo '        - GIT_BRANCH=${GIT_BRANCH}'
	@echo '        - GIT_HASH=${GIT_HASH}'
	@echo '        - GIT_PREVIOUS_HASH=${GIT_PREVIOUS_HASH}'
	@echo '        - GIT_REPO_ORIGIN=${GIT_REPO_ORIGIN}'
	@echo '        - GIT_REPO_NAME=${GIT_REPO_NAME}'
	@echo '        - GIT_REPO_PATH=${GIT_REPO_PATH}'

.PHONY: init initialize docs
initialize:## 	initialize
	./scripts/initialize
init: initialize## 	init
	python3 -m pip install -r requirements.txt

docs: build## 	docs
	git add -f docs
	git commit --allow-empty -m "docs: update $(TIME)"


.PHONY: clean-resources clean sources resources
clean-resources: 	clean resources
clean:## 	clean
	rm -rf sources/playground/docker
	rm -rf sources/git
	rm -rf sources/ide
	rm -rf sources/books
	rm -rf sources/qt/webengine
	rm -f  *.log

.SILENT:
sources: resources## 	sources
resources:
	( \
	    rm -f resources.log; \
	    tail resources.log & \
	    echo $(TIME) > resources.log; \
	    $(MAKE) playground; \
	    $(MAKE) git-it; \
	    $(MAKE) bitcoin-ide; \
	    $(MAKE) qt-webengine; \
	    $(MAKE) books; \
	);

playground:## 	clone-playground
	git clone --progress --verbose --depth 1 -b 0.5.0 https://github.com/PLEBNET-PLAYGROUND/plebnet-playground-docker.git   \
        sources/playground/docker \
		>> resources.log 2>&1 \
        || >>  resources.log 2>&1
git-it:## 	git-it
	git clone --progress --verbose --depth 1 -b 4.4.0 https://github.com/jlord/git-it-electron.git                          \
        sources/git \
		>> resources.log 2>&1 \
        || >> resources.log 2>&1
bitcoin-ide:## 	bitcoin-ide
	git clone --progress --verbose --depth 1 https://github.com/timechain-academy/bitcoinIDE.git                            \
        sources/ide \
		>> resources.log 2>&1 \
        || >> resources.log 2>&1
qt-webengine:## 	qt webengine
	git clone --progress --verbose --depth 1 -b v5.15.5-lts git://code.qt.io/qt/qtwebengine.git                             \
        sources/qt/webengine \
		>> resources.log 2>&1 \
        || >> resources.log 2>&1
	git clone --progress --verbose --depth 1 -b v5.15.2 git://code.qt.io/qt/qtwebengine-chromium.git                        \
        sources/qt/webengine/src/3rdparty/qtwebengine-chromium \
		>> resources.log 2>&1 \
        || >> resources.log 2>&1

clean-books:## 	clean
	rm -rf sources/books
	$(MAKE) books
books: mastering-bitcoin mastering-lightning python
	mkdir -p docs/books
	apt install pandoc || brew install pandoc
	# cat sources/HEADER.md > README.md
	# #echo '```' >> README.md
	# make help >> sources/COMMANDS.md
	# #echo '```' >> README.md
	bash -c "if hash pandoc 2>/dev/null; then echo; fi || brew or apt install pandoc"
	bash -c 'pandoc -s README.md -o index.html  --metadata title="" '
	apt install asciidoctor || brew install asciidoctor
	pushd sources/books/bitcoinbook > /dev/null; for string in *.asciidoc; do echo "$$string"; done; popd || echo "."
	pushd sources/books/bitcoinbook > /dev/null; for string in *.md; do sed 's/asciidoc/html/g' $$string | tee $$string; done; popd || echo "....."
	pushd sources/books/bitcoinbook > /dev/null; for string in *.asciidoc; do asciidoctor $$string; done; popd || echo "..."
	pushd sources/books/lnbook      > /dev/null; for string in *.asciidoc; do echo "$$string"; done; popd || echo "...."
	pushd sources/books/lnbook      > /dev/null; for string in *.md; do sed 's/asciidoc/html/g' $$string | tee $$string; done; popd || echo "....."
	pushd sources/books/lnbook      > /dev/null; for string in *.asciidoc; do asciidoctor $$string; done; popd || echo "......"

mastering-bitcoin:## 	mastering bitcoin
	git clone --progress --verbose --depth 1 -b 1653630097/6f13274/77b91b1 https://github.com/randymcmillan/bitcoinbook.git \
        sources/books/bitcoinbook \
		>> resources.log 2>&1 \
        || >> resources.log 2>&1
mastering-lightning:## 	mastering lightning
	git clone --progress --verbose --depth 1 https://github.com/lnbook/lnbook.git                                           \
        sources/books/lnbook \
		>> resources.log 2>&1 \
        || >> resources.log 2>&1
python:## 	python
	git clone --progress --verbose --depth 1 https://github.com/kyclark/tiny_python_projects.git                             \
        sources/books/python \
		>> resources.log 2>&1 \
        || >> resources.log 2>&1





.PHONY: build serve build-shell shell shell-test
build-docs:## 	build mkdocs
	$(MAKE) resources
	mkdir -p docs
	apt install pandoc || brew install pandoc
	cat sources/HEADER.md > README.md
	#echo '```' >> README.md
	make help > sources/COMMANDS.md
	#echo '```' >> README.md
	bash -c "if hash pandoc 2>/dev/null; then echo; fi || brew or apt install pandoc"
	bash -c 'pandoc -s README.md -o index.html  --metadata title="" '
	apt install asciidoctor || brew install asciidoctor
	pushd sources/books/bitcoinbook > /dev/null; for string in *.asciidoc; do echo "$$string"; done; popd || echo "."
	pushd sources/books/bitcoinbook > /dev/null; for string in *.md; do sed 's/asciidoc/html/g' $$string | tee $$string; done; popd || echo "....."
	pushd sources/books/bitcoinbook > /dev/null; for string in *.asciidoc; do asciidoctor --doctype=book $$string; done; popd || echo "..."
	pushd sources/books/lnbook      > /dev/null; for string in *.asciidoc; do echo "$$string"; done; popd || echo "...."
	pushd sources/books/lnbook      > /dev/null; for string in *.md; do sed 's/asciidoc/html/g' $$string | tee $$string; done; popd || echo "....."
	pushd sources/books/lnbook      > /dev/null; for string in *.asciidoc; do asciidoctor --doctype book $$string; done; popd || echo "......"
	mkdocs -q build

build-playground:## 	build-playground
	pushd sources/playground/docker && make initialize init build && popd


serve: build## 	serve mkdocs
	mkdocs serve & open http://127.0.0.1:$(PORT) || open http://127.0.0.1:$(PORT)
	#$(PYTHON3) -m http.server $(PORT) --bind 127.0.0.1 -d $(PWD)/docs > /dev/null 2>&1 || open http://127.0.0.1:$(PORT)

build-shell:## 	build the ubuntu docker image
	docker-compose build $(NOCACHE) $(VERBOSE) ${SERVICE_TARGET}

.PHONY: shell
shell: build-shell## 	run the ubuntu docker environment
ifeq ($(CMD_ARGUMENTS),)
	$(DOCKER_COMPOSE) $(VERBOSE) -p $(PROJECT_NAME)_$(HOST_UID) run --rm ${SERVICE_TARGET} bash
else
	$(DOCKER_COMPOSE) $(VERBOSE) -p $(PROJECT_NAME)_$(HOST_UID) run --rm $(SERVICE_TARGET) bash -c "$(CMD_ARGUMENTS)"
endif

shell-test:
	docker-compose -p $(PROJECT_NAME)_$(HOST_UID) run --rm ${SERVICE_TARGET} sh -c '\
		echo "I am `whoami`. My uid is `id -u`." && /bin/bash -c "curl -fsSL https://raw.githubusercontent.com/timechain-academy/timechain.academy/master/whatami"' \
	&& echo success



push-docs: docs push

push:
	@echo push
	$(MAKE) docs
	git checkout -b $(TIME)/$(GIT_PREVIOUS_HASH)/$(GIT_HASH)
	git push --set-upstream origin $(TIME)/$(GIT_PREVIOUS_HASH)/$(GIT_HASH)
	#git add docs
	#git commit --no-edit --allow-empty -m "$(TIME)" || echo failed to commit --amend --no-edit
	git push -f origin $(TIME)/$(GIT_PREVIOUS_HASH)/$(GIT_HASH):$(TIME)/$(GIT_PREVIOUS_HASH)/$(GIT_HASH)


push-to-master:
	$(MAKE) docs
	git push -f  $(GIT_REPO_ORIGIN) $(GIT_BRANCH):master || echo failed to push docs
push-to-main: docs
	$(MAKE) docs
	git push -f  $(GIT_REPO_ORIGIN) $(GIT_BRANCH):main || echo failed to push docs


SIGNIN=randymcmillan
export SIGNIN

signin:
#Place a file named GH_TOKEN.txt in your $HOME - create in https://github.com/settings/tokens (Personal access tokens)
	bash -c 'cat ~/GH_TOKEN.txt | docker login ghcr.io -u $(GIT_PROFILE) --password-stdin'
