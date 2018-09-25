#!/bin/sh

for path in .emacs.d .spacemacs.d;
do
    ln -s $(pwd)/${path} ${HOME}/${path}
done

echo "source ~/$(pwd)/.bashrc" >> ~/.bashrc
