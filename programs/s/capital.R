# capital
# Mariko Ohtsuka
# 2019/11/6 created
kTarget_date_start <- as.Date("2000/1/1")
kTarget_date_end <- as.Date("2018/12/31")
kSubjid_colname <- "症例登録番号"
kTarget2_colnames <- c("末梢性感覚ニューロパチー", "白血球減少", "好中球数減少", "貧血", "血小板減少",
                       "発熱性好中球減少", "疲労", "筋肉痛", "関節痛", "四肢浮腫")
kTarget1_colnames <- c("シート名英数字別名", "作成日", "登録コード", kSubjid_colname, kTarget2_colnames)
rawdata_path <- "/Volumes/Stat/Trials/NMC/CAPITAL/tools/document/input"
file_list <- list.files(rawdata_path)
target_idx <- grep("^CAPITAL_C[1-9][0-9]*_[a|b]", file_list)
df_worst_gradeoutput_1a <- NULL
df_worst_gradeoutput_1b <- NULL
df_other <- NULL
for (i in 1:length(target_idx)){
  idx <- target_idx[i]
  temp_df <- read.csv(paste0(rawdata_path, "/", file_list[idx]), fileEncoding="cp932", stringsAsFactors=F)
  colnames(temp_df) <- gsub("^好中球減少$", "好中球数減少", colnames(temp_df))
  if (!is.na(kTarget_date_start)){
    temp_df <- subset(temp_df, 作成日 >= kTarget_date_start)
  }
  if (!is.na(kTarget_date_end)){
    temp_df <- subset(temp_df, 作成日 <= kTarget_date_end)
  }
  temp_df <- temp_df[ , kTarget1_colnames]
  temp_sheet_name <- gsub("_[0-9]{6}_[0-9]{4}.csv", "", file_list[idx])
  temp_group <- substr(temp_sheet_name, nchar(temp_sheet_name), nchar(temp_sheet_name))
  switch (temp_group,
    "a" = df_worst_gradeoutput_1a <- rbind(df_worst_gradeoutput_1a, temp_df),
    "b" = df_worst_gradeoutput_1b <- rbind(df_worst_gradeoutput_1b, temp_df),
    df_other <- rbind(df_other, temp_df)
  )
}
# ②Worst_Gradeoutput_2a.csv／Worst_Gradeoutput_2b.csv（症例番号毎に各有害事象の最悪Gradeを算出、症例番号で降順に並べて一覧にする）
#' @title ReturnGradeMaximumValue
#' @description Get the worst grade ae for each registration id and save it in a data frame and return it
#' @param df : Input data frame
#' @param target_colname : Ae column name
#' @return Registration id and ae grade data frame
ReturnGradeMaximumValue <- function(df, target_colname){
  temp_df <- df[ ,c(kSubjid_colname, target_colname)]
  temp_term_grade <- do.call(rbind, str_split(temp_df[ , target_colname], "-"))
  temp_df$grade <- as.numeric(temp_term_grade[ , 2])
  temp_max <- tapply(temp_df$grade, temp_df$症例登録番号, max)
  res_df <- data.frame(names(temp_max), temp_max)
  colnames(res_df) <- c(kSubjid_colname, target_colname)
  return(res_df)
}
#' @title CreateIdDataFrame
#' @description Create and return a data frame for the column with only the registration id
#' @param df : Input data frame
#' @return a data frame for the column with only the registration id
CreateIdDataFrame <- function(df){
  return(unique(df[ , kSubjid_colname, drop=F]))
}
target2_df_list <- list(df_worst_gradeoutput_1a, df_worst_gradeoutput_1b)
df_target2_output_names <- c("df_a", "df_b")
for (i in 1:length(target2_df_list)){
  df_subjid <- CreateIdDataFrame(target2_df_list[[i]])
  for (j in 1:length(kTarget2_colnames)){
    temp_df <- ReturnGradeMaximumValue(target2_df_list[[i]], kTarget2_colnames[j])
    df_subjid <- merge(df_subjid, temp_df, kSubjid_colname)
  }
  assign(df_target2_output_names[i], df_subjid)
}


# 　①Worst_Gradeoutput_1a.csv／Worst_Gradeoutput_1b.csv（全ファイルをA群/B群でそれぞれ一覧にした結果）
