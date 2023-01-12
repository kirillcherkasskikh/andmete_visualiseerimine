Tab1 <- tabPanel("Rakenduse kirjeldus",  icon = icon("fa-light fa-book"), 
         bootstrapPage(
                  div( img(src = "spotify.jpg", width = 1076/3, height = 720/3), style="justify-content: center; display: flex;"),
          
                  h4("Projekti kirjeldus"),
                  p("M�ne inimese jaoks on muusika kuulamine on �ks nende vaba aja tegevustest. Isegi on inimesi, kes nimetavad seda oma hobiks. �ks populaarsemaid platvorme muusika kuulamiseks on spotify. Spotifyl on soovituss�steem, mis saab oma muusika kasutajaid nende maitse j�rgi kohandada."),
                  p("Selle projekti raames proovime Spotify andmestiku p�hjal teha muusikasoovitust. Kasutame K-Meansi r�hmitusalgoritmi, mis liigitatakse masin�ppes j�relevalveta �ppimiseks."),
                  p("Andmed p�rinevad veebikeskkonnas Kaggle ning on esitatud .csv formaadis. Andmete asukoht:"),
                  a("https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset"),
                  hr(),
                  h4("Projekti eesm�rgid:"),
                  p("1. Anda �levaade spotify laulude andmebaasist"),
                  p("2. Teostada andmete esialgse visuaalse analuusi s�ltuvuste defineerimiseks."),
                  p("3. Iga laulu klastri m��ramiseks k-keskmiste algoritmi abil"),
                  p("4. Luua soovituss�steem"),
                  hr(),
           
         )
)