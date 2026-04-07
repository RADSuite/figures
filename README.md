This repository contains the figures generated for the manuscript publication of RADSuite.

# Instructions on generating figure 1
Because figure 1 contains no numerical data, it was created manually using the draw.io
free software. A copy of the figure has been included here for completeness.

# Instructions on generating figure 2

First, clone this repository to your device.

## Dependencies
Figure 2 has three package dependencies: Biostrings, tidyverse, and here. If any 
of these dependencies are not installed, run the corresponding line in the R 
command line to install them:

### Biostrings
    BiocManager::install("Biostrings")
    If BiocManager is not installed, run: 
    install.packages("BiocManager")
### tidyverse
    install.packages("tidyverse")
### here 
    install.packages("here")

After all dependencies have been installed, figure 2 can be generated simply by running
the rscript "create_figure_2.r".
