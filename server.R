library(shiny)
library(DT)


shinyServer(function(input, output,session) {
  source("modules/csvFile.R")
  source("modules/tsGen.R")
  
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

  ##PlotTs
  #TS <<- callModule(tsGen,"TS")
  
  
  TS<-reactive({
    input$dateRange
   ts(data =  datafile()$Value,frequency = input$frequency)
  })
  
  output$plotTs<- renderPlot({ plot.ts(TS()) })
  
}
)
