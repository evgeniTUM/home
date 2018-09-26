#!/bin/sh

git config user.email evgeniTUM@user.noreply.github.com

for path in .emacs.d .spacemacs.d;
do
    ln -s $(pwd)/${path} ${HOME}
done

echo "source $(pwd)/.bashrc" >> ~/.bashrc
