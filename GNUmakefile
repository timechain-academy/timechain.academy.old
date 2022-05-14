SHELL                                   := /bin/bash
PWD 									?= pwd_unknown
TIME 									:= $(shell date +%s)
export TIME

PYTHON                                  := $(shell which python)
export PYTHON
PYTHON2                                 := $(shell which python2)
export PYTHON2
PYTHON3                                 := $(shell which python3)
export PYTHON3

PIP                                     := $(notdir $(shell which pip))
export PIP
PIP2                                    := $(notdir $(shell which pip2))
export PIP2
PIP3                                    := $(notdir $(shell which pip3))
export PIP3

python_version_full := $(wordlist 2,4,$(subst ., ,$(shell python3 --version 2>&1)))
python_version_major := $(word 1,${python_version_full})
python_version_minor := $(word 2,${python_version_full})
python_version_patch := $(word 3,${python_version_full})

my_cmd.python.2 := python2 some_script.py2
my_cmd.python.3 := python3 some_script.py3
my_cmd := ${my_cmd.python.${python_version_major}}

export python_version_major
export python_version_minor
export python_version_patch




ifeq ($(python_version_major),3)
PIP                                    := pip
PIP3                                   := pip
export PIP
export PIP3
endif

ifeq ($(project),)
PROJECT_NAME							:= $(notdir $(PWD))
else
PROJECT_NAME							:= $(project)
endif
export PROJECT_NAME
PROJECTPATH=$(PWD)
export PROJECTPATH
ifeq ($(port),)
PORT									:= 0
else
PORT									:= $(port)
endif
export PORT

#GIT CONFIG
GIT_USER_NAME							:= $(shell git config user.name)
export GIT_USER_NAME
GH_USER_NAME							:= $(shell git config user.name)
#MIRRORS
GH_USER_REPO							:= $(GH_USER_NAME).github.io
GH_USER_SPECIAL_REPO					:= $(GH_USER_NAME)
KB_USER_REPO							:= $(GH_USER_NAME).keybase.pub
#GITHUB RUNNER CONFIGS
ifneq ($(ghuser),)
GH_USER_NAME := $(ghuser)
GH_USER_SPECIAL_REPO := $(ghuser)/$(ghuser)
endif
ifneq ($(kbuser),)
KB_USER_NAME := $(kbuser)
KB_USER_REPO := $(kbuser).keybase.pub
endif
export GIT_USER_NAME
export GH_USER_REPO
export GH_USER_SPECIAL_REPO
export KB_USER_REPO

GIT_USER_EMAIL							:= $(shell git config user.email)
export GIT_USER_EMAIL
GIT_SERVER								:= https://github.com
export GIT_SERVER
GIT_SSH_SERVER							:= git@github.com
export GIT_SSH_SERVER
GIT_PROFILE								:= $(shell git config user.name)
export GIT_PROFILE
GIT_BRANCH								:= $(shell git rev-parse --abbrev-ref HEAD)
export GIT_BRANCH
GIT_HASH								:= $(shell git rev-parse --short HEAD)
export GIT_HASH
GIT_PREVIOUS_HASH						:= $(shell git rev-parse --short master@{1})
export GIT_PREVIOUS_HASH
GIT_REPO_ORIGIN							:= $(shell git remote get-url origin)
export GIT_REPO_ORIGIN
GIT_REPO_NAME							:= $(PROJECT_NAME)
export GIT_REPO_NAME
GIT_REPO_PATH							:= $(HOME)/$(GIT_REPO_NAME)
export GIT_REPO_PATH

BASENAME := $(shell basename -s .git `git config --get remote.origin.url`)
export BASENAME

# Force the user to explicitly select public - public=true
# export KB_PUBLIC=public && make keybase-public
ifeq ($(public),true)
KB_PUBLIC  := public
else
KB_PUBLIC  := private
endif
export KB_PUBLIC

ifeq ($(libs),)
LIBS  := ./libs
else
LIBS  := $(libs)
endif
export LIBS

SPHINXOPTS            =
SPHINXBUILD           = sphinx-build
PAPER                 =
BUILDDIR              = _build
PRIVATE_BUILDDIR      = _private_build

# Internal variables.
PAPEROPT_a4           = -D latex_paper_size=a4
PAPEROPT_letter       = -D latex_paper_size=letter
ALLSPHINXOPTS         = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
PRIVATE_ALLSPHINXOPTS = -d $(PRIVATE_BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) .

.PHONY: -
-: help

