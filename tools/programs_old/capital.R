setwd("//Rinken-sv2/�v���g�R�[����/CAPITAL/������j�^�����O���|�[�g/��3�� (201601201�`20170531)/R")
setwd("./programs")
setwd("../rowdata")

#�t�@�C���̓ǂݍ���
list <- list.files()

file.name <- sub("_170620_1258.*", "", list)  # downloaded date

df.name <- sub("^.*.AL_", "", file.name)



for (i in 1:length(list)) {

  assign(df.name[i], read.csv(list[i], as.is=T, na.strings = c("")))


}



# A course�ŕK�v�ȕϐ����𒊏o�B1�`10course�܂ōs��
CapiCourseA <- function(a){
 a[,c("�Ǘ�o�^�ԍ�","Docetaxel���^��","���������o�j���[���p�`�[","�D����������","��������","���M���D��������")]
}

for (i in 1:10) {
eval(
 parse(
 text=paste0("A_C",i,"<- CapiCourseA(C",i,"_a)")
     )
   )
}


# B course�ŕK�v�ȕϐ����𒊏o�B1�`6course�܂ōs��
CapiCourseB <- function(b){
 b[,c("�Ǘ�o�^�ԍ�","Carboplatin.���^��","Nab.Paclitaxel���^��","Nab.Paclitaxel���^��.1","Nab.Paclitaxel���^��.2","���������o�j���[���p�`�[","�D����������","��������","���M���D��������")]
}


for (i in 1:6) {
eval(
 parse(
 text=paste0("B_C",i,"<- CapiCourseB(C",i,"_b)")
     )
   )
}


# B course�ŕK�v�ȕϐ����𒊏o�B7�`10course�܂ōs���i7 course�ȍ~�̒��o�ϐ������ύX�ƂȂ��Ă��邽�ߕʋL�ځj
CapiCourseB_after7 <- function(c){
 c[,c("�Ǘ�o�^�ԍ�","Nab.Paclitaxel���^��","Nab.Paclitaxel���^��.1","Nab.Paclitaxel���^��.2","���������o�j���[���p�`�[","�D��������","��������","���M���D��������")]
}

for (i in 7:10) {
eval(
 parse(
 text=paste0("B_C",i,"<- CapiCourseB_after7(C",i,"_b)")
     )
   )
}


# �L�Q���ۂ̃O���[�h�������o�iA�R�[�X�j
for (i in 1:10) {
eval(
 parse(
 text=paste0("A_C",i,"$���������o�j���[���p�`�[ <- substr(A_C",i,"$���������o�j���[���p�`�[,10,10)")
     )
   )
}

for (i in 1:10) {
eval(
 parse(
 text=paste0("A_C",i,"$�D���������� <- substr(A_C",i,"$�D����������,10,10)")
     )
   )
}

for (i in 1:10) {
eval(
 parse(
 text=paste0("A_C",i,"$�������� <- substr(A_C",i,"$��������,10,10)")
     )
   )
}

for (i in 1:10) {
eval(
 parse(
 text=paste0("A_C",i,"$���M���D�������� <- substr(A_C",i,"$���M���D��������,10,10)")
     )
   )
}

# �L�Q���ۂ̃O���[�h�������o�iB�R�[�X�j
for (i in 1:10) {
eval(
 parse(
 text=paste0("B_C",i,"$���������o�j���[���p�`�[ <- substr(B_C",i,"$���������o�j���[���p�`�[,10,10)")
     )
   )
}



for (i in 1:10) {
eval(
 parse(
 text=paste0("B_C",i,"$�������� <- substr(B_C",i,"$��������,10,10)")
     )
   )
}


for (i in 1:10) {
eval(
 parse(
 text=paste0("B_C",i,"$���M���D�������� <- substr(B_C",i,"$���M���D��������,10,10)")
     )
   )
}

# 1-6course,7-10course�ŕϐ������Ⴄ���߁A�ʋL�ڂ���
for (i in 1:6) {
eval(
 parse(
 text=paste0("B_C",i,"$�D���������� <- substr(B_C",i,"$�D����������,10,10)") 
     )
   )
}


for (i in 7:10) {
eval(
 parse(
 text=paste0("B_C",i,"$�D�������� <- substr(B_C",i,"$�D��������,10,10)") 
     )
   )
}




# �ϐ����̕ύX A course
names(A_C1)[2:6] <- c("A_C1_Docetaxel���^��","1���������o�j���[���p�`�[","1�D����������","1��������","1���M���D��������")
names(A_C2)[2:6] <- c("A_C2_Docetaxel���^��","2���������o�j���[���p�`�[","2�D����������","2��������","2���M���D��������")
names(A_C3)[2:6] <- c("A_C3_Docetaxel���^��","3���������o�j���[���p�`�[","3�D����������","3��������","3���M���D��������")
names(A_C4)[2:6] <- c("A_C4_Docetaxel���^��","4���������o�j���[���p�`�[","4�D����������","4��������","4���M���D��������")
names(A_C5)[2:6] <- c("A_C5_Docetaxel���^��","5���������o�j���[���p�`�[","5�D����������","5��������","5���M���D��������")
names(A_C6)[2:6] <- c("A_C6_Docetaxel���^��","6���������o�j���[���p�`�[","6�D����������","6��������","6���M���D��������")
names(A_C7)[2:6] <- c("A_C7_Docetaxel���^��","7���������o�j���[���p�`�[","7�D����������","7��������","7���M���D��������")
names(A_C8)[2:6] <- c("A_C8_Docetaxel���^��","8���������o�j���[���p�`�[","8�D����������","8��������","8���M���D��������")
names(A_C9)[2:6] <- c("A_C9_Docetaxel���^��","9���������o�j���[���p�`�[","9�D����������","9��������","9���M���D��������")
names(A_C10)[2:6] <- c("A_C10_Docetaxel���^��","10���������o�j���[���p�`�[","10�D����������","10��������","10���M���D��������")

