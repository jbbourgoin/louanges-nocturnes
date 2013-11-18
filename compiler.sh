#!/bin/sh

xelatex matines.tex &&
makeindex -s index-perso.ist psa &&
makeindex -s index-perso.ist hym &&
makeindex -s index-perso.ist orat &&
xelatex matines.tex &&
rm ./*.aux ./*.idx ./*.ilg ./*.ind ./*.out ./*.toc ./*.dvi ./psautiers/*.aux
