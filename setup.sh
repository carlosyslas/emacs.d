#!/bin/bash

# NOTE: this script is ment to be used by
# https://github.com/carlosyslas/dot-files

brew install emacs

if [[ -d ~/.emacs.d && ! -L ~/.emacs.d ]]; then
    rm -rf ~/.emacs.d
    ln -s $INSTALL_DIR/emacs.d ~/.emacs.d
fi
