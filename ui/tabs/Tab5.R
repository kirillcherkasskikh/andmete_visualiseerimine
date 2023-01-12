Tab5 <- tabPanel("Korrelatsioonimaatriks", icon = icon("fa-regular fa-table-cells"),
                 sidebarLayout(
                   sidebarPanel(
                     sliderInput("slider1", 
                                 label = h3("Korrelatsiooniväärtuste filter"), 
                                 min = 0, 
                                 max = 1, 
                                 value = 0, 
                                 step = 0.01)
                   ),
                   mainPanel(
                     plotOutput("ggPlot", height="800px")
                   )
                 )
)




