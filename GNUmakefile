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

PORT:=8000

.PHONY: - help init build serve push signin git-add
-: help

##help:print help
##	test
##		test
##			test
##				test
##	test:test
##		test:test
##			test:test
##				test:test
##	test:	test
##		test:		test
##			test:			test
##				test:				test
help:
	@sed -n 's/^##//p' ${MAKEFILE_LIST} | column -t -s ':' |  sed -e 's/^/	/'

init:
	python3 -m pip install -r requirements.txt
build:
	mkdocs build
serve: build
	mkdocs serve & open http://127.0.0.1:$(PORT) || open http://127.0.0.1:$(PORT)
	#$(PYTHON3) -m http.server $(PORT) --bind 127.0.0.1 -d $(PWD)/docs > /dev/null 2>&1 || open http://127.0.0.1:$(PORT)

git-add:

push:
	@echo 'push'
	#bash -c "git reset --soft HEAD~1 || echo failed to add docs..."
	#bash -c "git add README.md docker/README.md docker/DOCKER.md *.md docker/*.md || echo failed to add docs..."
	#bash -c "git commit --amend --no-edit --allow-empty -m '$(GIT_HASH)'          || echo failed to commit --amend --no-edit"
	#bash -c "git commit         --no-edit --allow-empty -m '$(GIT_PREVIOUS_HASH)' || echo failed to commit --amend --no-edit"
	bash -c "git push -f --all git@github.com:$(GIT_PROFILE)/$(PROJECT_NAME).git || echo failed to push docs"


SIGNIN=randymcmillan
export SIGNIN

signin:
#Place a file named GH_TOKEN.txt in your $HOME - create in https://github.com/settings/tokens (Personal access tokens)
	bash -c 'cat ~/GH_TOKEN.txt | docker login ghcr.io -u $(GIT_PROFILE) --password-stdin'
