#setwd("~/E2E/Machine Learning/Coursera/09_DevelopingDataProducts/project/Developing_Data_Products_Project_ECA")

# Load required libraries
require(data.table)
library(dplyr)
library(DT)
library(rCharts)

# Read data
data <- fread("./data/champions.csv")

head(data)
colnames(data) # Date, Season, round, etc.

# Exploratory data analysis
sum(is.na(data)) # 18573
table(data$Season) # 1997 - 2015
length(table(data$Season)) # 19
years <- sort(unique(data$Season))
winners <- sort(unique(data$tiewinner))


## Helper functions

#' Aggregate dataset by year, piece and theme
#' 
#' @param dt data.table
#' @param year
#' @param tiewwiner
#' @return data.table
#'
groupByYearAll <- function(dt, year,
                           winners) {
  result <- dt %>% filter(Season == year, 
                          tiewinner %in% winners) 
  return(result)
}


#' Aggregate dataset by themes
#' 
#' @param dt data.table
#' @param year
#' @param winners
#' @return result data.table
#' 
groupByTheme <- function(dt, year, 
                         winners) {
  # use pipelining
  dt <- groupByYearAll(dt, year, winners) 
  result <- datatable(dt, options = list(iDisplayLength = 50))
  return(result)
}
