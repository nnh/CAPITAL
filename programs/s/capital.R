# capital
# Mariko Ohtsuka
# 2019/11/15 created
# ------ Constants ------
rawdata_path <- "/Volumes/Stat/Trials/NMC/CAPITAL/tools/document/input"
output_path <- "/Users/admin/Documents/GitHub/CAPITAL/output"
kTarget_date_start <- as.Date("2000/1/1")
kTarget_date_end <- as.Date("2020/12/31")
kSubjid_colname <- "症例登録番号"
kAllocation_colname <- "group"
kTarget2_colnames <- c("末梢性感覚ニューロパチー", "白血球減少", "好中球数減少", "貧血", "血小板減少",
                       "発熱性好中球減少", "疲労", "筋肉痛", "関節痛", "四肢浮腫")
kTarget1_colnames <- c("シート名英数字別名", "作成日", "登録コード", kSubjid_colname, kTarget2_colnames)
kOutputList <- c("Worst_Gradeoutput_2a", "Worst_Gradeoutput_2b",
                 "Worst_Gradeoutput_result_a", "Worst_Gradeoutput_result_b",
                 "Worst_Gradeoutput_1a", "Worst_Gradeoutput_1b")
k1a <- as.numeric(which(kOutputList == "Worst_Gradeoutput_1a"))
k1b <- as.numeric(which(kOutputList == "Worst_Gradeoutput_1b"))
k2a <- as.numeric(which(kOutputList == "Worst_Gradeoutput_2a"))
k2b <- as.numeric(which(kOutputList == "Worst_Gradeoutput_2b"))
kResult_a <- as.numeric(which(kOutputList == "Worst_Gradeoutput_result_a"))
kResult_b <- as.numeric(which(kOutputList == "Worst_Gradeoutput_result_b"))
# ------ functions ------
#' @title ReturnGradeMaximumValue
#' @description Get the worst grade(exclude grade5) ae for each registration id and save it in a data frame
#' and return it
#' @param df : Input data frame
#' @param target_colname : Ae column name
#' @return Registration id and ae grade data frame
ReturnGradeMaximumValue <- function(df, target_colname){
  temp_df <- df[ ,c(kSubjid_colname, target_colname)]
  # Split into term and grade
  temp_term_grade <- do.call(rbind, strsplit(temp_df[ , target_colname], "-"))
  temp_df$grade <- ifelse(as.numeric(temp_term_grade[ , 2]) < 5,
                          as.numeric(temp_term_grade[ , 2]),
                          NA)  # grade 5 -> NA
  # Get the maximum Grade value for each case number
  temp_max <- tapply(temp_df$grade, temp_df[ , kSubjid_colname], max)
  res_df <- data.frame(as.numeric(names(temp_max)), temp_max, stringsAsFactors=F)
  colnames(res_df) <- c(kSubjid_colname, target_colname)
  return(res_df)
}
#' @title CreateIdDataFrame
#' @description Create and return a data frame for the column with only the SUBJID
#' @param df : Input data frame
#' @return a data frame for the column with only the SUBJID
CreateIdDataFrame <- function(df){
  return(unique(df[ , kSubjid_colname, drop=F]))
}
#' @title MergeAll
#' @description Merge multiple data frames by SUBJID
#' @param df_list : List the target data frames.
#' @return a data frame
MergeAll <- function(df_list){
  for (i in 1:length(df_list)){
    sortlist <- order(as.numeric(df_list[[i]][ ,kSubjid_colname]))
    temp_df <- df_list[[i]][sortlist, ]
    if (i == 1){
      res_df <- temp_df
    } else {
      res_df <- merge(res_df, temp_df, by=c(kSubjid_colname), all=T)
    }
  }
  return(res_df)
}
#' @title SetAllocation
#' @description Set the Japanese label for the group
#' @param input_df : A data frame
#' @param group : "a" or "b"
#' @return A data frame
SetAllocation <- function(input_df, group){
  if (group == "a"){
    str_allocation = "A群"
  } else {
    str_allocation = "B群"
  }
  output_df <- data.frame(rep(str_allocation, nrow(input_df)))
  colnames(output_df) <- "群"
  output_df <- cbind(output_df, input_df)
  return(output_df)
}
#' @title OutputWorstGradeResult
#' @description Count and percentage for each grade of adverse event
#' @param input_df : A data frame
#' @return A data frame
OutputWorstGradeResult <- function(input_df){
  kGrade3Col <- 5
  kGrade4Col <- 6
  kColnames <- c("", "grade0", "grade1", "grade2", "grade3", "grade4", "grade3-4(%)", "grade4(%)", "合計")
  output_df <- data.frame(kTarget2_colnames, stringsAsFactors=F)
  output_df <- cbind(output_df, data.frame(matrix(rep(0), ncol=length(kColnames) - 1, nrow=nrow(output_df)),
                                           stringsAsFactors=F))
  colnames(output_df) <- kColnames
  # Aggregate by AEterm and grade
  temp_result <- apply(input_df, 2, function(x){ return(tapply(x, x, length)) })
  for (i in 1:length(temp_result)){
    temp_count <- temp_result[[i]]
    # sum
    output_df[i, length(colnames(output_df))] <- sum(temp_count)
    # Aggregate by grade
    for (j in 1:length(temp_count)){
      temp_col <- as.numeric(names(temp_count[j])) + 2
      output_df[i, temp_col] <- temp_count[j]
    }
    # percentage
    grade_3_count <- ifelse(is.na(output_df[i, kGrade3Col]), 0, output_df[i, kGrade3Col])
    grade_4_count <- ifelse(is.na(output_df[i, kGrade4Col]), 0, output_df[i, kGrade4Col])
    output_df[i, length(colnames(output_df)) - 2] <- round((grade_3_count + grade_4_count)
                                                           / output_df[i, length(colnames(output_df))] * 100, digits=1)
    output_df[i, length(colnames(output_df)) - 1] <- round(grade_4_count
                                                           / output_df[i, length(colnames(output_df))] * 100, digits=1)
  }
  return(output_df)
}
# ------ Main processing ------
file_list <- list.files(rawdata_path)
# Only for cycle sheets, ex:"CAPITAL_C1_a....csv"
target_idx <- grep("^CAPITAL_C[1-9][0-9]*_[a|b]", file_list)
target_file_list <- file_list[target_idx]
# Combine cycle sheets
df_all_rbind <- lapply(target_file_list, function(x){
  temp_df <- read.csv(paste0(rawdata_path, "/", x), fileEncoding="cp932", stringsAsFactors=F)
  # If the column name is "好中球減少", change it to "好中球数減少".
  colnames(temp_df) <- gsub("^好中球減少$", "好中球数減少", colnames(temp_df))
  # If the creation date is outside the target period, delete the record
  if (!is.na(kTarget_date_start)){
    temp_df <- subset(temp_df, 作成日 >= kTarget_date_start)
  }
  if (!is.na(kTarget_date_end)){
    temp_df <- subset(temp_df, 作成日 <= kTarget_date_end)
  }
  # Remove unnecessary columns
  temp_df <- temp_df[ , c(kTarget1_colnames)]
  # Sort by SUBJID
  sortlist <- order(as.numeric(temp_df[ ,kSubjid_colname]))
  temp_df <- temp_df[sortlist, ]
  return(temp_df)
})
# Convert from list to data frame
df_all_rbind <- do.call(rbind, df_all_rbind)
# Set the allocation, "a" or "b"
df_all_rbind[ , kAllocation_colname] <- substr(df_all_rbind$シート名英数字別名,
                                               nchar(df_all_rbind[ ,"シート名英数字別名"]),
                                               nchar(df_all_rbind[ ,"シート名英数字別名"]))
