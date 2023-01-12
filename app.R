library(shiny)
library(shinydashboard)
library(shinythemes)
library(plotly)
library(DT)
library(ggcorrplot)
library(dplyr)
library(inspectdf)
library(skimr)

library(tm)
library(memoise)
library(data.table)
library(Hmisc)
#
library(GGally)
library(ggiraphExtra)
library(factoextra)
library(corrplot)

library(ggvis)
library(radarchart)
library(matsbyname)



# Data
source('data/data.R')
# UI
source('ui/myUI.R')
# Server
source('server/myServer.R')

shinyApp(ui = myUI, server = myserver)


