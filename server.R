
Database <- read.table("RAP-MSU_2020-03-24.txt", header =F)
colnames(Database)= c("RAPDB","MSU")
Database<-separate_rows(Database,"MSU",sep = ",")
Database$MSU=sub(".[[:digit:]]*$", "", Database$MSU)
Database<-as.data.table(Database)
vigne <- read_excel("Matching_between_V1_V2.xls")
vigne<-data.table(vigne)
Rap2Msu<-function(x){
  data<-unique(Database[Database$RAPDB %in% x])
  names(data)<-c("rap.id","msu.id")
  return(data)
}
Msu2Rap <-function(Msu.id){
  data<-unique(Database[Database$MSU %in% Msu.id])
  data<-data[,c(2,1)]
  names(data)<-c("msu.id","rap.id")
  return(data)
}
v2v1<-function(x){
  data<-unique(vigne[vigne$V2 %in% x])
  data<-data[,c(2,1)]
  names(data)<-c("v2.id","v1.id")
  return(data)
}
v1v2<-function(x){
  data<-unique(vigne[vigne$V1 %in% x])
  names(data)<-c("v1.id","v2.id")
  return(data)
}
Msu.id <- c("LOC_Os01g01010", "LOC_Os01g01019")
m=as.data.frame(Msu2Rap(Msu.id) )


shinyServer(function(input,output){
  
output$dd<-DT::renderDataTable({

  if(input$rb=="Choix1"){
  b=as.character(input$Si1)
  d=c()
  d=c(d,b)
  as.data.frame(Msu2Rap(d) )
  }else{return()}
  
}) 
output$dd2<-DT::renderDataTable({
  
  if(input$rb=="Choix2"){  b=as.character(input$Si2)
  d=c()
  d=c(d,b)
  as.data.frame(Rap2Msu(d) )
  }else{return()}
  

  
})
output$dd3<-DT::renderDataTable({
  
  if(input$rb2=="Choix11"){
    b=as.character(input$Si11)
    d=c()
    d=c(d,b)
    as.data.frame(v1v2(d) )
  }else{return()}
  
}) 
output$dd4<-DT::renderDataTable({
  
  if(input$rb2=="Choix22"){  b=as.character(input$Si22)
  d=c()
  d=c(d,b)
  as.data.frame(v2v1(d) )
  }else{return()}
  
  
  
})
})