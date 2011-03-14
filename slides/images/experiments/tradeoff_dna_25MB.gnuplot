set terminal postscript eps enhanced color "Helvetica" 16
set output "generated/experiments/tradeoff_dna_25MB.eps"

set key right top

set lmargin 12
set rmargin 12
set xlabel "Size Coefficient"
set ylabel "Time\n[{/Symbol m}s]"
set ylabel rotate by 0

set xrange [0:10]
#set xtics ("2" 1, "4" 2, "8" 3, "16" 4)
#set yrange [0:18]
set grid noxtics ytics
set border 3
set xtics nomirror
set ytics nomirror

# COLOURS
#table = "#9EBCBD" #simple, fc-rrr, etc
#one   = "#3A917F"
#wo   = "#266054"

one = "#8AA4A5"
two  = "#69877C"
three = "#485C58"
base  = "#362E31"

# dna, dblp.xml, english, english.ints, sources, proteins
type = "dna"
# 25, 50, 75
size = 25
file = "images/experiments/data/".type.".".size."MB"

# struct:
# 0 - simple
# 1 - M-SDArray
# 2 - AB-RRR
# 3 - M-01RRR
# 4 - FC-RRR
#unset grid
xoff = 0.15
yoff = 0.5
set pointsize 1
plot file i 2 u ((($3 + $4)/(1024*1024))/size):($2 * 1000) w lp\
     t "Generalised RRR" lc rgb one pt 11 ps 1.2 lt 1,\
     "" i 2 u ((($3 + $4)/(1024*1024))/size + xoff):($2 * 1000 + yoff):1 \
     w labels notitle,\
     "" i 3 u ((($3 + $4)/(1024*1024))/size):($2 * 1000) w lp\
     t "Multi-Binary RRR" lc rgb three pt 9 ps 1.2 lt 1,\
     "" i 3 u ((($3 + $4)/(1024*1024))/size + xoff):($2 * 1000 + yoff):1 \
     w labels notitle,\
     "" i 4 u ((($3 + $4)/(1024*1024))/size):($2 * 1000) w lp\
     t "Claude RRR" lc rgb base lt 0 pt 5,\
     "" i 4 u ((($3 + $4)/(1024*1024))/size + xoff):($2 * 1000 + yoff):1 \
     w labels notitle
	
