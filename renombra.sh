#!/bin/bash

file=$1

if [ "$2" = "1" ]; then
  h1=`pdftotext $1 - | sed '1q;d'`
  h2=`pdftotext $1 - | sed '2q;d'`
elif [ "$2" = "3" ]; then
  h1=`pdftotext $1 - | sed '3q;d'`
  h2=`pdftotext $1 - | sed '4q;d'`
elif [ "$2" = "5" ]; then
  h1=`pdftotext $1 - | sed '5q;d'`
  h2=`pdftotext $1 - | sed '6q;d'`
else
  h1=`pdftotext $1 - | sed '7q;d'`
  h2=`pdftotext $1 - | sed '8q;d'`
fi

echo "h1: "$h1
echo "h2: "$h2

h3=${h2:0:4}

h1="${h1// /_}"
h2="${h2// /_}"

if [ "$h3" = "http" ]; then
   h2=""
fi

nombre=$h1"_"$h2.pdf

echo $nombre

if [ "$3" = "1" ]; then  
  mv $1 $nombre
fi


