#Module server function

tsGen<-function(input,output,session){
  
  TS<-reactive({
    ts(data = datafile()$values,frequency = input$frequency)
  })
  
  observe({
    msg <- sprintf("TS  was generated")
    cat(msg, "\n")
  })
  
  return(TS)
}