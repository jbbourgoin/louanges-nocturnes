louanges-nocturnes
==================

## Prérequis

* Texlive 2013
* Gregorio

## Macros

### Insertion d'une antienne

\ANTIPHON{}{}{}

### Insertion d'une hymne

\HYMNUS{}{}{}

### Insertion d'un verset

\VERSI{}

### Insertion d'une lecture tirée de l'Ancien Testament

\VETUS{}{}{Lectio 1}

### Insertion d'une lecture tirée du Nouveau Testament

\NOVUM{}{}{}{Lectio 3}

### Insertion d'une lecture

\LECTIO{}{}{}

### Insertion d'une oraison

\ORATIO{}{}

### Sections personnalisées :

Afin d'inclure les sections dans la table des matières sans utiliser le numérotage automatique :

\chapter -> \CHAPITRE
\section -> \SECTION
\subsection -> \SUBSECTION

## Modèle type pour le dimanche

  \SECTION{}

  \dominelabiamea

  \ANTIPHON{}{}{}

  \begin{quote}\emph{Venite, exultemus Domino ...}\end{quote}

  \HYMNUS{}{}{}

  \begin{quote}\emph{Antiennes et psaumes au psautier selon la saison}\end{quote}

  \VERSI{\exsionspecies}

  \paternoster

  \VERSI{\iubeillenos}

  \VETUS{}{}{Lectio 1}
  \VERSI{}

  \VERSI{\iubedivinum}

  \VETUS[3]{}{}{}{Lectio 2}
  \VERSI{}

  \VERSI{\iubeevangelica}

  \NOVUM{}{}{}{Lectio 3}
  \LECTIO{}{}{}
  \VERSI{}

  \ORATIO{}{}

  \conclusio