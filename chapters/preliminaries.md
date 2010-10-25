Preliminaries
=============  
This section will discuss previous data structure developments

NOTE: Each of these will require a diagram

Problem Definition
------------------  
 * Find occurence of ...

A naive $O(N)$ algorithm is possible, but this was improved by Knuth et al.
and later Rabin-karp. These utilised auxiliary data structures (count tables).
More recently, someone developed the Suffix Array, another auxiliary data
structure for such queries.

Suffix Array
------------  
First Described by Manber and Myers \cite{Manber90}.

\DefFig{fig:sa-make}{preliminaries/mississippi-sa-sort}{0.65}{Suffix Array
	Construction for the string ``mississipi''. The \texttt{\$} symbol is used
	to represent the end of the string.}

 * Construction see Figure \ref{fig:sa-make}
 * compressed SA

Burrows-Wheeler Transform
-------------------------  
 * Construction see Figure \ref{fig:sa-bwt}

\DefFig{fig:sa-bwt}{preliminaries/mississippi-sa}{0.35}{Suffix Array and
	Burrows-Wheeler Transform for the string ``mississipi''. The \texttt{\$}
	symbol is used to represent the end of the string.}

Backwards Search
----------------  
 * Example
 * Rank query definition

Wavelet Tree
------------  
 * Together, a suffix array + bwt on WT is known as an FM-Index.
 * Provides rank query
 * Binary case - stores bit sequence at each node.
 * Requires rank query at each node
 * best known structure for answering rank queries is RRR

RRR
---  
 * Named after Ramen ramen rao...
 * store bit sequence
 * lookup table
 * compressed
 * 0th order entropy

It was proposed that this could be extended to larger alphabets...

General RRR
-----------  
 * This is what we are implementing

Multiary Wavelet Tree
---------------------
 * Uses General RRR to create a shallower WT

We also implement and test some other variations.

Multiary Wavelet Tree Variations 1 : Uncompressed
-------------------------------------------------
 * Concatenated bitmaps for each symbol
 * rank becomes a count on a range

Multiary Wavelet Tree Variation 2 : Multi-binary RRR
----------------------------------------------------
 * As above, bitmaps are created for each symbol
 * these bitmaps are stored in a binary RRR, as implemented by Francisco Claude.

