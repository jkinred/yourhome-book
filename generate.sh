#!/bin/bash

mkdir -p download

# Download all PDF pages from the download page

wget --directory-prefix=./download --accept=pdf --mirror --level=0 --no-parent --no-directories https://web.archive.org/web/20191123111549/https://www.yourhome.gov.au/downloads

# Download the print sample to get nice cover and intro pages
wget --continue --directory-prefix=./download https://web.archive.org/web/20160910093317/http://canprint.com.au/yourhome/files/assets/common/downloads/publication.pdf

# Generate the document
# Some pdf files can be downloaded as damaged, it will give error if it occurs. You should re-download the damaged files manually.
pdflatex YourHome.tex

# Run it through ghostscript which produces a much smaller document
gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=YourHome_`date +%Y-%m-%d`.pdf YourHome.pdf
