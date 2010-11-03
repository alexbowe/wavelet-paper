set terminal postscript eps enhanced color "Helvetica" 16
set output "generated/experiments/unique_sources.eps"

#set key outside
#set key horizontal right
set key top left 
#set key nobox

set lmargin 15
set rmargin 15
set bmargin 0
set tmargin 0
set ylabel "Unique\nEncounters\n(millions)"
set ylabel rotate by 0
set ylabel offset 0, 1
set xlabel "\nArity and File Size"
#set xlabel offset 0,-5

set size ratio 0.8
set yrange [0:9]
set ytics 1
set grid noxtics ytics
set border 3
set xtics nomirror
set ytics nomirror

set style histogram clustered
set style histogram clustered gap 1
set style fill solid 0.7
set style fill noborder
set boxwidth 0.9

#set size 1.0,1.0
#set origin -0.18,-0.15

# COLOURS
perm   = "#9EBCBD"
class  = "#485C58"

# dna, dblp.xml, english, english.ints, sources, proteins
type = "sources"
file = "images/experiments/data/".type

plot newhistogram "25MB",\
     file i 0 u ($4/1e6):xtic(1) w histograms title "Classes" lc rgb class,\
     "" i 0 u ($5/1e6) w histograms title "Permutations" lc rgb perm,\
     newhistogram "50MB",\
     "" i 1 u ($4/1e6):xtic(1) w histograms notitle lc rgb class,\
     "" i 1 u ($5/1e6) w histograms notitle lc rgb perm,\
     newhistogram "75MB",\
     "" i 2 u ($4/1e6):xtic(1) w histograms notitle lc rgb class,\
     "" i 2 u ($5/1e6) w histograms notitle lc rgb perm

