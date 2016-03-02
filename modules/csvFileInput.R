# Module UI function
csvFileInput <- function(id, label = "CSV file") {
  accept=c('text/csv', 
           'text/comma-separated-values,text/plain', 
           '.csv')
  # Create a namespace function using the provided id
  ns <- NS(id)
  tagList(
    fileInput(ns("file"), label),
    checkboxInput(ns("heading"), "Has heading",TRUE),
    selectInput(ns("sep"),"Separator",choices = c(Comma=",",Semicolon=";",Tab="\t",Space=" "),selected =),
    selectInput(ns("quote"), "Quote", c("None" = "",
                                        "Double quote" = "\"",
                                        "Single quote" = "'"
                                        )
                )
  )
}

