library(dplyr)
library(stringr)
library(openxlsx)
rawdata_path <- "/Volumes/Stat/Trials/NMC/CAPITAL/tools/document/input"
input_csv <- c("CAPITAL_C10_a_190801_1248.csv", "CAPITAL_C10_b_190801_1248.csv", "CAPITAL_C11_a_190801_1248.csv",
               "CAPITAL_C11_b_190801_1248.csv", "CAPITAL_C12_a_190801_1248.csv", "CAPITAL_C12_b_190801_1248.csv",
               "CAPITAL_C13_a_190801_1248.csv", "CAPITAL_C13_b_190801_1248.csv", "CAPITAL_C14_a_190801_1248.csv",
               "CAPITAL_C14_b_190801_1248.csv", "CAPITAL_C15_a_190801_1248.csv", "CAPITAL_C15_b_190801_1248.csv",
               "CAPITAL_C16_a_190801_1248.csv", "CAPITAL_C16_b_190801_1248.csv", "CAPITAL_C17_a_190801_1248.csv",
               "CAPITAL_C17_b_190801_1248.csv", "CAPITAL_C18_a_190801_1248.csv", "CAPITAL_C18_b_190801_1248.csv",
               "CAPITAL_C19_a_190801_1248.csv", "CAPITAL_C19_b_190801_1248.csv", "CAPITAL_C1_a_190801_1248.csv",
               "CAPITAL_C1_b_190801_1248.csv", "CAPITAL_C20_a_190801_1248.csv", "CAPITAL_C20_b_190801_1248.csv",
               "CAPITAL_C2_a_190801_1248.csv", "CAPITAL_C2_b_190801_1248.csv", "CAPITAL_C3_a_190801_1248.csv",
               "CAPITAL_C3_b_190801_1248.csv", "CAPITAL_C4_a_190801_1248.csv", "CAPITAL_C4_b_190801_1248.csv",
               "CAPITAL_C5_a_190801_1248.csv", "CAPITAL_C5_b_190801_1248.csv", "CAPITAL_C6_a_190801_1248.csv",
               "CAPITAL_C6_b_190801_1248.csv", "CAPITAL_C7_a_190801_1248.csv", "CAPITAL_C7_b_190801_1248.csv",
               "CAPITAL_C8_a_190801_1248.csv", "CAPITAL_C8_b_190801_1248.csv", "CAPITAL_C9_a_190801_1248.csv",
               "CAPITAL_C9_b_190801_1248.csv")
