#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
df <- read_csv('corpus_counts.csv', col_names = TRUE, col_types = 'ccn')
colnames(df) <- c('word1', '`Predicted next word:`', 'n')

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$output <- renderPrint(
    df %>% 
      filter(word1 == str_split(input$input, pattern = ' ') %>% .[[1]] %>% tail(1)) %>% 
      .[1,2] %>% 
      as_vector()
  )
})





