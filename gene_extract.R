library(tidyverse)

pd_info = read.delim("parkinsons_excel.txt")
pd_info = as_vector(select(pd_info,  X.3))
pd_info = pd_info[!pd_info == "-"]
pd_info = str_remove(pd_info, "[\t ]")
pd_info = strsplit(pd_info, ",")
finalVect = c()
for(gene in pd_info){
  finalVect = c(finalVect, gene)
}
finalVect = finalVect[2:length(finalVect)]

fileConn<-file("gene_names.txt")
writeLines(finalVect, fileConn)
close(fileConn)