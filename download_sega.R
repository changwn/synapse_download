#If you wish run code on local computer, just need install below packages.
#install.packages("synapser", repos=c("https://sage-bionetworks.github.io/ran", "http://cran.fhcrc.org"))

#If you wish run code on server, you also need install below packages.
#install.packages("PythonEmbedInR", repos=c("http://cran.fhcrc.org", "https://sage-bionetworks.github.io/ran"))

library(synapser)
synLogin(email='####', password='####', rememberMe=TRUE)	#Here, use your username and password to login

results <- synTableQuery('select * from syn11581437')
df <- as.data.frame(results)

#head(df)
#colnames(df)
table(df$study)
df1<-df[which(df$study=="DHART Project 1 pNF Study"),]
table(df1$dataType)
tg_data_info<-df1[which(df1$dataType=="genomicVariants"),]

for(i in 1:nrow(tg_data_info))
{
print(i)
print(tg_data_info[i,"id"])
synGet(tg_data_info[i,"id"], downloadLocation="./")
cat("Already download ", i, '\n\n', sep='', file='DHART22_log.txt',append=T)
cat("Already download ", tg_data_info[i, "id"], '\n\n', sep='', file='DHART22_log.txt',append=T)
}