# Split dataset into groups
temp_list <- by(df_all_rbind, df_all_rbind$group, data.frame)
tmp <- lapply(temp_list, function(x){
  # "a" or "b"
  temp_group <- x[1, kAllocation_colname]
  # Delete column "group"
  df <- x[ , colnames(x) != kAllocation_colname]
  # Get the worst grade for each SUBJID (Excluding Grade 5)
  list_worst_gradeoutput_2 <- lapply(kTarget2_colnames, function(x){ return(ReturnGradeMaximumValue(df, x)) })
  # Merge all data frame by SUBJID
  temp_worst_gradeoutput_2 <- MergeAll(list_worst_gradeoutput_2)
  # Set allocation label
  worst_gradeoutput_2 <- SetAllocation(temp_worst_gradeoutput_2, temp_group)
  if (temp_group == "a"){
    output_object_list <- kOutputList[c(k1a, k2a, kResult_a)]
  } else {
    output_object_list <- kOutputList[c(k1b, k2b, kResult_b)]
  }
  # Set output object
  assign(output_object_list[1], df, envir=.GlobalEnv)
  assign(output_object_list[2], worst_gradeoutput_2, envir=.GlobalEnv)
  assign(output_object_list[3], OutputWorstGradeResult(get(output_object_list[2])[ , -c(1, 2)]), envir=.GlobalEnv)
})
# write csv
tmp <- lapply(kOutputList, function(x){
  write.csv(get(x), file=paste0(output_path, "/", x, ".csv"), row.names=F, na="", fileEncoding="cp932")
})
