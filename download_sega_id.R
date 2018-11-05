
#install.packages("PythonEmbedInR", repos=c("http://cran.fhcrc.org", "https://sage-bionetworks.github.io/ran"))

#install.packages("synapser", repos=c("https://sage-bionetworks.github.io/ran", "http://cran.fhcrc.org"))

library(synapser)
synLogin(email='####', password='####', rememberMe=TRUE)  #Here, use your username and password to login

#####################################
#
#   Download data with syn ID number
#
#####################################

#  method 1: put syn ID in the csv table and download one-time
#  Note: you need to download 'Tobedownloaded0.csv' from the example in github
missing_samples<-read.csv("Tobedownloaded0.csv",h=F)
missing_samples<-as.matrix(missing_samples)[,1]

for(i in 1:length(missing_samples))
{
tg_s1<-missing_samples[i]
synGet(tg_s1, downloadLocation="./")
}

#  method 2: change the entry in the quotation marks with your syn ID to download
tg_s1<-"syn11820453"
synGet(tg_s1, downloadLocation="./")
​