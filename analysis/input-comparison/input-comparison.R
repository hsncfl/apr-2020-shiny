
rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run.
# This is not called by knitr, because it's above the first chunk.
cat("\f") # clear console when working in RStudio

# ---- load-packages --------------------------------------------------
# Attach these packages so their functions don't need to be qualified: http://r-pkgs.had.co.nz/namespace.html#search-path
library(magrittr) # enables piping : %>%
library(dplyr)    # data wrangling
library(ggplot2)  # graphs
library(tidyr)    # data tidying

# ---- load-sources ---------------------------------------------------
# Call `base::source()` on any repo file that defines functions needed below.
# source("./scripts/common-functions.R") # used in multiple reports
# source("./scripts/graphing/graph-presets.R") # fonts, colors, themes

# ---- declare-globals --------------------------

# ---- load-data -------------------------------
# function to load the questions from each source
input_report_data <- function(path_folder){
  # path_folder = "./data-unshared/raw/CSV-APR_2019"
  # path_folder = "./data-unshared/raw/Sample-APR"

  path_files <- list.files(path_folder, full.names = T) %>% sort()
  dto <- list()
  for(item_i in seq_along(path_files)){
    # item_i <- 1
    item_path <- path_files[item_i]
    item_name <- item_path %>% basename() %>% stringr::str_replace(".csv","") %>% tolower()
    dto[[item_name]] <- read.csv(item_path,  header=TRUE,stringsAsFactors = FALSE)
  }
  return(dto)
}
# load both sources.
allQuestions_old <- input_report_data("./data-unshared/raw/Sample-APR")
allQuestions_new <- input_report_data("./data-unshared/raw/CSV-APR_2019")

names(all)

#
# inspect individual questions
focal_name <- "q12a"
print(focal_name)
View(allQuestions_old[[focal_name]]); View(allQuestions_new[[focal_name]])

# ---- q11a -------------------

  plot_ly(x=c("  Under 5"," 5-12","13-17","18-24","25-34","35-44","45-54","55-61","62+"),
          # y=allQuestions_old[["q11"]]$Total[1:9],
          y=allQuestions_new[["q11"]]$Total[1:9],
          name="Age Distribution",type='bar')%>%
    layout(xaxis = list(title = "Age Range"),
           yaxis = list(title ="Client Count"))

# ---- q12a -------------------
plot_ly(x=c(" White", " Black", "Asian", "Am. Indian","NHPI","Multiple","DK/R","Missing"),
        # y=allQuestions_old[["q12a"]]$Total[1:8],
        y=allQuestions_new[["q12a"]]$Total[1:8],
        name='Race ',type='bar')%>%
  layout(xaxis = list(title = "Race"),
         yaxis = list(title ="Client Count"))


# ---- q-list -------------
  # Comment out the questions that are breaking input, may need to add back in
  # with an error checking function
  # q19a3=read.csv("Q19a3.csv",header=TRUE,stringsAsFactors = FALSE),
  # q23a=read.csv("Q23a.csv",header=TRUE,stringsAsFactors = FALSE),
  # q23b=read.csv("Q23b.csv",header=TRUE,stringsAsFactors = FALSE),
