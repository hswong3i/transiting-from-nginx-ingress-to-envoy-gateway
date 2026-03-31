#!/bin/bash

set -euxo pipefail

while true
do
    inotifywait -e modify index.md || true
    pandoc -t gfm -f gfm --wrap preserve -o index.md index.md
    pandoc -t revealjs -s -o index.html --metadata-file index.yaml index.md
    pandoc -t beamer -s --toc --pdf-engine=xelatex -o index.pdf --metadata-file index.yaml index.md
done
