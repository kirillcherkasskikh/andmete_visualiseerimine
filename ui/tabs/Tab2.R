Tab2 <- tabPanel("Andmed", icon = icon("fa-regular fa-database"), 
                 sidebarLayout(
                   sidebarPanel(
                     h4("Tunnused"),
                      tags$ul(
                        tags$li(div("track_id", style="font-weight: bold;"), p("J�rjekorra number")),
                        tags$li(div("artists", style="font-weight: bold;"), p("Laulu esitanud artistide nimed. Kui esinejaid on rohkem kui �ks, eraldatakse need t�hem�rgiga ;")),
                        tags$li(div("album_name", style="font-weight: bold;"), p("Albumi nimi, milles lugu kuvatakse")),
                        tags$li(div("track_name", style="font-weight: bold;"), p("Laulu nimi")),
                        tags$li(div("popularity", style="font-weight: bold;"), p("Laulu populaarsus on v��rtus vahemikus 0 kuni 100, kusjuures 100 on k�ige populaarsem")),
                        tags$li(div("duration_ms", style="font-weight: bold;"), p("Laulu pikkus millisekundites")),
                        tags$li(div("explicit", style="font-weight: bold;"), p("Kas laulul on selges�nalised s�nad v�i mitte (t�ene = jah, on; vale = ei, pole V�I teadmata")),
                        tags$li(div("danceability", style="font-weight: bold;"), p("Tantsitavus kirjeldab, kui laul tantsimiseks sobib")),
                        tags$li(div("energy", style="font-weight: bold;"), p("Energia on m��t vahemikus 0,0 kuni 1,0 ja see t�histab intensiivsuse ja aktiivsuse tajumist")),
                        tags$li(div("key", style="font-weight: bold;"), p("V�ti, milles laul on")),
                        tags$li(div("loudness", style="font-weight: bold;"), p("Loo �ldine helitugevus detsibellides (dB)")),
                        tags$li(div("mode", style="font-weight: bold;"), p("Re�iim n�itab pala modaalsust (duur v�i moll), skaala t��pi, millest selle meloodiline sisu tuleneb.")),
                        tags$li(div("speechiness", style="font-weight: bold;"), p("K�nev�ime tuvastab �eldud s�nade olemasolu laulus.")),
                        tags$li(div("acousticness", style="font-weight: bold;"), p("Usaldusv��rsuse m��t vahemikus 0,0 kuni 1,0 selle kohta, kas lugu on akustiline.")),
                        tags$li(div("instrumentalness", style="font-weight: bold;"), p("Ennustab, kas laul ei sisalda vokaali")),
                        tags$li(div("liveness", style="font-weight: bold;"), p("Tuvastab salvestusel publiku kohaloleku")),
                        tags$li(div("valence", style="font-weight: bold;"), p("M��t vahemikus 0,0 kuni 1,0, mis kirjeldab laulu edasikantavat muusikalist positiivsust.")),
                        tags$li(div("tempo", style="font-weight: bold;"), p("Hinnanguline tempo l��kides minutis (BPM)")),
                        tags$li(div("time_signature", style="font-weight: bold;"), p("Hinnanguline taktim��t")),
                        tags$li(div("track_genre", style="font-weight: bold;"), p("�anr, millesse laul kuulub")),
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