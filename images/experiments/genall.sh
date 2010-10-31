#! /bin/bash

for file in data/*
do
    outfile=`echo $file | sed -E 's/\./_/g'`
    outfile=`echo $outfile | sed -E 's/^data\///'`
    outfile=$outfile.gnuplot
    ./genMemPlots.py $file > mem_$outfile
    ./genTimePlots.py $file > time_$outfile
    outfile=`echo $outfile | sed -E 's/_[0-9][0-9]MB//'`
    ./genSimpleTimePlots.py $file > simple_time_$outfile
done
