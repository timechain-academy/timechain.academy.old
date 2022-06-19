SHELL := /bin/bash
NOHUP := $(shell which nohup)

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


# NOTE: docker doesnt like names with dots
# Use $(GIT_REPO_NAME) for commands that need the dotted name
# $(PROJECT_NAME) is used in many docker commands in the GNUmakefile
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

ifneq ($(cmd),)
CMD_ARGUMENTS := $(cmd)
else
CMD_ARGUMENTS :=
endif
export CMD_ARGUMENTS

ifeq ($(private),true)
# make docs private=true
PRIVATE := books/private/PRIVATE.md
PRIVATE_BITCOINBOOK := books/private/bitcoinbook/book.html
PRIVATE_BITCOINBOOKCH01 := books/private/bitcoinbook/ch01.html
PRIVATE_BITCOINBOOKCH02 := books/private/bitcoinbook/ch02.html
PRIVATE_LNBOOK := books/private/lnbook/index.html
else
PRIVATE := books/private/README.md
PRIVATE_BITCOINBOOK := books/private/README.md
PRIVATE_LNBOOK := books/private/README.md
endif
export PRIVATE
export PRIVATE_BITCOINBOOK
export PRIVATE_LNBOOK

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
# NOTE: We use the dotted name for some commands
# ie. ghp-import -c $(GIT_REPO_NAME) in make push-docs
GIT_REPO_NAME							:= $(subst -,.,$(PROJECT_NAME))
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

PLAYGROUND_DOCKER=$(wildcard sources/playground/docker)
# PLAYGROUND_DOCKER=$(sources/playground/docker)
export PLAYGROUND_DOCKER
# $(if $(filter $(PLAYGROUND_DOCKER) ,$(wildcard ~/*)), the expected file exists)
PLAYGROUND_DOCS:=$(wildcard $(PLAYGROUND_DOCKER)/docs)
# PLAYGROUND_DOCS=$($(PLAYGROUND_DOCKER)/docs)
export PLAYGROUND_DOCS

ELLIPTIC_DOCKER=$(wildcard sources/elliptic)
export ELLIPTIC_DOCKER

PYTHON_BOOK=$(wildcard sources/books/public/python-book)
export PYTHON_BOOK


export

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
	# NOTE: 2 hashes are detected as 1st column output with color
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
	@echo '        - PRIVATE=${PRIVATE}'
	@echo '        - PRIVATE_BITCOINBOOK=${PRIVATE_BITCOINBOOK}'
	@echo '        - PRIVATE_LNBOOK=${PRIVATE_LNBOOK}'
	@echo '        - PLAYGROUND_DOCKER=${PLAYGROUND_DOCKER}'
	@echo '        - PLAYGROUND_DOCS=${PLAYGROUND_DOCS}'
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
	# disable until playground initialize fixed
	# test ./sources/playground/docker/scripts/initialize && ./sources/playground/docker/scripts/initialize || echo "Try: `make resources`"
init: initialize## 	init
	python3 -m pip install -r sources/requirements.txt

docs:## 	make docs private=true to include books
ifneq ($(private),true)
	$(MAKE) clean-books
else

	PRIVATE_LNBOOK01=books/private/lnbook/01_introduction.html
	PRIVATE_LNBOOK02=books/private/lnbook/02_getting_started.html
	export

	$(MAKE) serve
endif


run: docs shell
	$(NOHUP) $(DOCKER_COMPOSE) $(VERBOSE) up &



.PHONY: clean-resources clean sources resources
clean-sources: 	clean sources
clean:## 	clean
	rm -rf sources/playground/docker
	rm -rf sources/books/bitcoinbook
	rm -rf sources/books/lnbook
	rm -rf sources/books/python
	rm -rf sources/qt/webengine
	rm -rf sources/elliptic

.SILENT:
sources: resources## 	sources
resources:
	$(MAKE) playground
	$(MAKE) qt-webengine
	$(MAKE) books
	$(MAKE) elliptic

.PHONY: playground $(PLAYGROUND_DOCKER)
playground: | $(PLAYGROUND_DOCKER)## 	clone plebnet-playground-docker
	# echo test1 $(PLAYGROUND_DOCKER)
	# echo test1 $(PLAYGROUND_DOCS)
