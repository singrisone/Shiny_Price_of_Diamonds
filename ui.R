library(shiny)
library(shinyWidgets)

shinyUI(fluidPage(
    titlePanel("Price Range for Diamonds"),
    
    # Sidebar layout with input and output definitions 
    sidebarLayout(
        sidebarPanel(
            helpText("This application will provide the price range of diamonds based on your 4C selections."),
            helpText("Please select the 4C characterstics (Carat, Cut, Color, Clarity)."),
            sliderInput("carat", label = h4("Carat:"), min=.1, max=5, step = 0.1, value = c(1,2)),
            radioButtons("cut",label = h4("Cut:" ), 
                            choices = list("Fair"='Fair', "Good"='Good', "Very Good"='Very Good', 
                                           "Premium"='Premium', "Ideal"='Ideal'), selected='Good'),
            radioButtons("color", label = h4("Color:"),
                        choices = list("D"='D', "E"="E", "F"="F", "G"="G","H"="H", "I"="I","J"="J"),
                        selected='G'),
            radioButtons("clarity", label = h4("Clarity:"),
                        choices = list("I1"="I1", "SI2"="SI2","SI1"='SI1', "VS2"='VS2', "VS1"='VS1',
                                    "VVS2"='VVS2', "VVS1"="VVS1", "IF"="IF"),
                       selected='SI1' )
            
        ),
       mainPanel(
            h4("Min and Max price range of diamonds based on your selections: "),
            h3(verbatimTextOutput("result1")),
            h4("The average price of the diamond based on your selections is: "),
            h3(verbatimTextOutput("result2")),
            br(),
            plotOutput("distPlot")
            )
        )
    ))