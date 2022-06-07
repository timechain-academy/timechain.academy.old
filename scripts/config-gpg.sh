#!/usr/bin/env bash
config-gpg() {

    gpg --list-secret-keys --keyid-format LONG
    read -p "Config gpg signing key? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
    read -p 'ENTER your GPG Signing Key: ' GPG_SIGNING_KEY
    #git config --global user.signingkey $GPG_SIGNING_KEY
    git config --global user.signingkey 97966C06BB06757B
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
config-gpg
