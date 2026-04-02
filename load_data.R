bt_indices_metascope_ncbi <- function(){
  # sequences sourced from:
  # https://www.ncbi.nlm.nih.gov/nuccore/?term=((33175%5BBioProject%5D+OR+33317%5BBioProject%5D))
  message("Using pregenerated ncbi database")
  ncbi_data_dir <- file.path(getwd(), "data", "ncbi")
  ncbi_bowtie_dir <- file.path(ncbi_data_dir, "indices")
  return(ncbi_bowtie_dir)
}

bt_indices_metascope_silva <- function(){
  # load data from using MetaScope's download function
  # https://rutgers.app.box.com/s/njq1qc9bzawzs3a6513uihxxwgxu9qc5
  silva_dir = file.path(getwd(),"data","silva")
  silva_bowtie_dir <- file.path(silva_dir, "indices")
  return(silva_bowtie_dir)
}

bt_indices_radlib_16S <- function(){
  rad_data_dir <- file.path(getwd(), "data", "rad")
  rad16s_bowtie_dir <- file.path(rad_data_dir, "16s-indices")
  rad16s_data_dir <- file.path(rad_data_dir, "16s")
  dir.create(rad16s_bowtie_dir)
  mk_bowtie_index(
    ref_dir = rad16s_data_dir,
    lib_dir = rad16s_bowtie_dir,
    lib_name = "indices",
    overwrite = TRUE
  )
  return(rad16s_bowtie_dir)
}

bt_indices_radlib_vr <- function(){
  rad_data_dir <- file.path(getwd(), "data", "rad")
  radvr_bowtie_dir <- file.path(rad_data_dir, "vr-indices")
  radvr_data_dir <- file.path(rad_data_dir, "vr")
  dir.create(radvr_bowtie_dir)
  mk_bowtie_index(
    ref_dir = radvr_data_dir,
    lib_dir = radvr_bowtie_dir,
    lib_name = "target",
    overwrite = TRUE
  )
  return(radvr_bowtie_dir)
}

load_dada2_test_data <- function(){
  # Load DADA2 tutorial test data https://benjjneb.github.io/dada2/tutorial.html
  dada2_fastq_dir <- file.path(getwd(), "data", "test-data", "MiSeq_SOP")
  return(dada2_fastq_dir)
}

load_real_world_test_data <- function(){
  # Load data sources from zenodo https://doi.org/10.5281/zenodo.18944121
  v3v4_fastq_dir <- file.path(getwd(), "data", "test-data", "raw_fastq")
  return(v3v4_fastq_dir)
}