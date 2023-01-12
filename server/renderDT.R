#render table
renderDT <- renderDataTable(data, options = 
                                  list(searching = FALSE,ordering=F, 
                                       lengthMenu = c(5, 10, 20),
                                       pageLength = 5,scrollX = TRUE)) 