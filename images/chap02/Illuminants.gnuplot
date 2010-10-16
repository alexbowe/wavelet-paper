set terminal postscript eps enhanced color "Helvetica" 16
set output "generated/chap02/Illuminants.eps"
set grid
unset ytics
set xlabel "wavelength {/Symbol l} [nm]"
set ylabel "relative spectral power"
set size 1.0,0.5

set xrange [400:700]
set yrange [0:250]

set key 655, 220

plot (x-400)/300 title "", \
    "images/chap02/IlluminantD65.txt" \
        using 1:2:3 title "D65" with lines linetype -1 linewidth 2, \
    "images/chap02/FluorescentIlluminants2.csv" \
        using 1:3:14 title "F2" with lines linetype 7 linewidth 3
