library(here)

sces <- 1:128
parts <- 1:10

scenarios <- read.csv(here("R", "scenarios_ext.csv"))

# Check we have the right number of data sets
counts <- rep(0, 1280)
sce_sub <- NULL
for(i in sces){
  for(j in parts){
    fe <- file.exists(here("data","raw","results", paste0("res_", i, "_", j, ".csv")))
    counts[i] <- counts[i] + fe
    if(!fe){
      print(c(i,j))
      sce_sub <- rbind(sce_sub, scenarios[10*(i-1) + j,])
    }
  }
}

#write.csv(sce_sub, "./R/sce_sub.csv", row.names = F)

for(i in sces){
  sce_data <- NULL
  for(j in parts){
    path_to <- here("data","raw","results", paste0("res_", i, "_", j, ".csv"))
    if(file.exists(path_to)){
      df <- read.csv(path_to)
      sce_data <- rbind(sce_data, df)
    }
  }
  sce_data <- as.data.frame(sce_data)
  names(sce_data)[1] <- c("T")
  saveRDS(sce_data, file = here("data", paste0("res_", i, "_full.rds")))
}
