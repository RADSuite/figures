library(data.table)
library(ggplot2)
library(ggtext)

generate_figure_4 <- function() {
  # DATA SOURCE INFORMATION
  # Data for this figure was obtained using the RADx interface. Each of the
  # included genera was selected one by one, and the number of species
  # identifiable with the various v-region combinations was recorded.
  # RADx Recommended Regions was determined from the list of possible
  # combinations resulting in the highest number of identifiable species in a
  # genera. Preference was given to combinations requiring less regions, and to
  # combinations with v-regions next to one another (V1/V2 over V1/V3).
  
  # input data
  rows <- list(
    data.table(genus = "Escherichia", "V4" = 2, "V3/V4" = 2, "RADx" = 6, "Total Species" = 6), # "RRR" = "V1"
    data.table(genus = "Faecalibacterium", "V4" = 5, "V3/V4" = 5, "RADx" = 12, "Total Species" = 12), # "RRR" = "V1/V6"
    data.table(genus = "Prevotella", "V4" = 28, "V3/V4" = 30, "RADx" = 32, "Total Species" = 32), # "RRR" = "V1/V9"
    data.table(genus = "Bifidobacterium", "V4" = 38, "V3/V4" = 86, "RADx" = 106, "Total Species" = 106), # "RRR" = "V6-V9"
    data.table(genus = "Bacillus", "V4" = 56, "V3/V4" = 89, "RADx" = 130, "Total Species" = 135), # "RRR" = "V1-V4/V8-V9"
    data.table(genus = "Clostridium", "V4" = 111, "V3/V4" = 121, "RADx" = 172, "Total Species" = 172) # "RRR" = "V1-V4"
  )
  
  # form data table
  data <- rbindlist(rows)
  
  # calculate percentage of total species for each genus
  total_cols <- c("V4", "V3/V4", "RADx", "Total Species")
  for (col in total_cols) {
    data[[col]] <- (data[[col]] / data[["Total Species"]]) * 100
  }
  data[, `Total Species` := NULL]
  
  # reformat for use with ggplot
  formatted <- melt(
    data,
    id.vars = "genus",
    variable.name = "label",
    value.name = "count"
  )
  
  # draw bar plot
  ggplot(formatted, aes(x=reorder(genus, count), y = count, fill = label)) +
    geom_bar(stat = "identity", position = "dodge") +
    scale_fill_manual(
      values = c("V4" = "#76A5AF", "V3/V4" = "#C27BA0", "RADx" = "#93C47D")
    ) +
    theme_minimal() +
    labs(
      x = NULL,
      y = "% of Species Identifiable",
      fill = "Regions Used"
    ) +
    scale_x_discrete(
      labels = function(x) {
        parse(text = paste0("italic('", x, "')"))
      }
    ) +
    theme(
      legend.key.size = unit(.5, "cm"),
      legend.text = element_text(size = 12),
      legend.title = element_text(size = 14),
      axis.text = element_text(size = 12),    
      axis.title = element_text(size = 14),  
    )
}

generate_figure_4()