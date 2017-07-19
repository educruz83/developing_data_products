# The user-interface definition of the Shiny web app.
library(shiny)
library(BH)
library(rCharts)
require(markdown)
require(data.table)
library(dplyr)
library(DT)

shinyUI(
  navbarPage("EURO Champions League Seasons", 
	 # multi-page user-interface that includes a navigation bar.
	 tabPanel("Explore the Data",
			  sidebarPanel(
				numericInput("num", 
							label = "Season:",
							min = 1998,
							max = 2015,
							value = 2015),
				actionButton(inputId = "clearAll",
							 label = "Clear Team selection",
							 icon = icon("square-o")),
				actionButton(inputId = "selectAll",
							 label = "Select all teams",
							 icon = icon("check-square-o")),
				uiOutput("teamSelection")
				
			  ),
			  mainPanel(
				tabsetPanel(
				  # Data 
				  tabPanel(p(icon("table"), "Dataset"),
						   dataTableOutput(outputId="dTable")
				  ) # end of "Dataset" tab panel
				  
				)
				
			  )     
	 ), # end of "Explore Dataset" tab panel
	 
	 
	 tabPanel("About",
			  mainPanel(
				includeMarkdown("about.md")
			  )
	 ) # end of "About" tab panel
	 )  
  )
            