# �ϐ����̕ύX B course
names(B_C1)[2:9] <- c("B_C1_Carboplatin.���^��","1Nab.Paclitaxel���^��","1Nab.Paclitaxel���^��.1","1Nab.Paclitaxel���^��.2","1���������o�j���[���p�`�[","1�D����������","1��������","1���M���D��������")
names(B_C2)[2:9] <- c("B_C2_Carboplatin.���^��","2Nab.Paclitaxel���^��","2Nab.Paclitaxel���^��.1","2Nab.Paclitaxel���^��.2","2���������o�j���[���p�`�[","2�D����������","2��������","2���M���D��������")
names(B_C3)[2:9] <- c("B_C3_Carboplatin.���^��","3Nab.Paclitaxel���^��","3Nab.Paclitaxel���^��.1","3Nab.Paclitaxel���^��.2","3���������o�j���[���p�`�[","3�D����������","3��������","3���M���D��������")
names(B_C4)[2:9] <- c("B_C4_Carboplatin.���^��","4Nab.Paclitaxel���^��","4Nab.Paclitaxel���^��.1","4Nab.Paclitaxel���^��.2","4���������o�j���[���p�`�[","4�D����������","4��������","4���M���D��������")
names(B_C5)[2:9] <- c("B_C5_Carboplatin.���^��","5Nab.Paclitaxel���^��","5Nab.Paclitaxel���^��.1","5Nab.Paclitaxel���^��.2","5���������o�j���[���p�`�[","5�D����������","5��������","5���M���D��������")
names(B_C6)[2:9] <- c("B_C6_Carboplatin.���^��","6Nab.Paclitaxel���^��","6Nab.Paclitaxel���^��.1","6Nab.Paclitaxel���^��.2","6���������o�j���[���p�`�[","6�D����������","6��������","6���M���D��������")
names(B_C7)[2:8] <- c("B_C7_Nab.Paclitaxel���^��","7Nab.Paclitaxel���^��.1","7Nab.Paclitaxel���^��.2","7���������o�j���[���p�`�[","7�D��������","7��������","7���M���D��������")
names(B_C8)[2:8] <- c("B_C8_Nab.Paclitaxel���^��","8Nab.Paclitaxel���^��.1","8Nab.Paclitaxel���^��.2","8���������o�j���[���p�`�[","8�D��������","8��������","8���M���D��������")
names(B_C9)[2:8] <- c("B_C9_Nab.Paclitaxel���^��","9Nab.Paclitaxel���^��.1","9Nab.Paclitaxel���^��.2","9���������o�j���[���p�`�[","9�D��������","9��������","9���M���D��������")
names(B_C10)[2:8] <- c("B_C10_Nab.Paclitaxel���^��","10Nab.Paclitaxel���^��.1","10Nab.Paclitaxel���^��.2","10���������o�j���[���p�`�[","10�D��������","10��������","10���M���D��������")



#�ȉ��̃v���O�����œ����悤�ɏC������
for (i in 1:10) {
eval(
 parse(
 text=paste0("names(A_C",i,")[2] <- c(A_C",i,"_Docetaxel���^��)")
     )
   )
}


# merge A course
D1 <- merge(A_C1,A_C2,by="�Ǘ�o�^�ԍ�",all=T)
D2 <- merge(D1,A_C3,by="�Ǘ�o�^�ԍ�",all=T)
D3 <- merge(D2,A_C4,by="�Ǘ�o�^�ԍ�",all=T)
D4 <- merge(D3,A_C5,by="�Ǘ�o�^�ԍ�",all=T)
D5 <- merge(D4,A_C6,by="�Ǘ�o�^�ԍ�",all=T)
D6 <- merge(D5,A_C7,by="�Ǘ�o�^�ԍ�",all=T)
D7 <- merge(D6,A_C8,by="�Ǘ�o�^�ԍ�",all=T)
D8 <- merge(D7,A_C9,by="�Ǘ�o�^�ԍ�",all=T)
D9 <- merge(D8,A_C10,by="�Ǘ�o�^�ԍ�",all=T)

# merge B course
D11 <- merge(B_C1,B_C2,by="�Ǘ�o�^�ԍ�",all=T)
D12 <- merge(D11,B_C3,by="�Ǘ�o�^�ԍ�",all=T)
D13 <- merge(D12,B_C4,by="�Ǘ�o�^�ԍ�",all=T)
D14 <- merge(D13,B_C5,by="�Ǘ�o�^�ԍ�",all=T)
D15 <- merge(D14,B_C6,by="�Ǘ�o�^�ԍ�",all=T)
D16 <- merge(D15,B_C7,by="�Ǘ�o�^�ԍ�",all=T)
D17 <- merge(D16,B_C8,by="�Ǘ�o�^�ԍ�",all=T)
D18 <- merge(D17,B_C9,by="�Ǘ�o�^�ԍ�",all=T)
D19 <- merge(D18,B_C10,by="�Ǘ�o�^�ԍ�",all=T)

D9[is.na(D9)] <- ""
D16[is.na(D16)] <- ""
setwd("../output")

write.csv(D9,"A_course20170816.csv",row.names=F)
write.csv(D16,"B_course20170816.csv",row.names=F)