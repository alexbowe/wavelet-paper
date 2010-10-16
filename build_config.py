"""
This is the place that takes the basic configuration of your LaTeX
build project.
"""

# The name of our main LaTeX source, e. g. 'thesis' or a file 'thesis.tex'.
LATEX_PROJECT = 'thesis'

# Default target.
DEFAULT_TARGET = 'pdf'

# --- Things below should mostly not need touching. ---
# Some rather fixed configurations.

IMAGES_DIRECTORY = 'images'
GENERATED_DIRECTORY = 'generated'
CHAPTER_DIRECTORY = 'chapters'

FILE_EXTENSIONS = {'eps': '.eps',
                   'pdf': '.pdf',
                   'md': '.md',
                   'markdown': '.markdown',
                   'png': '.png',
                   'jpg': '.jpg',
                   'graffle': '.graffle',
                   'gnuplot': '.gnuplot'}

MAKEINDEX_EXTENSIONS = ['.glg', '.glo', '.gls']

