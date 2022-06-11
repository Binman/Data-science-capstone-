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
    titlePanel("Predict the next word in the sentence"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          helpText('Enter your sentnace here'),
          hr(),
          textInput('input', 'Sentence:', value = '')
        ),

        # Show predicted word
        mainPanel(
          h1('The predicted word'),
          h2(textOutput('output'))
        )
    )
))
