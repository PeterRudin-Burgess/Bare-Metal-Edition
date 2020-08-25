#!/bin/bash

function wpdf {
  weasyprint.sh -v -d $1 $1.pdf
}

function gpdf {
  google-chrome-stable --headless --print-to-pdf=$1.pdf $1
}

TPDF=gpdf

if test "x-weasy" = "x$1"; then
TPDF=wpdf
shift
fi

for x in $(find "$1" -name "$2" |sort); do
    $TPDF $x
done

pdftk.pdftk-java $(find "$1" -name "$2.pdf" |sort) cat output "$3"