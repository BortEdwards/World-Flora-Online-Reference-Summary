### Crude script to extract and tally sources ingested into World Flora Online (WFO - http://www.worldfloraonline.org/
### "References" field is not standardized and requires some ugle trimming to best summarize.

library(stringr)
library(dplyr)
library(qdap)

data <- read.csv("classification.txt", sep="\t", header = TRUE) # load data

# clumsy clean-up of references due to various formats
data[[19]] <- str_remove(data$references, "http://www.")
data[[19]] <- str_remove(data$references, "http://")
data[[19]] <- str_remove(data$references, "/nepenthaceae.*")
data[[19]] <- str_remove(data$references, ".org/ipni.*")
data[[19]] <- str_remove(data$references, ".org/MOBOT.*")
data[[19]] <- str_remove(data$references, ".org/solanaceae.*")
data[[19]] <- str_remove(data$references, "theplantlist.org/tpl1.1/record/")
data[[19]] <- str_remove(data$references, "-.*")
data[[19]] <- str_remove(data$references, "/1.1/browse.*")

data %>% count("references")
