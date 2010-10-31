#!/usr/bin/python

import sys, re
from string import Template

header = r'''\begin{table}[h]
\begin{center}
\begin{tabular}{crrrrrr}
\toprule
 & \multicolumn{2}{c}{Arity 2} & \multicolumn{2}{c}{Arity 4} & \multicolumn{2}{c}{Arity 8} \\
\cmidrule(r){2-7}
 & \multicolumn{1}{c}{Class \%} & \multicolumn{1}{c}{Perm. \%}
 & \multicolumn{1}{c}{Class \%} & \multicolumn{1}{c}{Perm. \%}
 & \multicolumn{1}{c}{Class \%} & \multicolumn{1}{c}{Perm. \%}\\
\midrule'''

footer = r'''\bottomrule
\end{tabular}
\caption{}
\label{tab:sparsity}
\end{center}
\end{table}'''

templates = { #'outfile' : Template('abrrrtable.tex'),
              #'outrow'  : Template('$arity $class_percentage $offset_percentage')
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
        
        for row in data:
            filename = row['type']
            
            print  filename + r' \\'
            curr_file = filename
    
        print footer
    
    except Exception as e:
        sys.stderr.write(str(e) + '\n')
