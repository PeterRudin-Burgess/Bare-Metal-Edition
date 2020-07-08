#!/usr/bin/env bash

XDIR=$(cd $(dirname $0)/.. && pwd)
T=$(uuidgen)
TFILE="$XDIR/dist/preview.md.html"

~/bin/md2html.sh $TFILE $XDIR/src/main/markdown/*.md

wkhtmltopdf  -B .6in -L .6in -R .6in -T .6in  $TFILE $XDIR/dist/preview.md.pdf
