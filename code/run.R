rmarkdown::render("code/sdelearn.Rmd", 
                  output_format = "word_document", 
                  output_file = paste0("sdelearn", format(Sys.Date(), "%Y%m%d"), ".docx"), 
                  output_dir = "output")