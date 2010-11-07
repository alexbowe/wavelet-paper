#!/usr/bin/python

import sys, re
from collections import defaultdict
from string import Template

row_text = '$arity $class_percentage $offset_percentage $classes $offsets'
templates = {
            'outfile' : Template('$type'),
            'outrow' : Template(row_text)
            }

row_regexes = [ r'(?P<arity>\d+)',
                r'(?P<type>[\w.]+)',
                r'(?P<size>\d+)MB',
                r'(?P<classes>\d+)',
                r'(?P<offsets>\d+)',
                r'(?P<max_classes>\d+)',
                r'(?P<max_offsets>\d+)' ]
row_regex = re.compile('\s'.join(row_regexes))

types = ['english', 'english.ints', 'sources', 'dna', 'dblp.xml', 'proteins']
sizes = [25, 50, 75]
arities = [2, 4, 8]

def outRow(d):
    d['class_percentage'] = 100 * int(d['classes']) \
        /  float(int(d['max_classes']))
    d['offset_percentage'] = 100 * int(d['offsets']) \
        / float(int(d['max_offsets']))
    return templates['outrow'].substitute(d)

def getRowData(row):
    m = row_regex.match(row)
    return m.groupdict()

def processFile(f):
    for line in f:
        row = getRowData(line)
        yield row

if __name__ == '__main__':
    l = len(sys.argv)
    if (l is not 2) and (l is not 3):
        exit()
    try:
        filename = sys.argv[1]
        output_dir = ''
        if len(sys.argv) > 2:
            output_dir = sys.argv[2]
        
        with open(filename, 'r') as f:
            data = list(processFile(f))
        
        # (type, size, arity)
        d = dict()
        
        for row in data:
            t = row['type']
            s = int(row['size'])
            a = int(row['arity'])
            d[t,s,a] = row
        
        for t in types:
            out_filename = templates['outfile'].substitute(type=t)
            if len(output_dir) > 0:
                out_filename = output_dir + '/' + out_filename
            with open(out_filename, 'w') as f:
                for s in sizes:
                    f.write('# type: {0}, size: {1}\n'.format(t, s))
                    f.write('# arity, class %, offset %\n')
                    for a in [2, 4, 8]:
                        r = d[t,s,a]
                        f.write(outRow(r) + '\n')
                    f.write('\n\n')
            
            
    except Exception as e:
        sys.stderr.write(str(e) + '\n')