folder_path <- "./data-unshared/raw/Sample-APR/"

  q4a=read.csv   (paste0(folder_path,"Q4a.csv"),  header=TRUE,stringsAsFactors = FALSE)
  # q4a=read.csv   (paste0(folder_path,"Q4a.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q5a=read.csv   (paste0(folder_path,"Q5a.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q6a=read.csv   (paste0(folder_path,"Q6a.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q6b=read.csv   (paste0(folder_path,"Q6b.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q6c=read.csv   (paste0(folder_path,"Q6c.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q6d=read.csv   (paste0(folder_path,"Q6d.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q6e=read.csv   (paste0(folder_path,"Q6e.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q6f=read.csv   (paste0(folder_path,"Q6f.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q7a=read.csv   (paste0(folder_path,"Q7a.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q7b=read.csv   (paste0(folder_path,"Q7b.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q8a=read.csv   (paste0(folder_path,"Q8a.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q8b=read.csv   (paste0(folder_path,"Q8b.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q9a=read.csv   (paste0(folder_path,"Q9a.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q9b=read.csv   (paste0(folder_path,"Q9b.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q10a=read.csv  (paste0(folder_path,"Q10a.csv"), header=TRUE,stringsAsFactors = FALSE)
  q10b=read.csv  (paste0(folder_path,"Q10b.csv"), header=TRUE,stringsAsFactors = FALSE)
  q10c=read.csv  (paste0(folder_path,"Q10c.csv"), header=TRUE,stringsAsFactors = FALSE)
  q11=read.csv   (paste0(folder_path,"Q11.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q12a=read.csv  (paste0(folder_path,"Q12a.csv"), header=TRUE,stringsAsFactors = FALSE)
  q12b=read.csv  (paste0(folder_path,"Q12b.csv"), header=TRUE,stringsAsFactors = FALSE)
  q13a1=read.csv (paste0(folder_path,"Q13a1.csv"),header=TRUE,stringsAsFactors = FALSE)
  q13a2=read.csv (paste0(folder_path,"Q13a2.csv"),header=TRUE,stringsAsFactors = FALSE)
  q13b1=read.csv (paste0(folder_path,"Q13b1.csv"),header=TRUE,stringsAsFactors = FALSE)
  q13b2=read.csv (paste0(folder_path,"Q13b2.csv"),header=TRUE,stringsAsFactors = FALSE)
  q13c1=read.csv (paste0(folder_path,"Q13c1.csv"),header=TRUE,stringsAsFactors = FALSE)
  q13c2=read.csv (paste0(folder_path,"Q13c2.csv"),header=TRUE,stringsAsFactors = FALSE)
  q14a=read.csv  (paste0(folder_path,"Q14a.csv"), header=TRUE,stringsAsFactors = FALSE)
  q14b=read.csv  (paste0(folder_path,"Q14b.csv"), header=TRUE,stringsAsFactors = FALSE)
  q15=read.csv   (paste0(folder_path,"Q15.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q16=read.csv   (paste0(folder_path,"Q16.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q17=read.csv   (paste0(folder_path,"Q17.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q18=read.csv   (paste0(folder_path,"Q18.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q19a1=read.csv (paste0(folder_path,"Q19a1.csv"),header=TRUE,stringsAsFactors = FALSE)
  q19a2=read.csv (paste0(folder_path,"Q19a2.csv"),header=TRUE,stringsAsFactors = FALSE)
  q19a3=read.csv (paste0(folder_path,"Q19a3.csv"),header=TRUE,stringsAsFactors = FALSE) # missing in the new
  q20a=read.csv  (paste0(folder_path,"Q20a.csv"), header=TRUE,stringsAsFactors = FALSE)
  q20b=read.csv  (paste0(folder_path,"Q20b.csv"), header=TRUE,stringsAsFactors = FALSE)
  q21=read.csv   (paste0(folder_path,"Q21.csv"),  header=TRUE,stringsAsFactors = FALSE)
  q22a1=read.csv (paste0(folder_path,"Q22a1.csv"),header=TRUE,stringsAsFactors = FALSE)
  q22b=read.csv  (paste0(folder_path,"Q22b.csv"), header=TRUE,stringsAsFactors = FALSE)
  q23a=read.csv  (paste0(folder_path,"Q23a.csv"), header=TRUE,stringsAsFactors = FALSE)# missing in the new
  q23b=read.csv  (paste0(folder_path,"Q23b.csv"), header=TRUE,stringsAsFactors = FALSE)# missing in the new
  q25a=read.csv  (paste0(folder_path,"Q25a.csv"), header=TRUE,stringsAsFactors = FALSE)
  q25b=read.csv  (paste0(folder_path,"Q25b.csv"), header=TRUE,stringsAsFactors = FALSE)
  q25c=read.csv  (paste0(folder_path,"Q25c.csv"), header=TRUE,stringsAsFactors = FALSE)
  q25d=read.csv  (paste0(folder_path,"Q25d.csv"), header=TRUE,stringsAsFactors = FALSE)
  q25e=read.csv  (paste0(folder_path,"Q25e.csv"), header=TRUE,stringsAsFactors = FALSE)
  q25f=read.csv  (paste0(folder_path,"Q25f.csv"), header=TRUE,stringsAsFactors = FALSE)
  q25g=read.csv  (paste0(folder_path,"Q25g.csv"), header=TRUE,stringsAsFactors = FALSE)
  q25h=read.csv  (paste0(folder_path,"Q25h.csv"), header=TRUE,stringsAsFactors = FALSE)
  q25i=read.csv  (paste0(folder_path,"Q25i.csv"), header=TRUE,stringsAsFactors = FALSE)
  q26a=read.csv  (paste0(folder_path,"Q26a.csv"), header=TRUE,stringsAsFactors = FALSE)
  q26b=read.csv  (paste0(folder_path,"Q26b.csv"), header=TRUE,stringsAsFactors = FALSE)
  q26c=read.csv  (paste0(folder_path,"Q26c.csv"), header=TRUE,stringsAsFactors = FALSE)
  q26d=read.csv  (paste0(folder_path,"Q26d.csv"), header=TRUE,stringsAsFactors = FALSE)
  q26e=read.csv  (paste0(folder_path,"Q26e.csv"), header=TRUE,stringsAsFactors = FALSE)
  q26f=read.csv  (paste0(folder_path,"Q26f.csv"), header=TRUE,stringsAsFactors = FALSE)
  q26g=read.csv  (paste0(folder_path,"Q26g.csv"), header=TRUE,stringsAsFactors = FALSE)
  q26h=read.csv  (paste0(folder_path,"Q26h.csv"), header=TRUE,stringsAsFactors = FALSE)
  q27a=read.csv  (paste0(folder_path,"Q27a.csv"), header=TRUE,stringsAsFactors = FALSE)
  q27b=read.csv  (paste0(folder_path,"Q27b.csv"), header=TRUE,stringsAsFactors = FALSE)
  q27c=read.csv  (paste0(folder_path,"Q27c.csv"), header=TRUE,stringsAsFactors = FALSE)
  q27d=read.csv  (paste0(folder_path,"Q27d.csv"), header=TRUE,stringsAsFactors = FALSE)
  q27e=read.csv  (paste0(folder_path,"Q27e.csv"), header=TRUE,stringsAsFactors = FALSE)
  q27f=read.csv  (paste0(folder_path,"Q27f.csv"), header=TRUE,stringsAsFactors = FALSE)