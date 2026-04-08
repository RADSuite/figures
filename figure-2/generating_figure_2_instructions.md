# Instructions on generating figure 2

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
