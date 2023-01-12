
Tab3 <- tabPanel("Kirjeldav Analüüs",icon = icon("fa-solid fa-chart-simple"),
                 sidebarLayout(
                   sidebarPanel(
                     selectInput("sip_tunnus", label = h3("Vali tunnust:"), choices=NULL),
                     
                     checkboxInput(inputId = "density",
                                   label = strong("Muuta intervallide arv"),
                                   value = FALSE),
                     
                     conditionalPanel(condition = "input.density == true",
                                      sliderInput("slider_tab3", 
                                                  label = h3("Vali intervallide arv:"), 
                                                  min = 2, 
                                                  max = 100, 
                                                  value = 20, 
                                                  step = 1),
                     )
                     
                   ),
                   mainPanel(
                     
                     conditionalPanel(condition = "input.sip_tunnus != 'Kõik tunnused'",
                                      br(),
                                      div(
                                        valueBoxOutput("vbox4"),
                                        class="valuebx"
                                      ),
                                      div(
                                        valueBoxOutput("vbox5"),
                                        class="valuebx"
                                      ),
                                      div(
                                        valueBoxOutput("vbox6"),
                                        class="valuebx"
                                      ),
                                      div(
                                        valueBoxOutput("vbox7"),
                                        class="valuebx"
                                      ),
                                      div(
                                        valueBoxOutput("vbox8"),
                                        class="valuebx"
                                      ),
                                      div(
                                        valueBoxOutput("vbox9"),
                                        class="valuebx"
                                      ),
                                      br()
                     ),
                     
                     plotOutput("dist_plot_num", height="600px"),
                     
                     conditionalPanel(condition = "input.sip_tunnus != 'Kõik tunnused'",
                                      plotOutput("dist_plot")
                     )
                   )
                  )
                )