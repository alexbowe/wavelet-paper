set terminal postscript eps enhanced color "Helvetica" 16
set output "generated/experiments/time_english_75MB.eps"

set key right top

set lmargin 12
set rmargin 12
set xlabel "Arity"
set ylabel "Time\n[{/Symbol m}s]"
set ylabel rotate by 0

set xrange [0:5]
set xtics ("2" 1, "4" 2, "8" 3, "16" 4)
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
type = "english"
# 25, 50, 75
size = 75
file = "images/experiments/data/".type.".".size."MB"

# get baseline
set table "temp"
plot [-1:1][0:50] file i 4 u 0:($0==0?(baseline=(($2)*1000)):0)
unset table
base(x) = baseline

# struct:
# 0 - simple
# 1 - M-SDArray
# 2 - AB-RRR
# 3 - M-01RRR
# 4 - FC-RRR
#unset grid
set pointsize 1
plot file i 2 u (log($1)/log(2)):(($2)*1000) title "Generalised RRR" w lp lw 4 lt 1 \
    lc rgb one pt 11 ps 1.2,\
	"" i 3 u (log($1)/log(2)):(($2)*1000) title "Multi-Binary RRR" w lp lw 4 lt 1\
	lc rgb three pt 9 ps 1.2,\
	base(x) title "Claude RRR" lc rgb base lt 2 lw 4
	
#title "Wavelet Tree", base(x) title "fc-rrr" lc rgb base lw 2 lt 2
#i 0 u (log($1)/log(2)):(($2)*1000) title "simple" w lp,\
#"" i 1 u (log($1)/log(2)):(($2)*1000) title "multi-sdarray" w lp lw 4 lt 1\
#lc rgb two pt 5 ps 0.8,\
