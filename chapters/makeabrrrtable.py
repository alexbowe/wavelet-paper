#!/usr/bin/python

import sys, re
from string import Template

header = r'''\begin{table}[h]
\begin{center}
\begin{tabular}{crr}
\toprule
Arity & \multicolumn{1}{c}{Max Total Classes} &
\multicolumn{1}{c}{Max Total Offsets}\\
\midrule'''

footer = r'''\bottomrule
\end{tabular}
\caption{Maximum Total Classes and Offsets possible with a blocksize of 15 for arity 
    values 2, 4, and 8}
\label{tab:maxclass}
\end{center}
\end{table}'''

templates = { #'outfile' : Template('abrrrtable.tex'),
             # 'outrow'  : Template('$arity & $max_class')
            }

max_classes = { }
max_offsets = { }

row_regexes = [ r'(?P<arity>\d+)',
                r'(?P<type>[\w.]+)',
                r'(?P<size>\d+)MB',
                r'(?P<classes>\d+)',
                r'(?P<offsets>\d+)',
                r'(?P<max_classes>\d+)',
                r'(?P<max_offsets>\d+)' ]
row_regex = re.compile('\s'.join(row_regexes))

def outName(d):
    return templates['outfile'].substitute(d)

def outRow(d):
    d['class_percentage'] = 100 * int(d['classes']) \
        /  float(int(d['max_classes']))
    d['offset_percentage'] = 100 * int(d['offsets']) \
        / float(int(d['max_offsets']))
    d['class_percentage'] = round(d['class_percentage'], 2)
    #d['offset_percentage'] = round(d['offset_percentage'], 2)
    return templates['outrow'].substitute(d)

def getRowData(row):
    m = row_regex.match(row)
    return m.groupdict()

def processFile(f):
    for line in f:
        row = getRowData(line)
        max_classes[int(row['arity'])] = row['max_classes']
        max_offsets[int(row['arity'])] = row['max_offsets']
        yield row

if __name__ == '__main__':
    if len(sys.argv) is not 2:
        usage()
        exit()
    try:
        filename = sys.argv[1]
        
        with open(filename, 'r') as f:
            data = list(processFile(f))
        
        print header
        arity = 2
        while arity < 16:
            print str(arity) +' & ' + max_classes[arity] + ' & ' + max_offsets[arity] + r'\\'
            arity *= 2
        print footer
        
        #print header
        #for row in data:
        #    print outRow(row)
        #print footer
    
    except Exception as e:
        sys.stderr.write(str(e) + '\n')
