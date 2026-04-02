bt_indices_metascope_ncbi <- function(){
  # sequences sourced from:
  # https://www.ncbi.nlm.nih.gov/nuccore/?term=((33175%5BBioProject%5D+OR+33317%5BBioProject%5D))
  message("Using pregenerated ncbi database")
  return(file.path(getwd(), "data", "ncbi", "sequences.fasta"))
}

bt_indices_metascope_silva <- function(){
  # load data from using MetaScope's download function
  # https://rutgers.app.box.com/s/njq1qc9bzawzs3a6513uihxxwgxu9qc5
  ind_dir = file.path(getwd(),"data","silva")
  dir.create(ind_dir)
  taxonomy_name = "all_silva_headers.rds"
  MetaScope::download_accessions(
    ind_dir = ind_dir,
    tmp_dir = file.path(ind_dir, "tmp"),
    remove_tmp_dir = TRUE, 
    NCBI_accessions_database = FALSE,
    silva_taxonomy_database = TRUE,
    silva_taxonomy_name = taxonomy_name
  )
  return(file.path(ind_dir,taxonomy_name))
}

bt_indices_radlib_16S <- function(){
  return(1)
}

bt_indices_radlib_vr <- function(){
  return(1)
}

load_dada2_test_data <- function(){
  # Load DADA2 tutorial test data https://benjjneb.github.io/dada2/tutorial.html
}

load_real_world_test_data <- function(){
  # Load data sources from zenodo https://doi.org/10.5281/zenodo.18944121
}