install.packages("shiny")
install.packages("shinydashboard")
install.packages("shinyjs")
# app.R

# Load necessary libraries
library(shiny)
library(shinydashboard)
library(shinyjs)
library(glmnet)  # Assuming you used glmnet for logistic regression

# Load the logistic regression model
logistic_model <- readRDS("C:\\Users\\smaha\\OneDrive\\Documents\\Music Recomendation in R\\logistic_regression_model\\logistic_model.rds")

# Define UI
ui <- fluidPage(
  titlePanel("Music Recommendation"),
  sidebarLayout(
    sidebarPanel(
      # Define input elements here
      # For example, you can use textInput, selectInput, etc.
    ),
    mainPanel(
      # Display the output or result here
      textOutput("prediction")
    )
  )
)

# Define Server
server <- function(input, output) {
  # Define server logic here
  
  # For example, you can use observeEvent to trigger predictions
  observeEvent(input$predictButton, {
    # Get user inputs and process them
    
    # Make predictions using the logistic regression model
    # Example: predictions <- predict(logistic_model, newdata = input_data, type = "response")
    
    # Display the predictions
    # Example: output$prediction <- renderText(paste("Predicted Probability:", predictions))
  })
}

# Run the Shiny app
shinyApp(ui, server)

shiny::runApp("path/to/your/app.R")
