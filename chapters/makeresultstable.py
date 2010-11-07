#!/usr/bin/python

import sys, re
from string import Template

header = r'''\begin{table}[h]
\begin{center}
\begin{tabular}{ccccrrr}
\toprule
Structure & Arity & File & Size & Query Time (ms) &
WT Size (bytes) & RRR Table\\ Size (bytes)\\
\midrule'''

footer = r'''\bottomrule
\end{tabular}
\caption{}
\label{tab:results}
\end{center}
\end{table}'''

templates = {
    'outrow'  :
    Template('$structure & $arity & $type & $size & $time & $wt_size & $tab_size')
}

max_classes = { }
max_offsets = { }

row_regexes = [ r'(?P<structure>[\w-]+)',
                r'(?P<arity>\d+)',
                r'(?P<type>[\w.]+)',
                r'(?P<size>\d+MB)',
                r'(?P<time>\d+\.\d+)',
                r'(?P<wt_size>\d+)',
                r'(?P<tab_size>\d+)' ]
row_regex = re.compile('\s'.join(row_regexes))

def outRow(d):
    return templates['outrow'].substitute(d)

def getRowData(row):
    m = row_regex.match(row)
    return m.groupdict()

def processFile(f):
    for line in f:
        row = getRowData(line)
        #max_classes[int(row['arity'])] = row['max_classes']
        #max_offsets[int(row['arity'])] = row['max_offsets']
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
        
        for row in data:
            print outRow(row), r'\\'
        
        print footer
        
        #print header
        #for row in data:
        #    print outRow(row)
        #print footer
    
    except Exception as e:
        sys.stderr.write(str(e) + '\n')