ifeq ($(PLAYGROUND_DOCKER),)
	git clone --progress --verbose --depth 1 -b master https://github.com/PLEBNET-PLAYGROUND/plebnet-playground-docker.git sources/playground/docker || true
endif

$(PLAYGROUND_DOCKER):
	@echo "sources/playground/docker/docs exists!!"
	# echo test2 $(PLAYGROUND_DOCKER)
	# echo test2 $(PLAYGROUND_DOCS)
	git -C $(PLAYGROUND_DOCKER) reset --hard
	git -C $(PLAYGROUND_DOCKER) pull -f

.PHONY: elliptic $(ELLIPTIC_DOCKER) $(ELLIPTIC_NOTEBOOK)
elliptic: | $(ELLIPTIC_DOCKER)## 	run elliptic docker service on http://localhost:8050

ifeq ($(ELLIPTIC_DOCKER),)
	git clone --progress --verbose --depth 1 -b master \
        https://github.com/timechain-academy/elliptic.git sources/elliptic || true
endif

$(ELLIPTIC_DOCKER):
	@echo "sources/elliptic exists!!"
	git -C $(ELLIPTIC_DOCKER) reset --hard
	git -C $(ELLIPTIC_DOCKER) pull -f

	docker-compose build $(NOCACHE) $(VERBOSE) elliptic
	$(DOCKER_COMPOSE) $(VERBOSE) -p elliptic_$(HOST_UID) run --publish 8050:8050 -d --rm elliptic

	docker-compose build $(NOCACHE) $(VERBOSE) elliptic_notebook
    $(DOCKER_COMPOSE) $(VERBOSE) -p elliptic_notebook_$(HOST_UID) run --publish 8888:8888 -d --rm elliptic_notebook

qt-webengine:## 	qt webengine
	[ ! -d "sources/qt" ] && \
	[ ! -d "sources/qt/webengine" ] && \
	git clone --progress --verbose --depth 1 -b v5.15.5-lts git://code.qt.io/qt/qtwebengine.git sources/qt/webengine || true
	[ ! -d "sources/qt/webengine/src/3rdparty/qtwebengine-chromium" ] && \
	git clone --progress --verbose --depth 1 -b v5.15.2 git://code.qt.io/qt/qtwebengine-chromium.git sources/qt/webengine/src/3rdparty/qtwebengine-chromium || true

