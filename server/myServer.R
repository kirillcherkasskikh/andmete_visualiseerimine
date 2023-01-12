source('server/renderDT.R')

myserver <- function(input, output, session) {
  
  ################################################################################
  # Tab 2

  #render table
  output$tabel <- renderDataTable(data, options = 
                                    list(searching = FALSE,ordering=F, 
                                         lengthMenu = c(5, 10, 20),
                                         pageLength = 5,scrollX = TRUE)) 
  
  output$table_summary <- renderPrint({
    skim(data)
  })
  
  output$vbox1 <- renderValueBox({
    valueBox(97980, subtitle = "Songs", icon=icon("fa-solid fa-music"), color="green")
  })
  
  output$vbox2 <- renderValueBox({
    valueBox(20, subtitle = "Tunnuseid", icon=icon("fa-light fa-table"), color="aqua")
  })
  output$vbox3 <- renderValueBox({
    valueBox(114, subtitle = "Genres", icon=icon("fa-brands fa-spotify"), color="blue")
  })
  

  
  
  ################################################################################
  #Tab 3
  # Distribution

  sip_tunnus <- reactive({
    input$sip_tunnus
  })
  
  #Update Inputs
  updateSelectizeInput(session, 'sip_tunnus', choices = c("Kõik tunnused", sort(colnames(Filter(is.numeric, data[,-1])), decreasing=TRUE)), server=TRUE)
  
  data_numbers <- reactive({
    if(sip_tunnus() == "Kõik tunnused"){
      data_numbers <- Filter(is.numeric, data[,-1])
      data_numbers
    }
    else{
      data_numbers <-  data %>% select(sip_tunnus())
      data_numbers
    }
  })
  
  dist_plot_name <-reactive({
    if(sip_tunnus() == "Kõik tunnused"){
      name <- "Histogrammid:"
      name
    }
    else{
      name <-  paste("Histogramm", sip_tunnus(),":", sep = " ")
      name
      
    }
  })
  
  
  
  output$dist_plot_num <- renderPlot({
    data_numbers() %>% inspect_num(breaks = input$slider_tab3) %>% show_plot()  + 
      labs(title = dist_plot_name())
    
    
  })
  
  output$dist_plot <- renderPlot({
    if(sip_tunnus() != "Kõik tunnused"){
      boxplot(data %>% select(sip_tunnus()), col="skyblue", horizontal=1, xlab=paste("", sip_tunnus()), main=paste("", sip_tunnus(), "\n karp-vurrud diagramm"), cex.main=0.9, cex.axis=0.7,cex.lab=0.8)
    }
  })
  
  #output$dist_table <- renderPrint({
  #  if(sip_tunnus() != "Kõik tunnused"){

  #    summary(data %>% select(sip_tunnus()))
  #  }
  #})
  
  output$vbox4 <- renderValueBox({
    
    if(sip_tunnus() != "Kõik tunnused"){
      valueBox(summary(data %>% select(sip_tunnus()))[1], subtitle = "", color="blue", width=1)
    }
   
  })
  output$vbox5 <- renderValueBox({
    
    if(sip_tunnus() != "Kõik tunnused"){
      valueBox(summary(data %>% select(sip_tunnus()))[2], subtitle = "", color="blue", width=1)
    }
    
  })
  output$vbox6 <- renderValueBox({
    
    if(sip_tunnus() != "Kõik tunnused"){
      valueBox(summary(data %>% select(sip_tunnus()))[3], subtitle = "", color="blue", width=1)
    }
    
  })
  output$vbox7 <- renderValueBox({
    
    if(sip_tunnus() != "Kõik tunnused"){
      valueBox(summary(data %>% select(sip_tunnus()))[4], subtitle = "", color="blue", width=1)
    }
    
  })
  output$vbox8 <- renderValueBox({
    
    if(sip_tunnus() != "Kõik tunnused"){
      valueBox(summary(data %>% select(sip_tunnus()))[5], subtitle = "", color="blue", width=1)
    }
    
  })
  output$vbox9 <- renderValueBox({
    
    if(sip_tunnus() != "Kõik tunnused"){
      valueBox(summary(data %>% select(sip_tunnus()))[6], subtitle = "", color="blue", width=1)
    }
    
  })
  
  
  ################################################################################
  #Tab 4
  
  data_freq <- reactive({
    m <- data %>%
      group_by(artists) %>%
      dplyr::summarise(total_count=n(),
                       .groups = 'drop')
    
    df2 <- m %>% as.data.frame()
    df2
    
  })
  
  output$dist_plot_chr <- renderPlotly({
    # Bar chart
    data_freq() %>% 
      plot_ly(
        x = ~artists,
        y = ~total_count,
        name = "Artists",
        type = "bar",
        text = ~paste(total_count, ""),
        textposition = "outside",
        marker = list(color = "blue",
                      line = list(color = "lightblue",
                                  width = 1.5))
      ) %>% layout(
        title = list(text = "Gender by Work Type", font = 22), 
        xaxis = list(
          categoryorder = "total descending",
          title = "Gender"
        ),
        yaxis = list(
          title = "Number",
          range = c(0, max(data_freq()$total_count)+275)
        )
      )
   
  })
  
  ################################################################################
  #Tab 5
  # Correlation Tab(4)
  plot_data_1 <- reactive({
    corr <- cor(Filter(is.numeric, data[,-1]))
    corr[abs(corr) <  input$slider1 ] <- 0
    corr
  })
  
  output$ggPlot <- renderPlot({
    ggcorrplot(
      title="Arvväärtuste korrelatsioonimaatriks",
      plot_data_1(),
      lab = TRUE,
      hc.order = F,
      type = "upper",
      outline.col = "white",
      lab_size = 5
     
    )
  })
  
  ################################################################################
  #Tab 6
  
  data_clean <- reactive({
    
    # Remove duplicated data 
    spotify_clean <- data[!duplicated(data$track_id),]
    
    # Assign track_id into rownames
    rownames(spotify_clean) <- spotify_clean$X
    
    # Filter only numeric variables
    spotify_clean <- spotify_clean %>% 
      select(where(is.numeric))
    
    #remove X column
    spotify_clean <- spotify_clean[,-1]
    spotify_clean <- filter(spotify_clean, popularity > 0)
    
    spotify_clean
   
  })
  

  
  radio_kmeans <- reactive({
    input$radio_kmeans
  })
  
  output$kMeansPlot1 <- renderPlot({
    
 
    spotify_kmeans <- readRDS(paste("data/k_means_models/k_means_model_",input$sip_kmeans,".Rds", sep = ""))
 
    
    # Assign cluster column into the dataset
    d_clean <- Filter(is.numeric, data[,-1])
    d_clean$cluster <- spotify_kmeans$cluster
    
    
    # Profilling with summarise data
    d_clean %>% 
      group_by(cluster) %>% 
      summarise_all(mean)
    
  
    
    if(radio_kmeans() == 1){
      ggRadar(
        data=d_clean,
        mapping = aes(colours = cluster),
        interactive = F
      )
    }
    else{
       fviz_cluster(object = spotify_kmeans,
                   data = d_clean, labelsize = 1)
      
    }
    
    
    
    
    
    
  })
    
  
  
  output$kMeansPlot2 <- renderPlot({
    
    set.seed(100)
    d_clean <- data_clean()
    
    spotify_kmeans <- kmeans(x = scale(d_clean), centers = input$sip_kmeans)
    spotify_kmeans
    
    # Assign cluster column into the dataset
    d_clean$cluster <- spotify_kmeans$cluster
    
    
    # Profilling with summarise data
    d_clean %>% 
      group_by(cluster) %>% 
      summarise_all(mean)
    
   ggRadar(
      data=d_clean,
      mapping = aes(colours = cluster),
      interactive = T
    )
    
  })
  
  
  ################################################################################
  #Tab 7
  
  recomment_data <- reactive({
    
    spotify_kmeans <- readRDS(paste("data/k_means_models/k_means_model_3.Rds", sep = ""))
    spotify_kmeans
    
    
    # Assign cluster column into the dataset
    d_clean <- data
    d_clean$cluster <- spotify_kmeans$cluster

    cls = switch(  
      input$sip_cluster_choose,  
      "Live Music"= 2,  
      "Dance Music"= 3,  
      "Music for Study"= 1,  

    )  
    
    spotify_cluster <- d_clean %>% 
      filter(cluster == cls) %>%
      filter(
        if (input$sip_genre_choose != "Iga") {
          track_genre == input$sip_genre_choose
        } else {
          cluster == cls
        }
      ) %>%
      filter(
        if (input$sip_Artist_choose != "Iga") {
          artists == input$sip_Artist_choose
        } else {
          cluster == cls
        }
      ) %>%
      select(artists,track_name,cluster, track_genre, popularity) 

    spotify_cluster$youtubeURL = paste("https://www.youtube.com/results?search_query=", paste(spotify_cluster$artists,spotify_cluster$track_name,sep="+"),sep="")
   
    # sort by mpg
    spotify_cluster <- spotify_cluster[order(-spotify_cluster$popularity),]
    spotify_cluster
    # Remove duplicated data 
    spotify_cluster <- spotify_cluster[!duplicated(spotify_cluster$track_name),]
    spotify_cluster
    
    
  })
  
  
 
  observe({
    genres <- unique(data$track_genre)
    updateSelectizeInput(session, 'sip_genre_choose', choices = c('Iga',as.character(genres)), server=FALSE)
  })
  
  observe({
    artists <- unique(data$artists)
    updateSelectizeInput(session, 'sip_Artist_choose', choices = c('Iga',as.character(artists)), server=FALSE)
  })
  
  
  

  
  output$recommend_tabel <- renderDataTable(recomment_data(), options = 
                                    list(searching = FALSE,ordering=F, 
                                       
                                         pageLength = 10,scrollX = TRUE)) 
  
  ################################################################################
}

