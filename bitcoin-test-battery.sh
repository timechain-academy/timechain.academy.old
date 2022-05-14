#!/usr/bin/env bash
BITCOIN_TEST_BATTERY=bitcoin-test-battery
export BITCOIN_TEST_BATTERY
TIME=$(date +%s)
export TIME
#GH_USER=randymcmillan
GH_USER=bitcoin
export GH_USER
#if [ -z "$1" ]; then

RECENT_TAG=$(git ls-remote --tags --refs --sort="v:refname" git://github.com/bitcoin/bitcoin.git | tail -n1 | sed 's/.*\///')
export RECENT_TAG
echo $RECENT_TAG

git ls-remote --tags https://github.com/bitcoin/bitcoin.git v2*

echo
echo Example:
echo ./bitcoin-test-battery.sh $RECENT_TAG
#exit;
#else
RC=$1
#fi
export RC

BITCOIN_CONF1="proxy=127.0.0.1:9050 #If you use Windows, this could possibly be 127.0.0.1:9150 in some cases.\r
listen=1\r
bind=127.0.0.1\r
onlynet=onion\r
\r
connect=ygwcypmb2qiotrp3.onion:8333\r
connect=stcwaszw352kkjis.onion:8333\r
connect=nrrmkgmulpgsbwlt.onion\r
connect=orrxr4kfntzawea3.onion:8333\r
connect=q2fhnnyt5b2ayvce.onion\r
connect=rk4vbyca7xnn3top.onion\r
connect=7ndbwnmgbyupv47f.onion\r
connect=bitcoinzi27kiwf6.onion\r
connect=w4ja2rt6wvqn6rfw.onion:8333\r
connect=6maigxjvcet4pite.onion:8333\r
connect=cehok4dxukhnoopi.onion:8333\r
connect=r6apa5ssujxbwd34.onion:8333\r
connect=ggvnc3v5pmrlsupw.onion:8333\r
connect=er4mwkhxzxgavrvo.onion:8333\r
connect=35yncj7et6k3koqy.onion\r
connect=nesxfmano25clfvn.onion:8333\r
connect=5d5vtnm6xlsqzq7p.onion\r
connect=34jtv2p5pw4e5bp3.onion\r
connect=z5nt64xh4d3vnll2.onion\r
connect=lncmdma3namzrbnx.onion:8333\r
connect=lncmdmx7ezlplcck.onion:8333\r
connect=lncmdmgoddecttey.onion:8444\r
"

make-data-dir(){

    mkdir -p /tmp/$TIME
    export DATA_DIR=/tmp/$TIME
    mkdir -p $DATA_DIR
    echo -e $BITCOIN_CONF1 > $DATA_DIR/bitcoin.conf

}

doIt(){

TIME=$(date +%s)
export TIME
echo $TIME

make-data-dir

pushd $PWD
    git clone https://github.com/$GH_USER/bitcoin $PWD/bitcoin-test-battery-$TIME && \
        pushd $PWD/bitcoin-test-battery-$TIME && \
        git fetch --all && \
        git checkout $RECENT_TAG
    #
    #make -C depends clean-all
    #make -C depends boost_fetched
    make -C depends
    #
    ./contrib/install_db4.sh .
    export BDB_PREFIX=$PWD/db4
    #
    export BINARY_PATH=$(pwd)/src
    export QT_PATH=$(pwd)/src/qt
    export BINARY_PATH=$(pwd)/bin
    export QT_PATH=$BINARY_PATH
    ./autogen.sh
    #./configure --with-gui=yes BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include" && make -j $(nproc --all)
    #./configure BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include" && make -j $(nproc --all)
    ./configure --disable-wallet BDB_LIBS="-L${BDB_PREFIX}/lib -ldb_cxx-4.8" BDB_CFLAGS="-I${BDB_PREFIX}/include "
    make -j $(nproc --all)
    #./autogen.sh && ./configure --with-gui=yes --with-sqlite=yes --without-bdb && make -j $(nproc --all)
    #REF: https://github.com/bitcoin-core/bitcoin-devwiki/wiki/22.0-Release-Candidate-Testing-Guide
    #$BINARY_PATH/bitcoin-cli -datadir=$DATA_DIR [cli args]
    # for starting bitcoin-qt
    #$QT_PATH/bitcoin-qt -datadir=$DATA_DIR [cli args]

    #cd ~/BITCOIN_TEST_BATTERY && ./contrib/install_db4.sh .
    make deploy

}

checkbrew() {

    if hash brew 2>/dev/null; then
        #install brew libs
        brew install wget
        brew install curl
        brew install gcc
        brew install autoconf automake berkeley-db@4 libtool boost miniupnpc pkg-config python qt@5 libevent qrencode tor
        brew install librsvg
        brew install codespell shellcheck
        brew install --build-from-source afl-fuzz
        brew install python@3.8
        brew postinstall python@3.8
    else
        #example - execute script with perl
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
        checkbrew
    fi
    tor &
}
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    checkbrew
    sudo apt install linuxbrew-wrapper
    sudo apt-get -y install autoconf
    sudo apt-get -y install libdb4.8++-dev
    sudo apt-get -y install libboost libevent miniupnpc libdb4.8 qt libqrencode univalue libzmq3
    sudo apt-get -y install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3
    sudo apt-get -y install libevent-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev libboost-thread-dev
    sudo apt-get -y install libminiupnpc-dev
    sudo apt-get -y install libzmq3-dev
    sudo apt-get -y install libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools
    sudo apt-get -y install libqrencode-dev
    sudo apt-get -y install qtcreator

elif [[ "$OSTYPE" == "darwin"* ]]; then
    checkbrew
#    git clone https://github.com/randymcmillan/bitcoin ~/bitcoin
#    cd ~/bitcoin && ./contrib/install_db4.sh .
#    ./autogen.sh && ./configure --disable-wallet --disable-tests --disable-bench && make appbundle
#
#    git clone https://github.com/randymcmillan/gui ~/gui
#    cd ~/gui && ./contrib/install_db4.sh .
#    ./autogen.sh && ./configure --disable-wallet --disable-tests --disable-bench && make appbundle
    doIt

elif [[ "$OSTYPE" == "cygwin" ]]; then
    echo TODO add support for $OSTYPE
    doIt
elif [[ "$OSTYPE" == "msys" ]]; then
    echo TODO add support for $OSTYPE
    doIt
elif [[ "$OSTYPE" == "win32" ]]; then
    echo TODO add support for $OSTYPE
    doIt
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo TODO add support for $OSTYPE
    doIt
else
    echo TODO add support for $OSTYPE
    doIt
fi

doIt
