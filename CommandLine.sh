#!/bin/bash
echo "Number of comics per hero."

echo "we try to find how many comics each hero was in and then export the result in another csvv file named Totalnumber.csv"

awk -F ',' '{print $1}' edges.csv | sort | uniq -c | sort -nr  > Totalnumber.csv

echo "The average number of heroes in comics."

echo "We get the number of rows in the edges.csv so we will have the count of all heroes"

numberrows=$(awk '{count++} END {print count}' edges.csv)

echo "Then we will find the unqiue names in the second column so we will have the count of the comic books"

numbercomics=$(awk -F, 'NR>1{print $1}' edges.csv  |sort -u  |wc -l)

echo "Then wwe will do the math and call out the result"

let x=numberrows y=numbercomics result=x/y

echo $result