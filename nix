#!/bin/bash
nix-env -iA nixpkgs.neovim nixpkgs.boot nixpkgs.python37Packages.pynvim \
            nixpkgs.ripgrep nixpkgs.tmux nixpkgs.fzf nixpkgs.psqlodbc