clean-books:## 	clean-books
	rm -rf sources/books/private/bitcoinbook
	rm -rf sources/books/private/lnbook
	rm -rf sources/books/*.html
	rm -rf docs/books/private/bitcoinbook
	rm -rf docs/books/private/lnbook

books:mastering-bitcoin mastering-lightning python-book## 	make books private=true
	mkdir -p sources/books/public
	mkdir -p sources/books/private
	touch sources/books/README.md
	touch sources/books/public/README.md
	touch sources/books/private/README.md
	bash -c "if hash brew 2>/dev/null; then echo 'brew installed'; brew install pandoc asciidoc; fi"
	bash -c "if hash apt-get 2>/dev/null; then echo 'apt-get installed'; apt-get install pandoc asciidoc; fi"
	#bash -c 'pandoc -s sources/books/README.md -o sources/books/index.html  --metadata title="" '
ifeq ($(private),true)
	pushd sources/books/private/bitcoinbook > /dev/null; for string in *.asciidoc; do echo "$$string"; done; popd || echo "."
	pushd sources/books/private/bitcoinbook > /dev/null; for string in *.md; do sed 's/asciidoc/html/g' $$string | tee $$string; done; popd || echo "....."
	pushd sources/books/private/bitcoinbook > /dev/null; for string in *.asciidoc; do asciidoctor $$string; done; popd || echo "..."
	pushd sources/books/private/lnbook      > /dev/null; for string in *.asciidoc; do echo "$$string"; done; popd || echo "...."
	pushd sources/books/private/lnbook      > /dev/null; for string in *.md; do sed 's/asciidoc/html/g' $$string | tee $$string; done; popd || echo "....."
	pushd sources/books/private/lnbook      > /dev/null; for string in *.asciidoc; do asciidoctor $$string; done; popd || echo "......"
else
	$(MAKE) clean-books
endif

mastering-bitcoin:## 		included when private=true
ifeq ($(private),true)
	git clone --progress --verbose --depth 1 -b 1653630097/6f13274/77b91b1 https://github.com/randymcmillan/bitcoinbook.git \
		sources/books/private/bitcoinbook || true
else
	rm -rf sources/books/private/bitcoinbook
	rm -rf docs/books/private/bitcoinbook
endif
mastering-lightning:## 		included when private=true
ifeq ($(private),true)
	git clone --progress --verbose --depth 1 https://github.com/lnbook/lnbook.git                                           \
		sources/books/private/lnbook || true
else
	rm -rf sources/books/private/lnbook
	rm -rf docs/books/private/lnbook
endif

python-book: | $(PYTHON_BOOK)## 		excluded when public=false
ifneq ($(public),false)

ifeq ($(PYTHON_BOOK),)
	@echo "cloning python-book"
	git clone --progress --verbose --depth 1 https://github.com/kyclark/tiny_python_projects.git                             \
        sources/books/public/python-book || true
endif

else
	rm -rf sources/books/public/python-book
	rm -rf docs/books/public/python-book
endif

$(PYTHON_BOOK):
	@echo "sources/books/public/python-book exists!!"
	# echo test2 $(PLAYGROUND_DOCKER)
	# echo test2 $(PLAYGROUND_DOCS)
	git -C $(PYTHON_BOOK) reset --hard
	git -C $(PYTHON_BOOK) pull -f








.PHONY: build serve build-readme build-shell shell shell-test
build-readme:## 	build-readme
	#cat sources/git/GET_STARTED.md >  sources/README.md
	cat sources/HEADER.md >  sources/README.md
	#echo '```' >> README.md
	#make help > sources/COMMANDS.md
	#echo '```' >> README.md
	cat sources/FOOTER.md >> sources/README.md
	# bash -c "if hash brew 2>/dev/null; then echo 'brew installed'; brew install pandoc asciidoc; fi"
	# bash -c "if hash apt-get 2>/dev/null; then echo 'apt-get installed'; apt-get install pandoc asciidoc; fi"
	# bash -c 'pandoc -s README.md -o index.html  --metadata title="" '

build-docs: build-readme## 	make build-docs private=true to include books
# DEV NOTES: It is useful to make serve (no private=true) and ensure nav is
# working first - then make serve private=true and test nav with private
	$(MAKE) build-readme
	$(MAKE) sources
	mkdir -p docs
	bash -c "if hash brew 2>/dev/null; then echo 'brew installed'; brew install pandoc asciidoc; fi"
	bash -c "if hash apt-get 2>/dev/null; then echo 'apt-get installed'; apt-get install pandoc asciidoc; fi"
ifeq ($(private),true)
	$(MAKE) books private=$(private)
	pushd sources/books/private/bitcoinbook > /dev/null; for string in *.asciidoc; do echo "$$string"; done; popd || echo "."
	pushd sources/books/private/bitcoinbook > /dev/null; for string in *.md; do sed 's/asciidoc/html/g' $$string | tee $$string; done; popd || echo "....."
	pushd sources/books/private/bitcoinbook > /dev/null; for string in *.asciidoc; do asciidoctor --doctype=book $$string; done; popd || echo "..."
	pushd sources/books/private/lnbook      > /dev/null; for string in *.asciidoc; do echo "$$string"; done; popd || echo "...."
	pushd sources/books/private/lnbook      > /dev/null; for string in *.md; do sed 's/asciidoc/html/g' $$string | tee $$string; done; popd || echo "....."
	pushd sources/books/private/lnbook      > /dev/null; for string in *.asciidoc; do asciidoctor --doctype book $$string; done; popd || echo "......"

	PRIVATE_LNBOOK01=books/private/lnbook/01_introduction.html
	PRIVATE_LNBOOK02=books/private/lnbook/02_getting_started.html
	export

endif
	[ -d sources/playground/docker/docs ]; export PLAYGROUND_DOCS=sources/playground/docker/docs
	mkdocs $(VERBOSE) build --dirty

build-playground:## 	build-playground
	pushd sources/playground/docker && make initialize init build && popd

run-playground:## 	run-playground
	pushd sources/playground/docker && make install && popd

run-playground-cluster:## 	run-playground-cluster
	pushd sources/playground/docker && make install-cluster && popd

serve: build-docs## 	build and serve docs using mkdocs on host (not docker)
	docker stop timechain.academy_docs || true
	docker run -dit --rm --name timechain.academy_docs -p 8080:80 -v "$(PWD)/docs":/usr/local/apache2/htdocs httpd:2.4

build-shell:## 	build the ubuntu docker image
	docker-compose build $(NOCACHE) $(VERBOSE) ${SERVICE_TARGET}

.PHONY: shell
shell: build-shell## 	run the ubuntu docker environment
ifeq ($(CMD_ARGUMENTS),)
	$(DOCKER_COMPOSE) $(VERBOSE) -p $(PROJECT_NAME)_$(HOST_UID) run -it --rm ${SERVICE_TARGET} bash
else
	$(DOCKER_COMPOSE) $(VERBOSE) -p $(PROJECT_NAME)_$(HOST_UID) run -it --rm $(SERVICE_TARGET) bash -c "$(CMD_ARGUMENTS)"
endif

shell-test:## 	shell-test
	docker-compose -p $(PROJECT_NAME)_$(HOST_UID) run --rm ${SERVICE_TARGET} sh -c "curl -fsSL https://raw.githubusercontent.com/timechain-academy/timechain.academy/master/scripts/shell-test"

#shell-network-test:## 	shell-network-test
#	docker-compose -p $(PROJECT_NAME)_$(HOST_UID) run --rm ${SERVICE_TARGET} bash -c "curl -fsSL https://raw.githubusercontent.com/timechain-academy/timechain.academy/master/scripts/shell-network-test"


#######################
.PHONY: clean-docker-images
clean-docker-images:## 	remove orphans & rmi all
	# remove created images
	@$(DOCKER_COMPOSE) -p $(PROJECT_NAME) down --remove-orphans --rmi all 2>/dev/null \
	&& echo 'Image(s) for "$(PROJECT_NAME)" removed.' \
	|| echo 'Image(s) for "$(PROJECT_NAME)" already removed.'
#######################
.PHONY: prune-system
prune-system:## 	docker system prune -af (very destructive!)
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME)_$(HOST_UID) down
	docker system prune -af &
#######################
.PHONY: prune-network
prune-network:## 	remove timechain-academy network
	$(DOCKER_COMPOSE) -p $(PROJECT_NAME)_$(HOST_UID) down
	docker network rm $(PROJECT_NAME)_$(HOST_UID) 2>/dev/null || echo
#######################



push-docs: clean-books ## 	ghp-import to deploy docs folder
	# NOTE: The docs folder becomes the root on the gh-pages branch
	# NOTE: In the github.com pages setting use branch: gh-pages / (root)
	ghp-import -n \
        -m "$(TIME):Deployed by $(GIT_USER_NAME) commit: $(GIT_HASH)" \
        -c $(GIT_REPO_NAME) \
        -p \
        -r origin \
        -b gh-pages \
        docs


push:
	@echo clean-books is being performed....
	$(MAKE) clean-books
	git checkout -b $(TIME)/$(GIT_PREVIOUS_HASH)/$(GIT_HASH)
	git push --set-upstream origin $(TIME)/$(GIT_PREVIOUS_HASH)/$(GIT_HASH)
	#git add docs
	#git commit --no-edit --allow-empty -m "$(TIME)" || echo failed to commit --amend --no-edit
	git push -f origin $(TIME)/$(GIT_PREVIOUS_HASH)/$(GIT_HASH):$(TIME)/$(GIT_PREVIOUS_HASH)/$(GIT_HASH)

push-all: push push-to-master push-docs#push-to-main ## 	push-to-master push-docs
push-to-master:## 	push-to-master
	git push -f  $(GIT_REPO_ORIGIN) $(GIT_BRANCH):master || echo failed to push docs
push-to-main:## 	push-to-main
	git push -f  $(GIT_REPO_ORIGIN) $(GIT_BRANCH):main || echo failed to push docs


config-gpg:## 	add gpg to git signing key
	./scripts/config-gpg.sh

SIGNIN=randymcmillan
export SIGNIN

signin:
#Place a file named GH_TOKEN.txt in your $HOME - create in https://github.com/settings/tokens (Personal access tokens)
	bash -c 'cat ~/GH_TOKEN.txt | docker login ghcr.io -u $(GIT_PROFILE) --password-stdin'
