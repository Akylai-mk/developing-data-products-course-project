#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(readxl)
library(ggplot2)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    ##Read my data
    myDF <- read_excel("mortality.xls")
       output$mortalityPlot <- renderPlot({
       dataReason <- switch(input$reason,
                      "infections" = myDF$infections,
                      "Neoplasms"=myDF$Neoplasms,
                      "blood"=myDF$blood, 
                      "Endocrine"=myDF$Endocrine, 
                      "Mental"=myDF$Mental, 
                      "nervousSystem"=myDF$nervousSystem,
                      "earMastoid"=myDF$earMastoid, 
                      "circulatorySystem"=myDF$circulatorySystem,
                      "Respiratory"=myDF$Respiratory, 
                      "DigestiveSystem"=myDF$DigestiveSystem,
                      "skin"=myDF$skin, 
                      "musculoskeletalSystem"=myDF$musculoskeletalSystem,
                      "GenitourinarySystem"=myDF$GenitourinarySystem, 
                      "Pregnancy"=myDF$Pregnancy,
                      "perinatal"=myDF$perinatal, 
                      "CongenitalChromosomal"=myDF$CongenitalChromosomal,
                      "Abnormal"=myDF$Abnormal, 
                      "InjuryPoisoning"=myDF$InjuryPoisoning)
              ggplot() +
        geom_line(myDF, mapping = aes(year, dataReason, color = region))
           })

})
