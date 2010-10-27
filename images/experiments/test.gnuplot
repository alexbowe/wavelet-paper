set terminal postscript eps enhanced color "Helvetica" 16
set output "generated/experiments/test.eps"

#set key outside
unset key
#set key horizontal
#set key above
#left top
#set size square 0.3,0.3

#set lmargin 15
set xlabel "Arity"
set ylabel "Size\nCoefficient"
#set ylabel rotate by 0


set xrange [0:5]
set xtics ("2" 1, "4" 2, "8" 3, "16" 4)
set yrange [0:6]
set ytics 1
set grid noxtics ytics

set style data boxes
set style fill solid 0.7
set style fill noborder
set boxwidth 0.7

# COLOURS
table = "#9EBCBD"
tree  = "#485C58"
base  = "#362E31"

# struct:
# 0 - simple
# 1 - M-SDArray
# 2 - AB-RRR
# 3 - M-01RRR
# 4 - FC-RRR

# dna, dblp.xml, english, english.ints, sources, proteins
type = "dblp.xml"
# 25, 50, 75
size = 75
file = "images/experiments/data/".type.".".size."MB"

base(x) = 0.51

set multiplot title "Graphs of Size Coefficient for Increasing Arity\n". \
                    "[ file: ".type.".".size." ]" layout 1,4

unset ylabel
set title "simple"
struct = 0
plot file i struct u \
	(log($1)/log(2)):((($3 + $4)/(1024*1024))/size) \
	title "RRR Table" lc rgb table, \
 	"" i struct u (log($1)/log(2)):(($3/(1024*1024))/size) lc rgb tree \
	title "Wavelet Tree", base(x) title "fc-rrr" lc rgb base lw 2 lt 2


unset key

set title "multi-sdarray"
struct = 1
plot file i struct u \
	(log($1)/log(2)):((($3 + $4)/(1024*1024))/size) \
	title "RRR Table" lc rgb table, \
 	"" i struct u (log($1)/log(2)):(($3/(1024*1024))/size) lc rgb tree \
	title "Wavelet Tree", base(x) title "fc-rrr" lc rgb base lw 2 lt 2

set title "ab-rrr"
struct = 2
plot file i struct u \
	(log($1)/log(2)):((($3 + $4)/(1024*1024))/size) \
	title "RRR Table" lc rgb table, \
 	"" i struct u (log($1)/log(2)):(($3/(1024*1024))/size) lc rgb tree \
	title "Wavelet Tree", base(x) title "fc-rrr" lc rgb base lw 2 lt 2

set title "multi-fcrrr"
struct = 3
plot file i struct u \
	(log($1)/log(2)):((($3 + $4)/(1024*1024))/size) \
	title "RRR Table" lc rgb table, \
 	"" i struct u (log($1)/log(2)):(($3/(1024*1024))/size) lc rgb tree \
	title "Wavelet Tree", base(x) title "fc-rrr" lc rgb base lw 2 lt 2

unset multiplot