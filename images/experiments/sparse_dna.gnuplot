set terminal postscript eps enhanced color "Helvetica" 24
set output "generated/experiments/sparse_dna.eps"

set key outside
set key horizontal right
#set key top right
set key at 17, 120


set tmargin 0
set lmargin 8
set rmargin 2
set bmargin 5

set ylabel "Unique Encounters [ \% ]"
#set ylabel rotate by 0
set ylabel offset 1,0
set xlabel "\nArity and File Size"
#set xlabel offset 0,-5

set size ratio 0.5
set yrange [0:100]
set ytics 20
set grid noxtics ytics
set border 3
set xtics nomirror
set ytics nomirror
set bmargin 0
set tmargin 0

set style histogram clustered
set style histogram clustered gap 1
set style fill solid 0.7
set style fill noborder
set boxwidth 1

#set size 1.0,1.0
#set origin -0.18,-0.15

# COLOURS
perm   = "#9EBCBD"
class  = "#485C58"

# dna, dblp.xml, english, english.ints, sources, proteins
type = "dna"
file = "images/experiments/data/".type

plot newhistogram "25MB",\
     file i 0 u 2:xtic(1) w histograms title "Classes" lc rgb class,\
     "" i 0 u 3 w histograms title "Permutations" lc rgb perm,\
     newhistogram "50MB",\
     "" i 1 u 2:xtic(1) w histograms notitle lc rgb class,\
     "" i 1 u 3 w histograms notitle lc rgb perm,\
     newhistogram "75MB",\
     "" i 2 u 2:xtic(1) w histograms notitle lc rgb class,\
     "" i 2 u 3 w histograms notitle lc rgb perm

