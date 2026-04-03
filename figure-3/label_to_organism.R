# These are scripts to convert accessions/other ids to organism names

ncbi_accessions_to_organism <- function(acc_counts_table){
  # Map access to organism in fasta headers
  file_path <- system.file("extdata", pasteo(getwd(), "data", "ncbi", "sequence.fasta"), package = "RADalign")
  lines <- readLines(file_path)
  
  #get all headers from RADlib
  index <- Biostrings::fasta.index(file_path, seqtype = "DNA")
  headers <- index[["desc"]]
  
  
  name_counts_table <-
  return(name_counts_table)
}

silva_accessions_to_organism <- function(acc_counts_table){
  # Get 7
  name_counts_table <- character(length(acc_counts_table))
  index = 1
  for(name in acc_counts_table){
    parts <- strsplit(name, split = ";")[[1]]
    formatted_name <- paste(parts[-c(1:6)], collapse=" ")
    name_counts_table[index] <- formatted_name
    index = index + 1
  }
  return(name_counts_table)
}
