library(shiny)
library(tidyverse)
library(data.table)
library(plotly)

raptor <- fread("data/modern_RAPTOR_by_player.csv") %>%
  filter(season == 2019,
         mp > 500)

ui <- fluidPage(wellPanel(sliderInput(inputId = "raptor", label = "Minimum Total Raptor",
                            value = 5,
                            min = 1,
                            max = 10),
                plotlyOutput(outputId = "raptor_chart")))

server <- function(input, output) {
  output$raptor_chart <- renderPlotly({
    raptor_for_chart <- raptor %>%
    filter(raptor_total > input$raptor)
    
    plot_ly(data=raptor_for_chart, x = ~raptor_offense, y = ~raptor_defense, size = ~mp, text = ~paste(player_name))
    })
    }

shinyApp(ui = ui, server = server)