#!/usr/bin/env bash
#ENV VARS
OS=$(uname)
OS_VERSION=$(uname -r)
UNAME_M=$(uname -m)
ARCH=$(uname -m)
export OS
export OS_VERSION
export UNAME_M
export ARCH

report() {
echo OS:
echo "$OS" | awk '{print tolower($0)}'
echo OS_VERSION:
echo "$OS_VERSION" | awk '{print tolower($0)}'
echo UNAME_M:
echo "$UNAME_M" | awk '{print tolower($0)}'
echo ARCH:
echo "$ARCH" | awk '{print tolower($0)}'
echo OSTYPE:
echo "$OSTYPE" | awk '{print tolower($0)}'
}

checkbrew() {

    if hash brew 2>/dev/null; then
        brew install awk git
        brew install --cask keybase
        brew install python@3
        $(PYTHON3) -m pip install -r requirements.txt
        brew install sphinx-doc
        brew link --force sphinx-doc
        echo
        brew install tccutil
        curl -k -o /usr/local/bin/dockutil https://raw.githubusercontent.com/kcrawford/dockutil/master/scripts/dockutil
        chmod a+x /usr/local/bin/dockutil
        dockutil --add '/Applications/Keybase.app' --replacing 'Keybase'

    else
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        checkbrew
    fi
}
checkraspi(){

    echo 'Checking Raspi'
    if [ -e /etc/rpi-issue ]; then
    echo "- Original Installation"
    cat /etc/rpi-issue
    fi
    if [ -e /usr/bin/lsb_release ]; then
    echo "- Current OS"
    lsb_release -irdc
    fi
    echo "- Kernel"
    uname -r
    echo "- Model"
    cat /proc/device-tree/model && echo
    echo "- hostname"
    hostname
    echo "- Firmware"
    /opt/vc/bin/vcgencmd version
}

if [[ "$OSTYPE" == "linux"* ]]; then
    #CHECK APT
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        if hash apt 2>/dev/null; then
            apt install awk
            report
            echo 'Using apt...'
            curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
            sudo apt install ./keybase_amd64.deb
            run_keybase
            sudo apt install  libappindicator1 libdbusmenu-gtk4 libindicator7 indicator-application #python-setuptools #keybase
            $(PYTHON3) -m pip install -r requirements.txt
        fi
    fi
    if [[ "$OSTYPE" == "linux-musl" ]]; then
        if hash apk 2>/dev/null; then
            apk add awk
            report
            echo 'Using apk...'
            apk add keybase-client
        fi
    fi
    if [[ "$OSTYPE" == "linux-arm"* ]]; then
        checkraspi
        if hash apt 2>/dev/null; then
            apt install awk
            report
            echo 'Using apt...'
            echo https://lekstu.ga/posts/keybase-rpi/
        fi
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    $(PYTHON3) -m pip install -r requirements.txt
    checkbrew
elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo TODO add support for $OSTYPE
elif [[ "$OSTYPE" == "msys" ]]; then
    echo TODO add support for $OSTYPE
elif [[ "$OSTYPE" == "win32" ]]; then
    echo TODO add support for $OSTYPE
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo TODO add support for $OSTYPE
else
    echo TODO add support for $OSTYPE
fi

