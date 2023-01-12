Tab7 <- tabPanel("Soovitussüsteem", icon =icon("fa-solid fa-heart"),
                 sidebarLayout(
                   sidebarPanel(
                  
                     selectizeInput('sip_cluster_choose',label = h3("Valige Cluster"), choices=c("Live Music","Dance Music", "Music for Study"), options = list(placeholder = 'Klastrite arv')),
                     selectizeInput('sip_genre_choose',label = h3("Valige Genre"), choices=NULL, options = list(placeholder = '')),
                     selectizeInput('sip_Artist_choose',label = h3("Valige Artist"), choices=NULL, options = list(placeholder = '')),
                     #radioButtons("radio_kmeans", label = h3("Vali diagrammi"),
                      #            choices = list("Radari diagramm" = 1, "Diagramm" = 2), 
                      #            selected = 1)
                     
                   ),
                   mainPanel(
                     br(),
                     dataTableOutput("recommend_tabel"),
                     #ggvisOutput("kMeansPlot1"),
                     # uiOutput("p_ui"),
                     
                     #plotOutput("kMeansPlot1", height="800px")
                     
                   )
                 )
)