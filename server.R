library(shiny)
library(DT)


shinyServer(function(input, output,session) {
  source("modules/csvFile.R")
  
  output$tabs=renderUI({

  Tabs<-as.list(rep(0,input$subClust+1))
  for (i in 0:length(Tabs)){
    Tabs[i]=lapply(paste("Layer",i,sep=" "),tabPanel,value=i)
  }
  do.call(tabsetPanel,c(Tabs,id="level"))
  })
  
  # Load data file from user input
  datafile <<- callModule(csvFile, "datafile", stringsAsFactors = FALSE)
  
  #Output the csv file as an interactive table
  output$table <- DT::renderDataTable({ datafile() })
  

  # Generate a TS object with input data
  TS<-reactive({
    tsdate <- as.Date(input$startDate)
    tsfreq <- as.numeric(input$freq)
   
    ts(data =  datafile()$Value,
      frequency = tsfreq, 
      start = c(as.numeric(format(tsdate,"%Y")),as.numeric(format(tsdate,"%m")))
    )
  })
  
  # Pot the TS
  output$plotTs<- renderPlot({ plot.ts(TS(),xlab="", ylab="Value") })
  
  #Run model competition
  
}
)
