library(shiny)
library(shinydashboard)
library(dashboardthemes)
library(data.table)
library(tidyverse)
library(DT)
library(readxl)

shinyUI(
  dashboardPage(
                dashboardHeader(title="ID converter "),
                dashboardSidebar(sidebarMenu(sidebarMenu(
                  menuItem("Riz sativa" ,icon = icon("dashboard"),tabName = "P1"),
                  menuItem("Vigne" ,icon = icon("dashboard"),tabName = "P2")
                  ))),
                dashboardBody(shinyDashboardThemes(
                  #theme = "boe_website"
                  theme = "blue_gradient"
                  
                ),
                tabItems(tabItem(tabName = "P1",fluidRow(box( radioButtons("rb", "Convert ID from",
                                                                                                choiceNames = list(
                                                                                                  "MSU to RAP",
                                                                                                  "RAP to  MSU"
                                                                                                ),
                                                                                                choiceValues = list(
                                                                                                  "Choix1", "Choix2"
                                                                                                ),inline = TRUE),width=15)),
                                 
                                 
                                 fluidRow(box(conditionalPanel(condition="input.rb=='Choix1'",
                                                               selectizeInput(
                                                                 "Si1"
                                                                 , "Enter msu.id"
                                                                 , choices = NULL
                                                                 , multiple = TRUE
                                                                 , options = list(create = TRUE)
                                                               )
                                                               
                                                               
                                                               ),conditionalPanel(condition="input.rb=='Choix2'",
                                                                                  selectizeInput(
                                                                                    "Si2"
                                                                                    , "Enter rap.id"
                                                                                    , choices = NULL
                                                                                    , multiple = TRUE
                                                                                    , options = list(create = TRUE)
                                                                                  )
                                                                                  
                                                               )),box(DT::dataTableOutput("dd"),DT::dataTableOutput("dd2")))
                                 ),tabItem(tabName = "P2",fluidRow(box( radioButtons("rb2", "Convert ID from",
                                                                                     choiceNames = list(
                                                                                       "v1 to v2",
                                                                                       "v2 to  v1"
                                                                                     ),
                                                                                     choiceValues = list(
                                                                                       "Choix11", "Choix22"
                                                                                     ),inline = TRUE),width=15)),
                                           
                                           
                                           fluidRow(box(conditionalPanel(condition="input.rb2=='Choix11'",
                                                                         selectizeInput(
                                                                           "Si11"
                                                                           , "Enter v1"
                                                                           , choices = NULL
                                                                           , multiple = TRUE
                                                                           , options = list(create = TRUE)
                                                                         )
                                                                         
                                                                         
                                           ),conditionalPanel(condition="input.rb2=='Choix22'",
                                                              selectizeInput(
                                                                "Si22"
                                                                , "Enter v2"
                                                                , choices = NULL
                                                                , multiple = TRUE
                                                                , options = list(create = TRUE)
                                                              )
                                                              
                                           )),box(DT::dataTableOutput("dd3"),DT::dataTableOutput("dd4")))
                                 )
                         
                         
                         
                         
                         )
                )
  
  
  
  
  
  
  
  
  
  
  
  
  
)
)