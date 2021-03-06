set terminal postscript eps enhanced color "Helvetica" 16
set output "generated/experiments/simple_time_english_ints.eps"

set key right top

set lmargin 12
set rmargin 12
set xlabel "Arity"
set ylabel "Time\n[ms]"
set ylabel rotate by 0

set xrange [0:5]
set xtics ("2" 1, "4" 2, "8" 3, "16" 4)
set yrange [0:]
set grid noxtics ytics
set border 3
set xtics nomirror
set ytics nomirror

# COLOURS
#table = "#9EBCBD" #simple, fc-rrr, etc
#one   = "#3A917F"
#wo   = "#266054"

one = "#9EBCBD"
two  = "#69877C"
three = "#485C58"
base  = "#362E31"

# dna, dblp.xml, english, english.ints, sources, proteins
type = "english.ints"
# 25, 50, 75
size = 75
file = "images/experiments/data/".type."."

# get baseline
#set table "temp"
#plot [-1:1][0:50] file i 4 u 0:($0==0?(baseline=(($2)):0)
#unset table
#base(x) = baseline

# struct:
# 0 - simple
# 1 - M-SDArray
# 2 - AB-RRR
# 3 - M-01RRR
# 4 - FC-RRR
#unset grid
set pointsize 1
plot file."25MB" i 0 u (log($1)/log(2)):(($2)) title "25MB" w lp lw 4 lt 1 \
	lc rgb three pt 5 ps 1,\
	file."50MB" i 0 u (log($1)/log(2)):(($2)) title "50MB" w lp lw 4 lt 1 \
		lc rgb two pt 9 ps 1.2,\
	file."75MB" i 0 u (log($1)/log(2)):(($2)) title "75MB" w lp lw 4 lt 1 \
		lc rgb one pt 11 ps 1.2
