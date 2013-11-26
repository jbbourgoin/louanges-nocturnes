#!/bin/sh

xelatex matines.tex &&
makeindex -s index-perso.ist psa &&
makeindex -s index-perso.ist hym &&
makeindex -s index-perso.ist orat &&
xelatex matines.tex &&
mv matines.pdf out/ &&
rm ./*.aux ./*.idx ./*.ilg ./*.ind ./*.out ./*.toc ./*.dvi ./psautiers/*.aux
