#!/bin/bash

mkdir -p download

# Download all PDF pages from the download page
wget --directory-prefix=./download --accept=pdf --mirror --level=0 --no-parent --no-directories http://www.yourhome.gov.au/downloads

# Download the print sample to get nice cover and intro pages
wget --continue --directory-prefix=./download http://canprint.com.au/yourhome/files/assets/common/downloads/publication.pdf

# Generate the document
pdflatex YourHome.tex

# Run it through ghostscript which produces a much smaller document
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=YourHome_`date +%Y-%m-%d`.pdf YourHome.pdf
