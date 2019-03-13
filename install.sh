#!/bin/sh

git config user.email evgeniTUM@user.noreply.github.com

for path in .emacs.d .spacemacs.d;
do
    ln -s $(pwd)/${path} ${HOME}
done

echo "source $(pwd)/.bashrc" >> ~/.bashrc
mkdir -p ~/.local/share/applications
cp $(pwd)/support/org-protocol.desktop ~/.local/share/applications
