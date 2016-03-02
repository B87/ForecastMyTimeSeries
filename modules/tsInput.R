# Module UI function
tsInput <- function (id,label= "TimeSerie features"){
  
  ns <- NS(id)
  tagList(
    
   numericInput(
      inputId = ns("frequency"),
      label="Set the frequency of mesurement of your dataset",
      value = 0),
    dateRangeInput(
      inputId = ns("dateRange"),
      label = "Set the start and end dates of your serie",
      start = "2007-01-01",
      end = "2016-01-01"
    ))      
      
}