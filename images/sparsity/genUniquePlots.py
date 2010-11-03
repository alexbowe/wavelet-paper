#! /usr/bin/python
import sys, re
from string import Template

with open('unique.gnuplot.template', 'r') as f:
    templates = { #'outfile' : Template('memplot_english_ints_50MB.gnuplot'),
                  'memout'  : Template(f.read())}

fn_regexes = [ r'(?P<type>[\w.]+)' ]
fn_str = '(.*/)?' + '\.'.join(fn_regexes)
fn_re = re.compile(fn_str)

if __name__ == '__main__':
    if len(sys.argv) is not 2:
        usage()
        exit()
    try:
        filename = sys.argv[1]
        
        m = fn_re.match(filename)
        m = m.groupdict()
        
        m['outfile'] = m['type'].replace('.', '_')
        output = templates['memout'].safe_substitute(m)
        print output
        #makePlots(filename)
    
    except Exception as e:
        sys.stderr.write(str(e) + '\n')