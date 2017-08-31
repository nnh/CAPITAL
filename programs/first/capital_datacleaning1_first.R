# TODO:andoPGM名追加
# 2016/8/25 
# ando
# 関数の設定
# A courseで必要な変数名を抽出する関数
CapiCourseA <- function(a){
  a[,c("症例登録番号","Docetaxel投与量","末梢性感覚ニューロパチー","好中球数減少","血小板減少","発熱性好中球減少")]
}
# B courseで必要な変数名を抽出する関数
CapiCourseB <- function(b){
  b[,c("症例登録番号","Carboplatin.投与量","Nab.Paclitaxel投与量","Nab.Paclitaxel投与量.1","Nab.Paclitaxel投与量.2","末梢性感覚ニューロパチー","好中球数減少","血小板減少","発熱性好中球減少")]
}
# B courseで必要な変数名を抽出する関数（7 course以降の抽出変数名が変更となっているため別記載）
CapiCourseB_after7 <- function(c){
  c[,c("症例登録番号","Nab.Paclitaxel投与量","Nab.Paclitaxel投与量.1","Nab.Paclitaxel投与量.2","末梢性感覚ニューロパチー","好中球減少","血小板減少","発熱性好中球減少")]
}

setwd("./programs")
setwd("../rawdata")

#ファイルの読み込み
list <- list.files()
file.name <- sub("_170620_1258.*", "", list)  # downloaded date
df.name <- sub("^.*.AL_", "", file.name)

for (i in 1:length(list)) {
  assign(df.name[i], read.csv(list[i], as.is=T, na.strings = c("")))
  }



# A courseで必要な変数名を抽出する作業を1～10courseまで行う
# CapiCourseA <- function(a){
#   a[,c("症例登録番号","Docetaxel投与量","末梢性感覚ニューロパチー","好中球数減少","血小板減少","発熱性好中球減少")]
# }

for (i in 1:10) {
  eval(parse(text=paste0("A_C",i,"<- CapiCourseA(C",i,"_a)")))
}

# # B courseで必要な変数名を抽出。1～6courseまで行う
# CapiCourseB <- function(b){
#   b[,c("症例登録番号","Carboplatin.投与量","Nab.Paclitaxel投与量","Nab.Paclitaxel投与量.1","Nab.Paclitaxel投与量.2","末梢性感覚ニューロパチー","好中球数減少","血小板減少","発熱性好中球減少")]
# }

for (i in 1:6) {
  eval(parse(text=paste0("B_C",i,"<- CapiCourseB(C",i,"_b)")))
}


# # B courseで必要な変数名を抽出。7～10courseまで行う（7 course以降の抽出変数名が変更となっているため別記載）
# CapiCourseB_after7 <- function(c){
#   c[,c("症例登録番号","Nab.Paclitaxel投与量","Nab.Paclitaxel投与量.1","Nab.Paclitaxel投与量.2","末梢性感覚ニューロパチー","好中球減少","血小板減少","発熱性好中球減少")]
# }

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
names(A_C1)[2:6] <- paste0("A_C1_", names(A_C1)[2:6]) ##TODO ando　以下こんな感じでいかが？
names(A_C2)[2:6] <- c("A_C2_Docetaxel投与量","2末梢性感覚ニューロパチー","2好中球数減少","2血小板減少","2発熱性好中球減少")
names(A_C3)[2:6] <- c("A_C3_Docetaxel投与量","3末梢性感覚ニューロパチー","3好中球数減少","3血小板減少","3発熱性好中球減少")
names(A_C4)[2:6] <- c("A_C4_Docetaxel投与量","4末梢性感覚ニューロパチー","4好中球数減少","4血小板減少","4発熱性好中球減少")
names(A_C5)[2:6] <- c("A_C5_Docetaxel投与量","5末梢性感覚ニューロパチー","5好中球数減少","5血小板減少","5発熱性好中球減少")
names(A_C6)[2:6] <- c("A_C6_Docetaxel投与量","6末梢性感覚ニューロパチー","6好中球数減少","6血小板減少","6発熱性好中球減少")
names(A_C7)[2:6] <- c("A_C7_Docetaxel投与量","7末梢性感覚ニューロパチー","7好中球数減少","7血小板減少","7発熱性好中球減少")
names(A_C8)[2:6] <- c("A_C8_Docetaxel投与量","8末梢性感覚ニューロパチー","8好中球数減少","8血小板減少","8発熱性好中球減少")
names(A_C9)[2:6] <- c("A_C9_Docetaxel投与量","9末梢性感覚ニューロパチー","9好中球数減少","9血小板減少","9発熱性好中球減少")
names(A_C10)[2:6] <- c("A_C10_Docetaxel投与量","10末梢性感覚ニューロパチー","10好中球数減少","10血小板減少","10発熱性好中球減少")

