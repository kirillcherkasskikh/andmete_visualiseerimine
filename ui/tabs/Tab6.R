Tab6 <- tabPanel("K-Means Clustering", icon =icon("fa-regular fa-chart-pie"),
                 sidebarLayout(
                   sidebarPanel(
                     selectizeInput('sip_kmeans',label = h3("Vali Klastrite arv"), choices=c(2,3,4,5,6), options = list(placeholder = 'Klastrite arv')),
                     radioButtons("radio_kmeans", label = h3("Vali diagrammi"),
                                  choices = list("Radari diagramm" = 1, "Diagramm" = 2), 
                                  selected = 1)
                     
                   ),
                   mainPanel(
                     #ggvisOutput("kMeansPlot1"),
                    # uiOutput("p_ui"),
                   
                     plotOutput("kMeansPlot1", height="800px")
                     
                   )
                 )
)