library(shiny)
library(DT)
library(dygraphs)
source("modules/csvFileInput.R")
source("modules/tsInput.R")

shinyUI(navbarPage("Menu",
                   
                tabPanel("HOME",
                         fluidPage(theme = "bootstrap.min.css")
                ),

               tabPanel("FILE INPUT",
                        fluidPage(titlePanel("I'm a title"),
                                  sidebarLayout(
                          sidebarPanel(
                             helpText("Please enter only a csv with one variable,",
                                      "you will set the time variable",
                                     "using the frequency and start parameters"),
                            
                             csvFileInput("datafile", "User data (.csv format)")),
                          
                          
                          mainPanel(DT:: dataTableOutput("table")))
               )),

               tabPanel("SETUP YOUR TIME SERIE",
                        fluidPage(
                          sidebarPanel(
                            #tsInput("tsInput","Set some parameters of your time serie")
                            numericInput(
                              inputId = "frequency",
                              label="Set the frequency of mesurement of your dataset",
                              value = 0),
                            dateRangeInput(
                              inputId = "dateRange",
                              label = "Set the start and end dates of your serie",
                              start = "2007-01-01",
                              end = "2016-01-01"
                            )
                            )
                          ),
                       
                          mainPanel(plotOutput("plotTs"))
                        ),

               tabPanel("THE MODEL",
                        fluidPage("cluster")),
               
               tabPanel("EVALUATE THE MODEL")
))
