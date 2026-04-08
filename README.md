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

## Set working directory
After all dependencies have been installed, set the working directory to the figures directory:
    setwd("your/path/to/figures")

Now figure 2 can be generated simply by running the rscript "create_figure_2.r".

# Instructions on generating figure 3
First, clone this repository to your device.
## Dependencies
Figure 3 has three package dependencies: data.table, tidyverse, and ggtext. If any
of these dependencies are not installed, run the corresponding line in the R
command line to install them:
### data.table
    install.packages("data.table")
### tidyverse
    install.packages("tidyverse")
### ggtext
    install.packages("ggtext")
After all dependencies have been installed, figure 3 can be generated simply by running
the rscript "create_figure_3.r".
