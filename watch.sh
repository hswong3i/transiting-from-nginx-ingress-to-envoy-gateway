#!/bin/bash

set -euxo pipefail

_PANDOC="sudo -E podman run -ti --rm -v $PWD:$PWD -w $PWD pandoc/extra:latest-ubuntu"

while true
do
    inotifywait -e modify index.md || true
    $_PANDOC -t gfm -f gfm --wrap preserve -o index.md index.md
    $_PANDOC -t revealjs -s -o index.html --metadata-file index.yaml index.md
    #$_PANDOC -t beamer -s --toc --pdf-engine=xelatex -o index.pdf --metadata-file index.yaml index.md
done
