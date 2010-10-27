#! /bin/bash

for file in data/*
do
    outfile=`echo $file | sed -E 's/\./_/g'`
    outfile=`echo $outfile | sed -E 's/^data\///'`
    outfile=mem_$outfile.gnuplot
    ./genMemPlots.py $file > $outfile
done
