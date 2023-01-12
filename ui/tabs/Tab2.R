Tab2 <- tabPanel("Andmed", icon = icon("fa-regular fa-database"), 
                 sidebarLayout(
                   sidebarPanel(
                     h4("Tunnused"),
                      tags$ul(
                        tags$li(div("track_id", style="font-weight: bold;"), p("Järjekorra number")),
                        tags$li(div("artists", style="font-weight: bold;"), p("Laulu esitanud artistide nimed. Kui esinejaid on rohkem kui üks, eraldatakse need tähemärgiga ;")),
                        tags$li(div("album_name", style="font-weight: bold;"), p("Albumi nimi, milles lugu kuvatakse")),
                        tags$li(div("track_name", style="font-weight: bold;"), p("Laulu nimi")),
                        tags$li(div("popularity", style="font-weight: bold;"), p("Laulu populaarsus on väärtus vahemikus 0 kuni 100, kusjuures 100 on kõige populaarsem")),
                        tags$li(div("duration_ms", style="font-weight: bold;"), p("Laulu pikkus millisekundites")),
                        tags$li(div("explicit", style="font-weight: bold;"), p("Kas laulul on selgesõnalised sõnad või mitte (tõene = jah, on; vale = ei, pole VÕI teadmata")),
                        tags$li(div("danceability", style="font-weight: bold;"), p("Tantsitavus kirjeldab, kui laul tantsimiseks sobib")),
                        tags$li(div("energy", style="font-weight: bold;"), p("Energia on mõõt vahemikus 0,0 kuni 1,0 ja see tähistab intensiivsuse ja aktiivsuse tajumist")),
                        tags$li(div("key", style="font-weight: bold;"), p("Võti, milles laul on")),
                        tags$li(div("loudness", style="font-weight: bold;"), p("Loo üldine helitugevus detsibellides (dB)")),
                        tags$li(div("mode", style="font-weight: bold;"), p("Reşiim näitab pala modaalsust (duur või moll), skaala tüüpi, millest selle meloodiline sisu tuleneb.")),
                        tags$li(div("speechiness", style="font-weight: bold;"), p("Kõnevõime tuvastab öeldud sõnade olemasolu laulus.")),
                        tags$li(div("acousticness", style="font-weight: bold;"), p("Usaldusväärsuse mõõt vahemikus 0,0 kuni 1,0 selle kohta, kas lugu on akustiline.")),
                        tags$li(div("instrumentalness", style="font-weight: bold;"), p("Ennustab, kas laul ei sisalda vokaali")),
                        tags$li(div("liveness", style="font-weight: bold;"), p("Tuvastab salvestusel publiku kohaloleku")),
                        tags$li(div("valence", style="font-weight: bold;"), p("Mõõt vahemikus 0,0 kuni 1,0, mis kirjeldab laulu edasikantavat muusikalist positiivsust.")),
                        tags$li(div("tempo", style="font-weight: bold;"), p("Hinnanguline tempo löökides minutis (BPM)")),
                        tags$li(div("time_signature", style="font-weight: bold;"), p("Hinnanguline taktimõõt")),
                        tags$li(div("track_genre", style="font-weight: bold;"), p("Şanr, millesse laul kuulub")),
                        )
                    ),
                 mainPanel(
                   br(),
                   div(
                     valueBoxOutput("vbox1"),
                     class="valuebx"
                   ),
                   div(
                     valueBoxOutput("vbox2"),
                     class="valuebx"
                   ),
                   div(
                     valueBoxOutput("vbox3"),
                     class="valuebx"
                   ),
                   br(),
                   dataTableOutput("tabel"),
                   br(),
                   verbatimTextOutput("table_summary"),
                  
                 )
                 )
        )