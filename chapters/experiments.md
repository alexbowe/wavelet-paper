Experiments
===========

1000 random rank queries $rank(c, i)$ were generated, with $i elementof [0, N-1]$ and $c elementof SIGMA$.

We used Francisco Claude's
implementation as a base-line. We used the same default block-size and
super-block-size as Claude.

The experiments were run on Mac OS X Snow Leopard with a 2.4 GHz Intel Core 2
Duo processor, and 4GB 1067 MHz DDR3 RAM.

The data set is described below.

Data
----
 * Pizza&Chili, sources, english, dna, protein, xml
 * 25, 50, 75
 * in the case of the english corpus, we also took the word-based integer
   mapping.
 * Then took the BWT transform of each of these.
 * Hosted on http://bwt-corpus.s3.amazonaws.com/list.html
 * Reconstructable using http://github.com/alexbowe/bwt-corpus
 * TABLE OF SIGMA VALUES
