
setwd("D:\\Gui_Olv\\Documents\\CaseRioOnibus")
library(data.table)
colunas<-c("Permissao","Modal","CM","Data_Inf","Valor","Cod.Inf","Desc_Inf","Status","Data")

#Carregando Dados
df<-fread("https://apps.data.rio/SMTR/Multas/multas.txt",
          header = FALSE,
          col.names = colunas,
          sep = ";",
          stringsAsFactors = FALSE)


#Analises
dim(df)
unique(df[["Modal"]])

# Usando stringr
library(stringr)

#Substitui Vírgula pro ponto |Tranforma Para Numeric. insere no DataFrame 
df[["Valor"]] = as.numeric(str_replace(df[["Valor"]], ",", "."))  

sum(df[["Valor"]])



df[["Modal"]] = factor(df[["Modal"]])
df[["Status"]] = factor(df[["Status"]])

unique(df$Cod.Inf)

unique(df$Desc_Inf)

#Valores Ausentes
sum(is.na(df))
for(i in colunas){
print(length(which(nchar(trimws(df[[i]]))==0)))
}

summary(df)

########SUBCONJUNTO ONIBUS###################
bus_df = data.frame(subset(df,df$Modal=="ONIBUS"))

dim(bus_df)
summary(bus_df)

for(i in colunas){
  print(length(which(nchar(trimws(bus_df[[i]]))==0)))
}