df_csv <- NULL
for (i in 1:length(input_csv)){
  temp_df <- read.csv(paste0(rawdata_path, "/", input_csv[i]), fileEncoding="cp932", stringsAsFactors=F)
  colnames(temp_df) <- gsub("^好中球減少$", "好中球数減少", colnames(temp_df))
  temp_2_df <- temp_df %>% select(c("シート名英数字別名","作成日","登録コード","症例登録番号",
                                    "末梢性感覚ニューロパチー","白血球減少","好中球数減少","貧血",
                                    "血小板減少","発熱性好中球減少","疲労","筋肉痛","関節痛","四肢浮腫"))
  df_csv <- rbind(df_csv, temp_2_df)  # 　②読み込んだデータを１つのデータフレームへまとめる。
}
df_csv <- df_csv %>% arrange(シート名英数字別名, 症例登録番号)
df_all_a <- df_csv %>% filter(str_sub(df_csv$シート名英数字別名, start=-1,end=-1) == "a")
df_all_b <- df_csv %>% filter(str_sub(df_csv$シート名英数字別名, start=-1,end=-1) == "b")
# excel出力
#output_wb <- createWorkbook()
#addWorksheet(output_wb, "1a")
#writeData(output_wb, sheet="1a", x=Worst_Gradeoutput_1a, withFilter=F, sep=",")
#addWorksheet(output_wb, "1b")
#writeData(output_wb, sheet="1b", x=Worst_Gradeoutput_1b, withFilter=F, sep=",")
#addWorksheet(output_wb, "diff_1a")
#writeData(output_wb, sheet="diff_1a", x=df_all_a, withFilter=F, sep=",")
#addWorksheet(output_wb, "diff_1b")
#writeData(output_wb, sheet="diff_1b", x=df_all_b, withFilter=F, sep=",")
#saveWorkbook(output_wb, "/Users/admin/Documents/GitHub/CAPITAL/test1.xlsx", overwrite=T)
# 　⑥症例番号毎に最悪Gradeを取得してデータフレームへまとめる。(Grade5は集計より除く）
# とりあえず全部出す
func_grd <- function(df, byoumei){
  temp_ae <- df %>% select(c(症例登録番号, byoumei))
  temp_ae <- cbind(temp_ae, str_split(temp_ae[, byoumei], "-", simplify = TRUE))
  colnames(temp_ae) <- c("症例登録番号", "ae", "term", "grade")
  temp_ae$num_grade <- as.numeric(as.character(temp_ae$grade))
  res <- filter(group_by(temp_ae, 症例登録番号), grade==max(num_grade)) %>% arrange(症例登録番号) %>% select(症例登録番号, num_grade) %>% unique()
  return(res)
}
func_2 <- function(df){
  term1_max <- func_grd(df, "末梢性感覚ニューロパチー")
  term2_max <- func_grd(df, "白血球減少")
  term3_max <- func_grd(df, "好中球数減少")
  term4_max <- func_grd(df, "貧血")
  term5_max <- func_grd(df, "血小板減少")
  term6_max <- func_grd(df, "発熱性好中球減少")
  term7_max <- func_grd(df, "疲労")
  term8_max <- func_grd(df, "筋肉痛")
  term9_max <- func_grd(df, "関節痛")
  term10_max <- func_grd(df, "四肢浮腫")
  df <- df[,c("症例登録番号"),drop=F] %>%
    arrange(症例登録番号) %>% unique() %>%
    left_join(term1_max, by="症例登録番号") %>%
    left_join(term2_max, by="症例登録番号") %>%
    left_join(term3_max, by="症例登録番号") %>%
    left_join(term4_max, by="症例登録番号") %>%
    left_join(term5_max, by="症例登録番号") %>%
    left_join(term6_max, by="症例登録番号") %>%
    left_join(term7_max, by="症例登録番号") %>%
    left_join(term8_max, by="症例登録番号") %>%
    left_join(term9_max, by="症例登録番号") %>%
    left_join(term10_max, by="症例登録番号")
  colnames(df) <- c("症例登録番号", "末梢性感覚ニューロパチー", "白血球減少", "好中球数減少", "貧血", "血小板減少", "発熱性好中球減少", "疲労", "筋肉痛", "関節痛", "四肢浮腫")
  return(df)
}
df_a_2 <- func_2(df_all_a)
df_a_2$群 <- "A群"
df_a_2 <- select(df_a_2, c("群", "症例登録番号", "末梢性感覚ニューロパチー", "白血球減少", "好中球数減少", "貧血", "血小板減少", "発熱性好中球減少", "疲労", "筋肉痛", "関節痛", "四肢浮腫"))
df_b_2 <- func_2(df_all_b)
df_b_2$群 <- "B群"
df_b_2 <- select(df_b_2, c("群", "症例登録番号", "末梢性感覚ニューロパチー", "白血球減少", "好中球数減少", "貧血", "血小板減少", "発熱性好中球減少", "疲労", "筋肉痛", "関節痛", "四肢浮腫"))
# excel出力
#output_wb <- createWorkbook()
#addWorksheet(output_wb, "a")
#writeData(output_wb, sheet="a", x=Worst_Gradeoutput_2a, withFilter=F, sep=",")
#addWorksheet(output_wb, "diff_a")
#writeData(output_wb, sheet="diff_a", x=df_a_2, withFilter=F, sep=",")
#addWorksheet(output_wb, "b")
#writeData(output_wb, sheet="b", x=Worst_Gradeoutput_2b, withFilter=F, sep=",")
#addWorksheet(output_wb, "diff_b")
#writeData(output_wb, sheet="diff_b", x=df_b_2, withFilter=F, sep=",")
#saveWorkbook(output_wb, "/Users/admin/Documents/GitHub/CAPITAL/test2.xlsx", overwrite=T)

