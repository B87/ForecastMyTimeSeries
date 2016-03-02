library(shiny)
library(DT)
library(dygraphs)
source("modules/csvFileInput.R")
source("modules/tsInput.R")

shinyUI(navbarPage("MENU",
                   
          tabPanel("HOME",fluidPage(theme = "bootstrap.min.css")),

          tabPanel("FILE INPUT",
                fluidPage(
                  sidebarLayout(
                    sidebarPanel(
                      h3("Upload your data file here!"),
                      helpText("Please rembember to upload a file with two columns,
                                the first one must be a date value and the second column must be
                                the values of the data you want to forecast"),
                            
                      csvFileInput("datafile", "User data (.csv format)")
                    ),
                          
                        
                  mainPanel(
                    DT:: dataTableOutput("table"))
                  )
                )
            ),

          tabPanel("SETUP YOUR TIME SERIES",
                fluidPage(titlePanel("Please set some parameters of your time series"),
                  sidebarPanel(
                    selectInput("freq", label = ("Select the frequency of your maesurements"),
                                choices = list("Monthly" = 12, "Quarterly" = 4) 
                    ),
                            
                    dateInput(inputId = "startDate",
                            label = "Set the start date of your serie",
                            value = "2007-01-01"
                            )
                  )
                ),
                       
                mainPanel(plotOutput("plotTs"))
          ),

          tabPanel("ANALYSIS",
                fluidPage(
                  
                )
          ),
          
          tabPanel("FORECAST",
                fluidPage(
                  
                )
          )
))
