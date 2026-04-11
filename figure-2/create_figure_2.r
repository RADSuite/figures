library(tidyverse)

i_am("figure-2/create_figure_2.r")

target_taxa <- c(
    "Bacillus cereus", "Bacillus anthracis", "Bacteroides fragilis", 
    "Escherichia coli", "Enterococcus faecalis"
)

curated_vec <- get_ncbi_curated_data(target_taxa)
RADlib_vec <- get_RADlib_data(target_taxa)

data <- data.frame(
    taxa = target_taxa,
    curated = curated_vec,
    RADlib = RADlib_vec
)

figure2 <- as_tibble(data) %>%
    pivot_longer(cols = -taxa, names_to = "category", values_to = "count") %>%
    mutate(category = factor(category, levels = c("curated", "RADlib"))) %>%
    ggplot(aes(x = taxa, y = count, fill = category)) +
    geom_bar(stat = "identity", position = position_dodge(preserve = "single")) +
    scale_fill_manual(
        values = c("RADlib" = "#FFC107", "curated" = "#004D40"),
        labels = c("RADlib" = "RADlib References", "curated" = "Curated References")
    ) +
    theme_minimal() +
    labs(
        x = NULL,
        y = "Number of References",
        fill = "Reference Type"
    ) +
    theme(
        legend.key.size = unit(.5, "cm"),
        legend.text = element_text(size = 18),
        legend.title = element_text(size = 22),
        axis.text = element_text(size = 18),
        axis.title = element_text(size = 22)
    )

print(figure2)
