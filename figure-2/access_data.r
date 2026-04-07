library(Biostrings)

get_ncbi_curated_data(taxa) {
    ncbi_file <- "data/bacteria.16SrRNA.fna"

    curated_vec <- numeric()
    for (taxon in taxa) {
        fasta_summary <- Biostrings::fasta.index(ncbi_file, seqtype = "DNA")
        matching_indexes <- grepl(paste(c(taxon), collapse = "|"), fasta_summary$desc)
        subset_index <- fasta_summary[matching_indexes, ]
        NCBI <- Biostrings::readDNAStringSet(subset_index)
        NCBI <- NCBI[order(Biostrings::width(NCBI))]
        curated_vec <- c(curated_vec, Biostrings::length(NCBI))
    }

    return(curated_vec)
}