.PHONY: init
.ONESHELL:
init:

	@echo ${python_version_full}
	@echo ${python_version_major}
	@echo ${python_version_minor}
	@echo ${python_version_patch}
	@echo ${my_cmd}




	# @echo $(PYTHON)
	# @echo $(PYTHON2)
	# @echo $(PYTHON3)
	# @echo $(PIP)
	# @echo $(PIP2)
	# @echo $(PIP3)
	@echo PATH=$(PATH):/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/bin
	@echo PATH=$(PATH):$(HOME)/Library/Python/3.9/bin
	$(PYTHON3) -m pip install --user --upgrade pip
	$(PYTHON3) -m $(PIP) install --user -r requirements.txt
	cp -R sources/hooks/ .git/hooks/ && chmod +x .git/hooks/*
	./sources/scripts/initialize

.PHONY: help
help:
	@echo ""
	@echo "  make "
	@echo "  make help"
	@echo "  make init"
	@echo "  make docs"
	@echo "  make report"
	@echo "  make push"
	@echo ""

.PHONY: report
report:
	@echo ''
	@echo '  args:'
	@echo '    - TIME=${TIME}'
	@echo '    - BASENAME=${BASENAME}'
	@echo '    - PROJECT_NAME=${PROJECT_NAME}'
	@echo '    - GIT_USER_NAME=${GIT_USER_NAME}'
	@echo '    - GIT_USER_EMAIL=${GIT_USER_EMAIL}'
	@echo '    - GIT_SERVER=${GIT_SERVER}'
	@echo '    - GIT_PROFILE=${GIT_PROFILE}'
	@echo '    - GIT_BRANCH=${GIT_BRANCH}'
	@echo '    - GIT_HASH=${GIT_HASH}'
	@echo '    - GIT_PREVIOUS_HASH=${GIT_PREVIOUS_HASH}'
	@echo '    - GIT_REPO_ORIGIN=${GIT_REPO_ORIGIN}'
	@echo '    - GIT_REPO_NAME=${GIT_REPO_NAME}'
	@echo '    - GIT_REPO_PATH=${GIT_REPO_PATH}'

.PHONY: super
super:
ifneq ($(shell id -u),0)
	@echo switch to superuser
	@echo cd $(TARGET_DIR)
	#sudo ln -s $(PWD) $(TARGET_DIR)
#.ONESHELL:
	sudo -s
endif

.PHONY: git-add
.ONESHELL:
git-add: remove
	@echo git-add

	git config advice.addIgnoredFile false
	# git add *

	git add --ignore-errors GNUmakefile
	git add --ignore-errors README.md
	git add --ignore-errors sources
	git add --ignore-errors index.html
	git add --ignore-errors .gitignore
	git add --ignore-errors .github
	git add --ignore-errors *.sh
	git add --ignore-errors *.yml
	git add --ignore-errors *TIME*

.PHONY: push
.ONESHELL:
push: remove git-add
	@echo push
	git push --set-upstream origin $(GIT_BRANCH)
	bash -c "git commit --allow-empty -m '$(TIME)'"
	bash -c "git push -f $(GIT_REPO_ORIGIN)	+$(GIT_BRANCH):$(GIT_BRANCH)"
	echo github.timechain.academy > CNAME
	git add --ignore-errors CNAME
	bash -c "git commit --allow-empty -m '$(TIME)'"
	bash -c "git push -f git@github.com:timechain-academy/.github.git	+$(GIT_BRANCH):$(GIT_BRANCH)"


.PHONY: branch
.ONESHELL:
branch: remove git-add docs touch-time touch-block-time
	@echo branch

	git add --ignore-errors GNUmakefile TIME GLOBAL .github *.sh *.yml
	git add --ignore-errors .github
	git commit -m 'make branch by $(GIT_USER_NAME) on $(TIME)'
	git branch $(TIME)
	git push -f origin $(TIME)

.PHONY: time-branch
.ONESHELL:
time-branch: remove git-add docs touch-time touch-block-time
	@echo time-branch
	bash -c "git commit -m 'make time-branch by $(GIT_USER_NAME) on time-$(TIME)'"
		git branch time-$(TIME)
		git push -f origin time-$(TIME)

.PHONY: trigger
trigger: remove git-add touch-block-time touch-time touch-global

.PHONY: touch-time
.ONESHELL:
touch-time: remove git-add touch-block-time
	@echo touch-time
	# echo $(TIME) $(shell git rev-parse HEAD) > TIME
	touch TIME
	echo $(TIME) > TIME

.PHONY: touch-global
.ONESHELL:
touch-global: remove git-add touch-block-time
	@echo touch-global
	echo $(TIME) $(shell git rev-parse HEAD) > GLOBAL

.PHONY: touch-block-time
.ONESHELL:
touch-block-time: remove git-add
	@echo touch-block-time
	@echo $(PYTHON3)
	$(PYTHON3) -m $(PIP) install -r requirements.txt
	#$(PYTHON3) ./touch-block-time.py
	BLOCK_TIME=$(shell  ./touch-block-time.py)
	export BLOCK_TIME
	echo $(BLOCK_TIME)

.PHONY: automate
automate: touch-time git-add
	@echo automate
	./.github/workflows/automate.sh

.PHONY: docs
docs: git-add awesome
	#@echo docs
	bash -c "if pgrep MacDown; then pkill MacDown; fi"
	#bash -c "curl https://raw.githubusercontent.com/sindresorhus/awesome/main/readme.md -o ./sources/AWESOME-temp.md"
	bash -c 'cat $(PWD)/sources/HEADER.md                >  $(PWD)/README.md'
	bash -c 'cat $(PWD)/sources/COMMANDS.md              >> $(PWD)/README.md'
	bash -c 'cat $(PWD)/sources/FOOTER.md                >> $(PWD)/README.md'
	#brew install pandoc
	bash -c "if hash pandoc 2>/dev/null; then echo; fi || brew install pandoc"
	#bash -c 'pandoc -s README.md -o index.html  --metadata title="$(GH_USER_SPECIAL_REPO)" '
	bash -c 'pandoc -s README.md -o index.html'
	#bash -c "if hash open 2>/dev/null; then open README.md; fi || echo failed to open README.md"
	git add --ignore-errors sources/*.md
	git add --ignore-errors *.md
	#git ls-files -co --exclude-standard | grep '\.md/$\' | xargs git

.PHONY: awesome
awesome:
	@echo awesome

	bash -c "brew install curl gnu-sed pandoc"

    bash -c "curl https://www.bitcoin.com/bitcoin.pdf -o bitcoin.pdf && rm -f bitcoin.pdf"

	bash -c "curl https://raw.githubusercontent.com/sindresorhus/awesome/main/readme.md -o ./sources/AWESOME-temp.md"
	bash -c "sed '1,136d' ~/randymcmillan/sources/AWESOME-temp.md > ./sources/AWESOME.md"
	bash -c "pandoc -s ~/randymcmillan/sources/AWESOME.md -o ./sources/awesome.html"

.PHONY: remove
remove:
	rm -rf dotfiles
	rm -rf legit

#.PHONY: bitcoin-test-battery
#bitcoin-test-battery:
#	./bitcoin-test-battery.sh v22.0rc3

.PHONY: dotfiles
.ONESHELL:
dotfiles:
	@echo dotfiles

	if [ -f ~/dotfiles/README.md ]; then pushd ~/dotfiles && make vim && popd ; else git clone -b master --depth 1 https://github.com/randymcmillan/dotfiles ~/dotfiles; fi
	cd ~/dotfiles && make init && make vim

.PHONY: bitcoin-test-battery
.ONESHELL:
bitcoin-test-battery:

	if [ -f $(TIME)/README.md ]; then pushd $(TIME) && ./autogen.sh && ./configure && make && popd ; else git clone -b master --depth 3 https://github.com/bitcoin/bitcoin $(TIME) && \
		pushd $(TIME) && ./autogen.sh && ./configure --disable-wallet --disable-bench --disable-tests && make deploy; fi

.PHONY: legit
.ONESHELL:
legit:

	if [ -f ./legit/README.md ]; then make -C dotfiles ; else git clone -b master --depth 1 https://github.com/randymcmillan/legit ./legit; fi
	#TODO make all
	#make all -C legit
	cd legit && ./make-legit.sh

.PHONY: clean
.ONESHELL:
clean: touch-time touch-global
	bash -c "rm -rf $(BUILDDIR)"

.PHONY: serve
.ONESHELL:
serve:
	bash -c "$(PYTHON3) -m http.server $(PORT) -d . &"

.PHONY: failure
failure:
	@-/bin/false && ([ $$? -eq 0 ] && echo "success!") || echo "failure!"
.PHONY: success
success:
	@-/bin/true && ([ $$? -eq 0 ] && echo "success!") || echo "failure!"

