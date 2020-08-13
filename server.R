library(shiny)
library(ggplot2)
library(dplyr)
library(plotly)

dia <- diamonds[,c(1:4,7)]
shinyServer(
    function(input, output) {
        output$distPlot <- renderPlot({
            # User input
            input$carat
            input$cut
            input$color
            input$clarity
            
            filtered <-dia %>%
                filter(carat == input$carat,
                       cut == input$cut,
                       color == input$color,
                       clarity == input$clarity)
            
            # Min and max of price based on user input
            myr1 <-paste0('$', range(filtered$price)[1])
            myr2 <-paste0('$', range(filtered$price)[2])
            myr3 <-paste0('$', mean(filtered$price))
            output$result1 <- renderText({ paste0(myr1, '  and  ', myr2) }) 
            output$result2 <- renderText({ paste0(myr3) })
            
            # Histogram based on user input
            ggplot(filtered, aes(price)) +
                geom_histogram(color='darkblue', fill='lightblue', bins=50) 
            
    })
         
})
