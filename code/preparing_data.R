library(dplyr)
library(writexl)
library(readxl)
library(sqldf)
library(stringr)
library(naniar)
library(tidyr)

setwd(paste0(Sys.getenv("USERPROFILE"),"/OneDrive - CDC/Work/DrKook"))
batchfolder <- paste0(getwd(), "/20230719")
prepare_folder <- paste0(getwd(), "/prepare")
raw_folder <- paste0(batchfolder, "/raw")
result_folder <- paste0(getwd(), "/20231103/SDE/data")

df_prepare <- read_excel(paste0(prepare_folder, "/match2Q.xlsx"))
Sys.setlocale("LC_CTYPE", "en_US.UTF-8")


df_sql = read.table(paste0(prepare_folder,"/recode.txt"),sep='\t',fileEncoding="utf8",quote = "")
df_var_point <- read_excel(paste0(prepare_folder, "/variable_point.xlsx"),sheet="Sheet3")


df01 <- read_excel(paste0(raw_folder, "/01_nurse_army.xlsx"))
df02 <- read_excel(paste0(raw_folder, "/02_physician_army.xlsx"))
df03a <- read_excel(paste0(raw_folder, "/03a_nurse_rama.xlsx"))
df03b <- read_excel(paste0(raw_folder, "/03b_nurse_rama_test.xlsx"))
df04 <- read_excel(paste0(raw_folder, "/04_physician_rama.xlsx"))


for (i in seq_along(df01)) {            # rename columns
  
  colnames(df01)[i] = df_prepare[i,12]
  colnames(df02)[i] = df_prepare[i,12]
  colnames(df03a)[i] = df_prepare[i,12]
  colnames(df04)[i] = df_prepare[i,12]
}

for (i in 1:nrow(df_prepare)) {      # rename columns in test group
  if (is.na(df_prepare[i,9])){
    
  }else{
    colnames(df03b)[df_prepare[[i,1]]] = df_prepare[as.integer(df_prepare[i,9]),12]
  }
}

df01<-df01[ -c(4) ]
df01$file <- '01'
df02<-df02[ -c(4) ]
df02$file <- '02'
df03a<-df03a[ -c(4) ]
df03a$file <- '03a'
df04<-df04[ -c(4) ]
df04$file <- '04'

df03b$file <- '03b'
df03b<-df03b[ -c(1) ]
df03b$Qconsent <- 'ยินยอม'

rm(df_all)

df_all <- bind_rows(df01,df02,df03a,df03b,df04)
df_all <- subset(df_all, !is.na(df_all$Qtype))
df_all <- df_all[,!names(df_all) %in% c("Email_02","DateInv","Q2828","Q2929")]
df_all <- subset(df_all, df_all$Qconsent=='ยินยอม')
df_all$Qyear <- trimws(df_all$Qyear)


df_all <- df_all %>% mutate_if(is.character, funs(na_if(., "-")))

#recode
for (i in 1:nrow(df_sql)) {      # rename columns in test group
  print(df_sql[i,1])
  df_all <- sqldf(c(df_sql[i,1] ,"select * from df_all"))
}



#sys.setlocale(locale = "Thai")
writexl::write_xlsx(df_all,paste0(result_folder,"/data.xlsx"))


