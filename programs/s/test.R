library(dplyr)
library(stringr)
df <- df_worst_gradeoutput_1a
df <- cbind(df, str_split_fixed(df_worst_gradeoutput_1a$末梢性感覚ニューロパチー, pattern="-", n=2))
df <- select(df, c(症例登録番号, "1", "2"))
df %>% group_by(症例登録番号)
df_worst_gradeoutput_1a %>% group_by(症例登録番号) %>% filter(test==max(末梢性感覚ニューロパチー))
# 列名の確認
#fout <- file("/Users/admin/Desktop/test.txt", "w")
#test <- ls()
#for (i in 1:length(test)){
#    writeLines(c(test[i], colnames(get(test[i]))), fout)
#  #  writeLines(c(test[i], colnames(get(test[i]))), sep="\t", fout)
##  writeLines("", sep="\n", fout)
#}
#close(fout)
