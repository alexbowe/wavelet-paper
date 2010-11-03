#! /bin/bash

for file in data/*
do
    outfile=`echo $file | sed -E 's/\./_/g'`
    outfile=`echo $outfile | sed -E 's/^data\///'`
    outfile=$outfile.gnuplot
    ./genSparsePlots.py $file > sparse_$outfile
    ./genUniquePlots.py $file > unique_$outfile
done

cp data/* ../experiments/data/

mv *.gnuplot ../experiments/