#⑧最悪Gradeの累計算出。
#　⑨症例登録番号毎の有害事象数の合計算出。
#　⑩⑨に対するGrade3-4の割合算出。
#　⑪⑩に対するGrade４の割合算出。
#　⑫⑧～⑪をデータフレームへまとめる。（Worst_Gradeoutput_result_[a/b].csv）
func_result <- function(df){
  output_df <- data.frame(c(NA), c(NA), c(NA), c(NA), c(NA), c(NA), c(NA), c(NA), c(NA), c(NA))
  output_df <- output_df[-1, ]
  for (i in 2:11){
    col_nm <- colnames(df)[i]
    g0 <- df %>% filter(df[ , i] == 0) %>% nrow() %>% as.numeric()
    g1 <- df %>% filter(df[ , i] == 1) %>% nrow() %>% as.numeric()
    g2 <- df %>% filter(df[ , i] == 2) %>% nrow() %>% as.numeric()
    g3 <- df %>% filter(df[ , i] == 3) %>% nrow() %>% as.numeric()
    g4 <- df %>% filter(df[ , i] == 4) %>% nrow() %>% as.numeric()
    tmp3 <- g0+g1+g2+g3+g4
    tmp1 <- round(((as.numeric(g3) + as.numeric(g4)) / as.numeric(tmp3)) * 100, digits=1) %>% as.numeric()
    tmp2 <- round((as.numeric(g4) / as.numeric(tmp3)) * 100, digits=1) %>% as.numeric()
    g5 <- df %>% filter(df[ , i] == 5) %>% nrow() %>% as.character()
    temp_df <- c(col_nm, g0, g1, g2, g3, g4, tmp1, tmp2, tmp3)
    output_df <- rbind(output_df, temp_df, stringsAsFactors=F)
  }
  return(output_df)
}
df_a_r <- func_result(df_a_2)
colnames(df_a_r) <- c("", "grade0", "grade1", "grade2", "grade3", "grade4", "grade3-4(%)", "grade4(%)", "sum")
df_b_r <- func_result(df_b_2)
colnames(df_b_r) <- c("", "grade0", "grade1", "grade2", "grade3", "grade4", "grade3-4(%)", "grade4(%)", "sum")

# excel出力
#output_wb <- createWorkbook()
#addWorksheet(output_wb, "a")
#writeData(output_wb, sheet="a", x=Worst_Gradeoutput_result_a, withFilter=F, sep=",")
#addWorksheet(output_wb, "diff_a")
#writeData(output_wb, sheet="diff_a", x=df_a_r, withFilter=F, sep=",")
#addWorksheet(output_wb, "b")
#writeData(output_wb, sheet="b", x=Worst_Gradeoutput_result_b, withFilter=F, sep=",")
#addWorksheet(output_wb, "diff_b")
#writeData(output_wb, sheet="diff_b", x=df_b_r, withFilter=F, sep=",")
#saveWorkbook(output_wb, "/Users/admin/Documents/GitHub/CAPITAL/test3.xlsx", overwrite=T)
# 比較
setdiff(df_all_a, Worst_Gradeoutput_1a)
setdiff(Worst_Gradeoutput_1a, df_all_a)
setdiff(df_all_b, Worst_Gradeoutput_1b)
setdiff(Worst_Gradeoutput_1b, df_all_b)
