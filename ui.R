#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Understanding mortality in Kyrgyz Republic through data"),

    # Sidebar with input for reason and line color
   
    sidebarLayout(    
    sidebarPanel(
            selectInput("reason", h3("Select reason for death"),
                        choices = c("infections", "Neoplasms",
                                       "blood", "Endocrine", 
                                       "Mental", "nervousSystem",
                                       "earMastoid", 
                                       "circulatorySystem",
                                       "Respiratory", "DigestiveSystem",
                                       "skin", "musculoskeletalSystem",
                                       "GenitourinarySystem", "Pregnancy",
                                       "perinatal", "CongenitalChromosomal",
                                       "Abnormal", "InjuryPoisoning"),
                        selected = 1)),
        # Show a plot of the mortality
        mainPanel(
            h3("Mortality in Kyrgyz Republic over time"),
            plotOutput("mortalityPlot"))
        )
))

