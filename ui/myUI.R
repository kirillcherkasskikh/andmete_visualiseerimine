source('ui/tabs/Tabs.R')
source('ui/UICSS.R')

# Define UI ----
myUI <- dashboardPage( 
  dashboardHeader(disable=TRUE),
  dashboardSidebar(disable=TRUE),
  dashboardBody(
  UICSS,
  titlePanel("Spotify muusika soovitussüsteem"),
  helpText("Õppeaine: Andmete visualiseerimine (Virumaa) - ITB8812"),
  helpText("Õppejoud: Olga Dunajeva"),
  helpText("Autor: Kirill Cherkasskikh"),
  tabsetPanel(
    Tab1,
    Tab2,
    Tab3,
    Tab5,
    Tab6,
    Tab7
  )
  )
) 
