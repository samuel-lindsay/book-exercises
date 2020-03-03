# Exercise 1: building a Shiny user interface

# Load the `shiny` package (install it in the R terminal if you haven't already)

library(shiny)

# Define a new `ui` variable. This variable should be assigned a `fluidPage()`
# layout. The `fluidPage()` layout should be passed the following:

ui <- fluidPage(

  # A first-level header (`h1()`) with the content "First Shiny Website"
  h1("First Shiny Website!"),

  # A paragraph (`p()`) with content saying how excited you are about Shiny.
  # The paragraph should include some `strong()` content.
  p("I am ", strong("mildly"), "excited about shiny."),
  # An image (`img()`) with no content but the `src` attribute of the url:
  # https://media2.giphy.com/media/l3q2Ip7FrmPE33EiI/giphy.gif
  
  
  img(src="https://media2.giphy.com/media/l3q2Ip7FrmPE33EiI/giphy.gif"),
  
  # A second paragraph describing how excited you are about sliders.
  # The paragraph should include some emphasized (`em()`) content.

  p("I am, maybe, a ", em("little bit"), " excited about sliders."),
  
  # A slider with a key `my_slider`, an appropriate label, a min value of 10,
  # A max value of 100, and a default value of 50
  
  sliderInput("my_slider", "Slider", 10, 100, 50)

  # (Your `fluidLayout()` should end here)
)

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  # Will be next!
  return(output)
}

# Create a new `shinyApp()` using the above ui and server

shinyApp(ui, server)