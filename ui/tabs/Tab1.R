Tab1 <- tabPanel("Rakenduse kirjeldus",  icon = icon("fa-light fa-book"), 
         bootstrapPage(
                  div( img(src = "spotify.jpg", width = 1076/3, height = 720/3), style="justify-content: center; display: flex;"),
          
                  h4("Projekti kirjeldus"),
                  p("Mone inimese jaoks on muusika kuulamine on uks nende vaba aja tegevustest. Isegi on inimesi, kes nimetavad seda oma hobiks. uks populaarsemaid platvorme muusika kuulamiseks on spotify. Spotifyl on soovitussusteem, mis saab oma muusika kasutajaid nende maitse jargi kohandada."),
                  p("Selle projekti raames proovime Spotify andmestiku pohjal teha muusikasoovitust. Kasutame K-Meansi ruhmitusalgoritmi, mis liigitatakse masinoppes jarelevalveta oppimiseks."),
                  p("Andmed parinevad veebikeskkonnas Kaggle ning on esitatud .csv formaadis. Andmete asukoht:"),
                  a("https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset"),
                  hr(),
                  h4("Projekti eesmargid:"),
                  p("1. Anda ulevaade spotify laulude andmebaasist"),
                  p("2. Teostada andmete esialgse visuaalse analuusi soltuvuste defineerimiseks."),
                  p("3. Iga laulu klastri maaramiseks k-keskmiste algoritmi abil"),
                  p("4. Luua soovitussusteem"),
                  hr(),
           
         )
)