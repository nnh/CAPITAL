# TODO:andoPGM名追加
# 2016/9/28
# ando
# output,names(Bcourse)の修正

setwd("//ARONAS/Datacenter/Trials/NMC/CAPITAL/定期モニタリングレポート/第3回 (201601201～20170531)/R")
#setwd("../rawdata")


#outputの日付設定
outputfile <- "20170928"  #today

#ファイルの読み込み
list <- list.files("./rawdata")
file.name <- sub("_170620_1258.*", "", list)  # downloaded date
df.name <- sub("^.*.AL_", "", file.name)

for (i in 1:length(list)) {
  assign(df.name[i], read.csv(list[i], as.is=T, na.strings = c("")))
  }


# A courseで必要な変数名を抽出する関数
CapiCourseA <- function(a){
  a[,c("症例登録番号","Docetaxel投与量","末梢性感覚ニューロパチー","好中球数減少","血小板減少","発熱性好中球減少")]
}

for (i in 1:10) {
  eval(parse(text=paste0("A_C",i,"<- CapiCourseA(C",i,"_a)")))
}

# B courseで必要な変数名を抽出する関数
CapiCourseB <- function(b){
  b[,c("症例登録番号","Carboplatin.投与量","Nab.Paclitaxel投与量","Nab.Paclitaxel投与量.1","Nab.Paclitaxel投与量.2","末梢性感覚ニューロパチー","好中球数減少","血小板減少","発熱性好中球減少")]
}

for (i in 1:6) {
  eval(parse(text=paste0("B_C",i,"<- CapiCourseB(C",i,"_b)")))
}


# B courseで必要な変数名を抽出する関数（7 course以降の抽出変数名が変更となっているため別記載）
CapiCourseB_after7 <- function(c){
  c[,c("症例登録番号","Nab.Paclitaxel投与量","Nab.Paclitaxel投与量.1","Nab.Paclitaxel投与量.2","末梢性感覚ニューロパチー","好中球減少","血小板減少","発熱性好中球減少")]
}

for (i in 7:10) {
  eval(parse(text=paste0("B_C",i,"<- CapiCourseB_after7(C",i,"_b)")))
}


# 有害事象のグレードだけ抽出（Aコース）
for (i in 1:10) {
  eval(parse(text=paste0("A_C",i,"$末梢性感覚ニューロパチー <- substr(A_C",i,"$末梢性感覚ニューロパチー,10,10)")))
}

for (i in 1:10) {
  eval(parse(text=paste0("A_C",i,"$好中球数減少 <- substr(A_C",i,"$好中球数減少,10,10)")))
}

for (i in 1:10) {
  eval(parse(text=paste0("A_C",i,"$血小板減少 <- substr(A_C",i,"$血小板減少,10,10)")))
}

for (i in 1:10) {
  eval(parse(text=paste0("A_C",i,"$発熱性好中球減少 <- substr(A_C",i,"$発熱性好中球減少,10,10)")))
}

# 有害事象のグレードだけ抽出（Bコース）
for (i in 1:10) {
  eval(parse(text=paste0("B_C",i,"$末梢性感覚ニューロパチー <- substr(B_C",i,"$末梢性感覚ニューロパチー,10,10)")))
}



for (i in 1:10) {
  eval(parse(text=paste0("B_C",i,"$血小板減少 <- substr(B_C",i,"$血小板減少,10,10)")))
}


for (i in 1:10) {
  eval(parse(text=paste0("B_C",i,"$発熱性好中球減少 <- substr(B_C",i,"$発熱性好中球減少,10,10)")))
}

# 1-6course,7-10courseで変数名が違うため、別記載する
for (i in 1:6) {
  eval(parse(text=paste0("B_C",i,"$好中球数減少 <- substr(B_C",i,"$好中球数減少,10,10)")))
}


for (i in 7:10) {
  eval(parse(text=paste0("B_C",i,"$好中球減少 <- substr(B_C",i,"$好中球減少,10,10)")))
}




# 変数名の変更 A course
names(A_C1)[2:6] <- paste0("A_C1_", names(A_C1)[2:6])
names(A_C2)[2:6] <- paste0("A_C2_", names(A_C2)[2:6])
names(A_C3)[2:6] <- paste0("A_C3_", names(A_C3)[2:6])
names(A_C4)[2:6] <- paste0("A_C4_", names(A_C4)[2:6])
names(A_C5)[2:6] <- paste0("A_C5_", names(A_C5)[2:6])
names(A_C6)[2:6] <- paste0("A_C6_", names(A_C6)[2:6])
names(A_C7)[2:6] <- paste0("A_C7_", names(A_C7)[2:6])
names(A_C8)[2:6] <- paste0("A_C8_", names(A_C8)[2:6])
names(A_C9)[2:6] <- paste0("A_C9_", names(A_C9)[2:6])
names(A_C10)[2:6] <- paste0("A_C10_", names(A_C10)[2:6])


# 変数名の変更 B course
names(B_C1)[2:9] <- paste0("B_C1_", names(B_C1)[2:9])
names(B_C2)[2:9] <- paste0("B_C2_", names(B_C2)[2:9])
names(B_C3)[2:9] <- paste0("B_C3_", names(B_C3)[2:9])
names(B_C4)[2:9] <- paste0("B_C4_", names(B_C4)[2:9])
names(B_C5)[2:9] <- paste0("B_C5_", names(B_C5)[2:9])
names(B_C6)[2:9] <- paste0("B_C6_", names(B_C6)[2:9])
names(B_C7)[2:8] <- paste0("B_C7_", names(B_C7)[2:8])
names(B_C8)[2:8] <- paste0("B_C8_", names(B_C8)[2:8])
names(B_C9)[2:8] <- paste0("B_C9_", names(B_C9)[2:8])
names(B_C10)[2:8] <- paste0("B_C10_", names(B_C10)[2:8])


# merge A course
D1 <- merge(A_C1,A_C2,by="症例登録番号",all=T)
D2 <- merge(D1,A_C3,by="症例登録番号",all=T)
D3 <- merge(D2,A_C4,by="症例登録番号",all=T)
D4 <- merge(D3,A_C5,by="症例登録番号",all=T)
D5 <- merge(D4,A_C6,by="症例登録番号",all=T)
D6 <- merge(D5,A_C7,by="症例登録番号",all=T)
D7 <- merge(D6,A_C8,by="症例登録番号",all=T)
D8 <- merge(D7,A_C9,by="症例登録番号",all=T)
D9 <- merge(D8,A_C10,by="症例登録番号",all=T)

# merge B course
D101 <- merge(B_C1,B_C2,by="症例登録番号",all=T)
D102 <- merge(D101,B_C3,by="症例登録番号",all=T)
D103 <- merge(D102,B_C4,by="症例登録番号",all=T)
D104 <- merge(D103,B_C5,by="症例登録番号",all=T)
D105 <- merge(D104,B_C6,by="症例登録番号",all=T)
D106 <- merge(D105,B_C7,by="症例登録番号",all=T)
D107 <- merge(D106,B_C8,by="症例登録番号",all=T)
D108 <- merge(D107,B_C9,by="症例登録番号",all=T)
D109 <- merge(D108,B_C10,by="症例登録番号",all=T)

D9[is.na(D9)] <- ""
D106[is.na(D106)] <- ""     
#setwd("../output")

write.csv(D9,paste0("A_course",outputfile,".csv"),row.names=F)　　#todo
write.csv(D106,paste0("B_course",outputfile,".csv"),row.names=F)