# 変数名の変更 B course
names(B_C1)[2:9] <- c("B_C1_Carboplatin.投与量","1Nab.Paclitaxel投与量","1Nab.Paclitaxel投与量.1","1Nab.Paclitaxel投与量.2","1末梢性感覚ニューロパチー","1好中球数減少","1血小板減少","1発熱性好中球減少")
names(B_C2)[2:9] <- c("B_C2_Carboplatin.投与量","2Nab.Paclitaxel投与量","2Nab.Paclitaxel投与量.1","2Nab.Paclitaxel投与量.2","2末梢性感覚ニューロパチー","2好中球数減少","2血小板減少","2発熱性好中球減少")
names(B_C3)[2:9] <- c("B_C3_Carboplatin.投与量","3Nab.Paclitaxel投与量","3Nab.Paclitaxel投与量.1","3Nab.Paclitaxel投与量.2","3末梢性感覚ニューロパチー","3好中球数減少","3血小板減少","3発熱性好中球減少")
names(B_C4)[2:9] <- c("B_C4_Carboplatin.投与量","4Nab.Paclitaxel投与量","4Nab.Paclitaxel投与量.1","4Nab.Paclitaxel投与量.2","4末梢性感覚ニューロパチー","4好中球数減少","4血小板減少","4発熱性好中球減少")
names(B_C5)[2:9] <- c("B_C5_Carboplatin.投与量","5Nab.Paclitaxel投与量","5Nab.Paclitaxel投与量.1","5Nab.Paclitaxel投与量.2","5末梢性感覚ニューロパチー","5好中球数減少","5血小板減少","5発熱性好中球減少")
names(B_C6)[2:9] <- c("B_C6_Carboplatin.投与量","6Nab.Paclitaxel投与量","6Nab.Paclitaxel投与量.1","6Nab.Paclitaxel投与量.2","6末梢性感覚ニューロパチー","6好中球数減少","6血小板減少","6発熱性好中球減少")
names(B_C7)[2:8] <- c("B_C7_Nab.Paclitaxel投与量","7Nab.Paclitaxel投与量.1","7Nab.Paclitaxel投与量.2","7末梢性感覚ニューロパチー","7好中球減少","7血小板減少","7発熱性好中球減少")
names(B_C8)[2:8] <- c("B_C8_Nab.Paclitaxel投与量","8Nab.Paclitaxel投与量.1","8Nab.Paclitaxel投与量.2","8末梢性感覚ニューロパチー","8好中球減少","8血小板減少","8発熱性好中球減少")
names(B_C9)[2:8] <- c("B_C9_Nab.Paclitaxel投与量","9Nab.Paclitaxel投与量.1","9Nab.Paclitaxel投与量.2","9末梢性感覚ニューロパチー","9好中球減少","9血小板減少","9発熱性好中球減少")
names(B_C10)[2:8] <- c("B_C10_Nab.Paclitaxel投与量","10Nab.Paclitaxel投与量.1","10Nab.Paclitaxel投与量.2","10末梢性感覚ニューロパチー","10好中球減少","10血小板減少","10発熱性好中球減少")



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
D11 <- merge(B_C1,B_C2,by="症例登録番号",all=T)
D12 <- merge(D11,B_C3,by="症例登録番号",all=T)
D13 <- merge(D12,B_C4,by="症例登録番号",all=T)
D14 <- merge(D13,B_C5,by="症例登録番号",all=T)
D15 <- merge(D14,B_C6,by="症例登録番号",all=T)
D16 <- merge(D15,B_C7,by="症例登録番号",all=T)
D17 <- merge(D16,B_C8,by="症例登録番号",all=T)
D18 <- merge(D17,B_C9,by="症例登録番号",all=T)
D19 <- merge(D18,B_C10,by="症例登録番号",all=T)

D9[is.na(D9)] <- ""
D16[is.na(D16)] <- ""
setwd("../output")

write.csv(D9,"A_course20170816.csv",row.names=F)　　# TOSO:ando日付の部分、上の方に定義をまとめられるといいですが。
write.csv(D16,"B_course20170816.csv",row.names=F)
