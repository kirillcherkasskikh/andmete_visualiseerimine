Tab4 <- tabPanel("Chr columns",
                 sidebarLayout(
                   sidebarPanel(),
                   mainPanel(
                     plotOutput("dist_plot_chr", height="800px")
                   )
                 )
)