library(shiny)
library(dplyr)
library(ggplot2)


ui <- fluidPage(
  titlePanel("StarWars app"),
  sidebarLayout(
    sidebarPanel(
      (h1("Star Wars Character")),
      sliderInput(
        inputId = "taille",
        label = "Height of charracters:",
        min = 0,
        max = 250,
        value = 30
      )
    ),
    mainPanel(
      plotOutput("StarWarsPlot")
    )
  )
)


server <- function(input, output) {
  output$StarWarsPlot <- renderPlot({
    starwars %>%
      filter(height > input$taille) %>%
      ggplot(aes(x = height)) +
      geom_histogram(
        binwidth = 10,
        fill = "darkgray",
        color = "white"
      )
  })
}

shinyApp(ui = ui, server = server)
