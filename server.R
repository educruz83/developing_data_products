library(shiny)

source("data_processing.R")
winners <- sort(unique(data$tiewinner))

# Shiny server
shinyServer(
  function(input, output) {

    # Initialize reactive values
    values <- reactiveValues()
    values$winners <- winners
    
    # Create event type checkbox
    output$teamSelection <- renderUI({
      checkboxGroupInput('winners', 'Winner teams:', 
                         winners, selected = values$winners)
    })
    
    
    # Add observer on select-all button
    observe({
      if(input$selectAll == 0) return()
      values$winners <- winners
    })
    
    # Add observer on clear-all button
    observe({
      if(input$clearAll == 0) return()
      values$winners <- c() # empty list
    })
    
    # Prepare dataset
    dataTable <- reactive({
      groupByTheme(data, input$num, input$winners)
    })

    # Render data table
    output$dTable <- renderDataTable({
      dataTable()
    } #, options = list(bFilter = FALSE, iDisplayLength = 50)
    )
    
  } # end of function(input, output)
)