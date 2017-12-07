# TODO:okanoPGM名追加
# 2016/10/03
# okano
# setwd修正

setwd("//ARONAS/Datacenter/Trials/NMC/CAPITAL/定期モニタリングレポート/第4回 (20170601～20171130)/R")#毎回変える

#　ファイル読み込み（一度にすべてのファイルを読み込む）
list <- list.files("./rawdata")
file.name <- sub("_170808_1417.*",   "",   list) #  毎回変更
df.name <- sub("^.*.AL_",   "",  file.name)
setwd("./rawdata")  #TODO
for (i in 1:length(list)) {
  assign(df.name[i],  read.csv(list[i],  as.is=T,  na.strings = c("")))
}

# 必要なデータの抽出
Ca1 <- C1_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Ca2 <- C2_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Ca3 <- C3_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Ca4 <- C4_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Ca5 <- C5_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Ca6 <- C6_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Ca7 <- C7_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Ca8 <- C8_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Ca9 <- C9_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Ca10 <- C10_a[, c("症例登録番号",  "Docetaxel投与量",  "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]


Cb1 <- C1_b[, c("症例登録番号",  "Carboplatin.投与量",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Cb2 <- C2_b[, c("症例登録番号",  "Carboplatin.投与量",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Cb3 <- C3_b[, c("症例登録番号",  "Carboplatin.投与量",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Cb4 <- C4_b[, c("症例登録番号",  "Carboplatin.投与量",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Cb5 <- C5_b[, c("症例登録番号",  "Carboplatin.投与量",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]
Cb6 <- C6_b[, c("症例登録番号",  "Carboplatin.投与量",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球数減少",  "血小板減少",  "発熱性好中球減少" )]

Cb7 <- C7_b[, c("症例登録番号",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球減少",  "血小板減少",  "発熱性好中球減少" )]
Cb8 <- C8_b[, c("症例登録番号",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球減少",  "血小板減少",  "発熱性好中球減少" )]
Cb9 <- C9_b[, c("症例登録番号",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球減少",  "血小板減少",  "発熱性好中球減少" )]
Cb10 <- C10_b[, c("症例登録番号",  "Nab.Paclitaxel投与量",  "Nab.Paclitaxel投与量.1",  "Nab.Paclitaxel投与量.2", 
              "末梢性感覚ニューロパチー",  "好中球減少",  "血小板減少",  "発熱性好中球減少" )]

 #有害事象のgradeのみ抽出
Ca1$末梢性感覚ニューロパチー <- substr(Ca1$末梢性感覚ニューロパチー,  10,  10)
Ca2$末梢性感覚ニューロパチー <- substr(Ca2$末梢性感覚ニューロパチー,  10,  10)
Ca3$末梢性感覚ニューロパチー <- substr(Ca3$末梢性感覚ニューロパチー,  10,  10)
Ca4$末梢性感覚ニューロパチー <- substr(Ca4$末梢性感覚ニューロパチー,  10,  10)
Ca5$末梢性感覚ニューロパチー <- substr(Ca5$末梢性感覚ニューロパチー,  10,  10)
Ca6$末梢性感覚ニューロパチー <- substr(Ca6$末梢性感覚ニューロパチー,  10,  10)
Ca7$末梢性感覚ニューロパチー <- substr(Ca7$末梢性感覚ニューロパチー,  10,  10)
Ca8$末梢性感覚ニューロパチー <- substr(Ca8$末梢性感覚ニューロパチー,  10,  10)
Ca9$末梢性感覚ニューロパチー <- substr(Ca9$末梢性感覚ニューロパチー,  10,  10)
Ca10$末梢性感覚ニューロパチー <- substr(Ca10$末梢性感覚ニューロパチー,  10,  10)

Cb1$末梢性感覚ニューロパチー <- substr(Cb1$末梢性感覚ニューロパチー,  10,  10)
Cb2$末梢性感覚ニューロパチー <- substr(Cb2$末梢性感覚ニューロパチー,  10,  10)
Cb3$末梢性感覚ニューロパチー <- substr(Cb3$末梢性感覚ニューロパチー,  10,  10)
Cb4$末梢性感覚ニューロパチー <- substr(Cb4$末梢性感覚ニューロパチー,  10,  10)
Cb5$末梢性感覚ニューロパチー <- substr(Cb5$末梢性感覚ニューロパチー,  10,  10)
Cb6$末梢性感覚ニューロパチー <- substr(Cb6$末梢性感覚ニューロパチー,  10,  10)
Cb7$末梢性感覚ニューロパチー <- substr(Cb7$末梢性感覚ニューロパチー,  10,  10)
Cb8$末梢性感覚ニューロパチー <- substr(Cb8$末梢性感覚ニューロパチー,  10,  10)
Cb9$末梢性感覚ニューロパチー <- substr(Cb9$末梢性感覚ニューロパチー,  10,  10)
Cb10$末梢性感覚ニューロパチー <- substr(Cb10$末梢性感覚ニューロパチー,  10,  10)

Ca1$好中球数減少 <- substr(Ca1$好中球数減少,  10,  10)
Ca2$好中球数減少 <- substr(Ca2$好中球数減少,  10,  10)
Ca3$好中球数減少 <- substr(Ca3$好中球数減少,  10,  10)
Ca4$好中球数減少 <- substr(Ca4$好中球数減少,  10,  10)
Ca5$好中球数減少 <- substr(Ca5$好中球数減少,  10,  10)
Ca6$好中球数減少 <- substr(Ca6$好中球数減少,  10,  10)
Ca7$好中球数減少 <- substr(Ca7$好中球数減少,  10,  10)
Ca8$好中球数減少 <- substr(Ca8$好中球数減少,  10,  10)
Ca9$好中球数減少 <- substr(Ca9$好中球数減少,  10,  10)
Ca10$好中球数減少 <- substr(Ca10$好中球数減少,  10,  10)

Cb1$好中球数減少 <- substr(Cb1$好中球数減少,  10,  10)
Cb2$好中球数減少 <- substr(Cb2$好中球数減少,  10,  10)
Cb3$好中球数減少 <- substr(Cb3$好中球数減少,  10,  10)
Cb4$好中球数減少 <- substr(Cb4$好中球数減少,  10,  10)
Cb5$好中球数減少 <- substr(Cb5$好中球数減少,  10,  10)
Cb6$好中球数減少 <- substr(Cb6$好中球数減少,  10,  10)

Cb7$好中球減少 <- substr(Cb7$好中球減少,  10,  10)
Cb8$好中球減少 <- substr(Cb8$好中球減少,  10,  10)
Cb9$好中球減少 <- substr(Cb9$好中球減少,  10,  10)
Cb10$好中球減少 <- substr(Cb10$好中球減少,  10,  10)

Ca1$血小板減少 <- substr(Ca1$血小板減少,  10,  10)
Ca2$血小板減少 <- substr(Ca2$血小板減少,  10,  10)
Ca3$血小板減少 <- substr(Ca3$血小板減少,  10,  10)
Ca4$血小板減少 <- substr(Ca4$血小板減少,  10,  10)
Ca5$血小板減少 <- substr(Ca5$血小板減少,  10,  10)
Ca6$血小板減少 <- substr(Ca6$血小板減少,  10,  10)
Ca7$血小板減少 <- substr(Ca7$血小板減少,  10,  10)
Ca8$血小板減少 <- substr(Ca8$血小板減少,  10,  10)
Ca9$血小板減少 <- substr(Ca9$血小板減少,  10,  10)
Ca10$血小板減少 <- substr(Ca10$血小板減少,  10,  10)

Cb1$血小板減少 <- substr(Cb1$血小板減少,  10,  10)
Cb2$血小板減少 <- substr(Cb2$血小板減少,  10,  10)
Cb3$血小板減少 <- substr(Cb3$血小板減少,  10,  10)
Cb4$血小板減少 <- substr(Cb4$血小板減少,  10,  10)
Cb5$血小板減少 <- substr(Cb5$血小板減少,  10,  10)
Cb6$血小板減少 <- substr(Cb6$血小板減少,  10,  10)
Cb7$血小板減少 <- substr(Cb7$血小板減少,  10,  10)
Cb8$血小板減少 <- substr(Cb8$血小板減少,  10,  10)
Cb9$血小板減少 <- substr(Cb9$血小板減少,  10,  10)
Cb10$血小板減少 <- substr(Cb10$血小板減少,  10,  10)

Ca1$発熱性好中球減少 <- substr(Ca1$発熱性好中球減少,  10,  10)
Ca2$発熱性好中球減少 <- substr(Ca2$発熱性好中球減少,  10,  10)
Ca3$発熱性好中球減少 <- substr(Ca3$発熱性好中球減少,  10,  10)
Ca4$発熱性好中球減少 <- substr(Ca4$発熱性好中球減少,  10,  10)
Ca5$発熱性好中球減少 <- substr(Ca5$発熱性好中球減少,  10,  10)
Ca6$発熱性好中球減少 <- substr(Ca6$発熱性好中球減少,  10,  10)
Ca7$発熱性好中球減少 <- substr(Ca7$発熱性好中球減少,  10,  10)
Ca8$発熱性好中球減少 <- substr(Ca8$発熱性好中球減少,  10,  10)
Ca9$発熱性好中球減少 <- substr(Ca9$発熱性好中球減少,  10,  10)
Ca10$発熱性好中球減少 <- substr(Ca10$発熱性好中球減少,  10,  10)

Cb1$発熱性好中球減少 <- substr(Cb1$発熱性好中球減少,  10,  10)
Cb2$発熱性好中球減少 <- substr(Cb2$発熱性好中球減少,  10,  10)
Cb3$発熱性好中球減少 <- substr(Cb3$発熱性好中球減少,  10,  10)
Cb4$発熱性好中球減少 <- substr(Cb4$発熱性好中球減少,  10,  10)
Cb5$発熱性好中球減少 <- substr(Cb5$発熱性好中球減少,  10,  10)
Cb6$発熱性好中球減少 <- substr(Cb6$発熱性好中球減少,  10,  10)
Cb7$発熱性好中球減少 <- substr(Cb7$発熱性好中球減少,  10,  10)
Cb8$発熱性好中球減少 <- substr(Cb8$発熱性好中球減少,  10,  10)
Cb9$発熱性好中球減少 <- substr(Cb9$発熱性好中球減少,  10,  10)
Cb10$発熱性好中球減少 <- substr(Cb10$発熱性好中球減少,  10,  10)

#変数名の変更
names(Ca1)[2:6] <- c("A_C1_Docetaxel投与量",  "A_C1_末梢性感覚ニューロパチー",  "A_C1_好中球数減少",  "A_C1_血小板減少",  "A_C1_発熱性好中球減少")
names(Ca2)[2:6] <- c("A_C2_Docetaxel投与量",  "A_C2_末梢性感覚ニューロパチー",  "A_C2_好中球数減少",  "A_C2_血小板減少",  "A_C2_発熱性好中球減少")
names(Ca3)[2:6] <- c("A_C3_Docetaxel投与量",  "A_C3_末梢性感覚ニューロパチー",  "A_C3_好中球数減少",  "A_C3_血小板減少",  "A_C3_発熱性好中球減少")
names(Ca4)[2:6] <- c("A_C4_Docetaxel投与量",  "A_C4_末梢性感覚ニューロパチー",  "A_C4_好中球数減少",  "A_C4_血小板減少",  "A_C4_発熱性好中球減少")
names(Ca5)[2:6] <- c("A_C5_Docetaxel投与量",  "A_C5_末梢性感覚ニューロパチー",  "A_C5_好中球数減少",  "A_C5_血小板減少",  "A_C5_発熱性好中球減少")
names(Ca6)[2:6] <- c("A_C6_Docetaxel投与量",  "A_C6_末梢性感覚ニューロパチー",  "A_C6_好中球数減少",  "A_C6_血小板減少",  "A_C6_発熱性好中球減少")
names(Ca7)[2:6] <- c("A_C7_Docetaxel投与量",  "A_C7_末梢性感覚ニューロパチー",  "A_C7_好中球数減少",  "A_C7_血小板減少",  "A_C7_発熱性好中球減少")
names(Ca8)[2:6] <- c("A_C8_Docetaxel投与量",  "A_C8_末梢性感覚ニューロパチー",  "A_C8_好中球数減少",  "A_C8_血小板減少",  "A_C8_発熱性好中球減少")
names(Ca9)[2:6] <- c("A_C9_Docetaxel投与量",  "A_C9_末梢性感覚ニューロパチー",  "A_C9_好中球数減少",  "A_C9_血小板減少",  "A_C9_発熱性好中球減少")
names(Ca10)[2:6] <- c("A_C10_Docetaxel投与量",  "A_C10_末梢性感覚ニューロパチー",  "A_C10_好中球数減少",  "A_C10_血小板減少",  "A_C10_発熱性好中球減少")

names(Cb1)[2:9] <- c("B_C1_Carboplatin.投与量",  "1Nab.Paclitaxel投与量",  "1Nab.Paclitaxel投与量.1",  "1Nab.Paclitaxel投与量.2",  "1末梢性感覚ニューロパチー",  "1好中球数減少",  "1血小板減少",  "1発熱性好中球減少")  # TODO:okanoさん　数字から始まる変数名大丈夫ですか？
names(Cb2)[2:9] <- c("B_C2_Carboplatin.投与量",  "2Nab.Paclitaxel投与量",  "2Nab.Paclitaxel投与量.1",  "2Nab.Paclitaxel投与量.2",  "2末梢性感覚ニューロパチー",  "2好中球数減少",  "2血小板減少",  "2発熱性好中球減少")
names(Cb3)[2:9] <- c("B_C3_Carboplatin.投与量",  "3Nab.Paclitaxel投与量",  "3Nab.Paclitaxel投与量.1",  "3Nab.Paclitaxel投与量.2",  "3末梢性感覚ニューロパチー",  "3好中球数減少",  "3血小板減少",  "3発熱性好中球減少")
names(Cb4)[2:9] <- c("B_C4_Carboplatin.投与量",  "4Nab.Paclitaxel投与量",  "4Nab.Paclitaxel投与量.1",  "4Nab.Paclitaxel投与量.2",  "4末梢性感覚ニューロパチー",  "4好中球数減少",  "4血小板減少",  "4発熱性好中球減少")
names(Cb5)[2:9] <- c("B_C5_Carboplatin.投与量",  "5Nab.Paclitaxel投与量",  "5Nab.Paclitaxel投与量.1",  "5Nab.Paclitaxel投与量.2",  "5末梢性感覚ニューロパチー",  "5好中球数減少",  "5血小板減少",  "5発熱性好中球減少")
names(Cb6)[2:9] <- c("B_C6_Carboplatin.投与量",  "6Nab.Paclitaxel投与量",  "6Nab.Paclitaxel投与量.1",  "6Nab.Paclitaxel投与量.2",  "6末梢性感覚ニューロパチー",  "6好中球数減少",  "6血小板減少",  "6発熱性好中球減少")

names(Cb7)[2:8] <- c("7Nab.Paclitaxel投与量",  "7Nab.Paclitaxel投与量.1",  "7Nab.Paclitaxel投与量.2",  "7末梢性感覚ニューロパチー",  "7好中球減少",  "7血小板減少",  "7発熱性好中球減少")
names(Cb8)[2:8] <- c("8Nab.Paclitaxel投与量",  "8Nab.Paclitaxel投与量.1",  "8Nab.Paclitaxel投与量.2",  "8末梢性感覚ニューロパチー",  "8好中球減少",  "8血小板減少",  "8発熱性好中球減少")
names(Cb9)[2:8] <- c("9Nab.Paclitaxel投与量",  "9Nab.Paclitaxel投与量.1",  "9Nab.Paclitaxel投与量.2",  "9末梢性感覚ニューロパチー",  "9好中球減少",  "9血小板減少",  "9発熱性好中球減少")
names(Cb10)[2:8] <- c("10Nab.Paclitaxel投与量",  "10Nab.Paclitaxel投与量.1",  "10Nab.Paclitaxel投与量.2",  "10末梢性感覚ニューロパチー",  "10好中球減少",  "10血小板減少",  "10発熱性好中球減少")

#マージ
M_A1 <- merge(Ca1,  Ca2,  by=c("症例登録番号"),  all=T)
M_A2 <- merge(M_A1,  Ca3,  by=c("症例登録番号"),  all=T)
M_A3 <- merge(M_A2,  Ca4,  by=c("症例登録番号"),  all=T)
M_A4 <- merge(M_A3,  Ca5,  by=c("症例登録番号"),  all=T)
M_A5 <- merge(M_A4,  Ca6,  by=c("症例登録番号"),  all=T)
M_A6 <- merge(M_A5,  Ca7,  by=c("症例登録番号"),  all=T)
M_A7 <- merge(M_A6,  Ca8,  by=c("症例登録番号"),  all=T)
M_A8 <- merge(M_A7,  Ca9,  by=c("症例登録番号"),  all=T)
M_A9 <- merge(M_A8,  Ca10,  by=c("症例登録番号"),  all=T)

M_B1 <- merge(Cb1,  Cb2,  by=c("症例登録番号"),  all=T)
M_B2 <- merge(M_B1,  Cb3,  by=c("症例登録番号"),  all=T)
M_B3 <- merge(M_B2,  Cb4,  by=c("症例登録番号"),  all=T)
M_B4 <- merge(M_B3,  Cb5,  by=c("症例登録番号"),  all=T)
M_B5 <- merge(M_B4,  Cb6,  by=c("症例登録番号"),  all=T)
M_B6 <- merge(M_B5,  Cb7,  by=c("症例登録番号"),  all=T)
M_B7 <- merge(M_B6,  Cb8,  by=c("症例登録番号"),  all=T)
M_B8 <- merge(M_B7,  Cb9,  by=c("症例登録番号"),  all=T)
M_B9 <- merge(M_B8,  Cb10,  by=c("症例登録番号"),  all=T)

#出力
M_A9[is.na(M_A9)] <- ""
M_B9[is.na(M_B9)] <- ""

write.csv(M_A9,  "../output/course_A.csv",  row.names=F)
write.csv(M_B9,  "../output/course_B.csv",  row.names=F)

