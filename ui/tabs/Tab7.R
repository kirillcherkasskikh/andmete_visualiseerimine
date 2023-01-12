Tab7 <- tabPanel("Soovitussusteem", icon =icon("fa-solid fa-heart"),
                 sidebarLayout(
                   sidebarPanel(
                  
                     selectizeInput('sip_cluster_choose',label = h3("Valige Cluster"), choices=c("Live Music","Dance Music", "Music for Study"), options = list(placeholder = 'Klastrite arv')),
                     selectizeInput('sip_genre_choose',label = h3("Valige Genre"), choices=NULL, options = list(placeholder = '')),
                     selectizeInput('sip_Artist_choose',label = h3("Valige Artist"), choices=NULL, options = list(placeholder = '')),
                    
                     
                   ),
                   mainPanel(
                     br(),
                     dataTableOutput("recommend_tabel"),
                     
                   )
                 )
)