library(Biostrings)
library(here)

get_ncbi_curated_data <- function(taxa) {
    # load file and get header information
    ncbi_file <- here("figure-2", "data", "bacteria.16SrRNA.fna.gz")
    fasta_summary <- fasta.index(ncbi_file, seqtype = "DNA")

    curated_vec <- numeric()
    for (taxon in taxa) {
        matching_indexes <- grepl(paste(c(taxon), collapse = "|"), fasta_summary$desc)
        subset_index <- fasta_summary[matching_indexes, ]
        NCBI <- readDNAStringSet(subset_index)
        NCBI <- NCBI[order(width(NCBI))]
        curated_vec <- c(curated_vec, length(NCBI))
    }

    return(curated_vec)
}

get_RADlib_data <- function(taxa) {
    RADlib_file <- here("figure-2", "data", "RADlib16S.fa")
    fasta_summary <- fasta.index(RADlib_file, seqtype = "DNA")

    curated_vec <- numeric()
    for (taxon in taxa) {
        matching_indexes <- grepl(paste(c(taxon), collapse = "|"), fasta_summary$desc)
        subset_index <- fasta_summary[matching_indexes, ]
        NCBI <- readDNAStringSet(subset_index)
        NCBI <- NCBI[order(width(NCBI))]
        curated_vec <- c(curated_vec, length(NCBI))
    }

    return(curated_vec)
}

print(get_RADlib_data(c("Bacillus cereus", "Bacteroides fragilis", "Escherichia coli", "Enterococcus faecalis")))
