#deploying to production
install.packages("shiny")
library(shiny)

#create aun UI
ui <- fluidPage("Hello World!")

#create a server
server <- function(input, output) {}

#create a shiny app
shinyApp(
  ui = ui,
  server = server
)

#create a UI with I/O controls
ui <- fluidPage(
  titlePanel("Input and Output"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "num",
        label = "Choose a number",
        min = 0,
        max = 100,
        value = 25
      )
    ),
    mainPanel(
      textOutput(
        outputId = "text"
      )
    )
  )
)


#create a server that maps input to output
server <- function(input, output){
  output$text <- renderText({
    paste("You Selected ", input$num)
  })
}

#create a shiny app
shinyApp(
  ui = ui,
  server = server
)

#------------------------------------
#set working directory
setwd("/home/hectorceja/R-practica")


#load data
load("Tree.RData")

#load color brewer library
library(RColorBrewer)

#CREATE A COLOR PALETTE
palette <- brewer.pal(3,"Set2")

#create a user interface code
ui <- fluidPage(
  titlePanel("Iris Species Predictor"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(
        inputId = "petal.length",
        label = "Petal Length (cm)",
        min = 1,
        max = 7,
        value = 4
      ),
      sliderInput(
        inputId = "petal.width",
        label = "Petal Width (cm)",
        min = 0.0,
        max = 2.5,
        step = 0.5,
        value = 1.5
      )
    ),
    mainPanel(
      textOutput(
        outputId = "text"
      ),
      plotOutput(
        outputId = "plot"
      )
    )
  )
)

#create server code
server <- function(input, output){
  output$text = renderText({
    #create predictors
    predictors <- data.frame(
      Petal.Length = input$petal.length,
      Petal.Width = input$petal.width,
      Sepal.Length = 0,
      Sepal.Width = 0
    )
    #make prediction
    prediction = predict(
      object = model,
      newdata = predictors,
      type = "class"
    )
    #create prediction text
    paste(
      "The predicted species is ",
      as.character(prediction)
    )
  })
  output$plot = renderPlot({
    #create a scatterplot colored by species
    plot(
      x=iris$Petal.Length,
      y=iris$Petal.Width,
      pch=19,
      col = palette[as.numeric(iris$Species)],
      main = "Iris Petal Length vs. Width",
      xlab = "Petal Length (cm)",
      ylab = "Petal Width (cm)"
    )
    #plot the decision boundaries
    partition.tree(
      model,
      label = "Species",
      add = TRUE
    )
    #draw predictor on plot
    points(
      x = input$petal.length,
      y = input$petal.width,
      col = "red",
      pch = 4,
      cex = 2,
      lwd = 2
    )
  })
}

#create a shiny app
shinyApp(
  ui = ui,
  server = server
)

