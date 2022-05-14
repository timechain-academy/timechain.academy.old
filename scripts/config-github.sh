#!/usr/bin/env bash
config-github() {

    DATE=$(date +%s)

    read -p "Config github? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p 'ENTER your Github.com username: ' GITHUB_USER_NAME
    #read -sp 'Password: ' GITHUB_USER_PASSWORD
    git config --global user.name $GITHUB_USER_NAME
    echo Thankyou $GITHUB_USER_NAME
    read -p 'ENTER your Github.com user email: ' GITHUB_USER_EMAIL
    git config --global user.email $GITHUB_USER_EMAIL
    # git config --global user.email randy.lee.mcmillan@gmail.com
    echo Thankyou $GITHUB_USER_NAME for your email.
    #REF:https://help.github.com/en/github/authenticating-to-github/checking-for-existing-gpg-keys

    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    touch     ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    touch     ~/.ssh/known_hosts
    chmod 644 ~/.ssh/known_hosts
    touch     ~/.ssh/config
    chmod 644 ~/.ssh/config

    mv ~/.ssh/config ~/.ssh/config.bak.$DATE
    echo "Host *" > ~/.ssh/config
    echo "  AddKeysToAgent yes" >> ~/.ssh/config

    ID_RSA=~/.ssh/id_rsa
    GITHUB_RSA=~/.ssh/github_rsa
    ssh-keygen -t rsa -b 4096 -N '' -C $GITHUB_USER_EMAIL -f $ID_RSA
    ssh-keygen -t rsa -b 4096 -N '' -C $GITHUB_USER_EMAIL -f $GITHUB_RSA
    echo "  IdentityFile $GITHUB_RSA" >> ~/.ssh/config


    sudo chmod 600 $ID_RSA
    sudo chmod 644 $ID_RSA.pub
    sudo chmod 600 $GITHUB_RSA
    sudo chmod 644 $GITHUB_RSA.pub

    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ssh-add ~/.ssh/github_rsa
    ssh-add $ID_RSA
    ssh-add $GITHUB_RSA

    echo
    cat ~/.ssh/config
    echo
    ls -lT $GITHUB_RSA.pub
    echo
    echo "Copy these pub keys to your github profile..."
    echo
    echo
    ls -lT $GITHUB_RSA.pub
    echo  "$GITHUB_RSA.pub"
    echo
    cat $GITHUB_RSA.pub
    echo
    echo
    ls -lT $ID_RSA.pub
    echo  "$ID_RSA.pub"
    echo
    cat $DO_RSA.pub
    echo
    echo
    fi
    gpg --list-secret-keys --keyid-format LONG
    read -p "Config gpg signing key? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p 'ENTER your GPG Signing Key: ' GPG_SIGNING_KEY
    git config --global user.signingkey $GPG_SIGNING_KEY
    echo && echo
    echo Your GPG Siging Key has been added...
    echo && echo
    export GPG_TTY=$(tty)
    touch ~/.bash_profile
    if [ -r ~/.bash_profile ]; then echo 'export GPG_TTY=$(tty)' >> ~/.bash_profile; \
    else echo 'export GPG_TTY=$(tty)' >> ~/.profile; fi
    #if [ -r ~/.zshrc ]; then echo 'export GPG_TTY=$(tty)' >> ~/.zshrc; \
    #else echo 'export GPG_TTY=$(tty)' >> ~/.zprofile; fi
    fi
}
eval "$(ssh-agent -s)"
config-github
ssh-add
ssh-add ~/.ssh/id_rsa
ssh-add ~/.ssh/github_rsa
./config-git.sh
git config --global -l
ssh -v git@github.com
