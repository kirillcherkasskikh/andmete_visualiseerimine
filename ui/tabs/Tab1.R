Tab1 <- tabPanel("Rakenduse kirjeldus",  icon = icon("fa-light fa-book"), 
         bootstrapPage(
                  div( img(src = "spotify.jpg", width = 1076/3, height = 720/3), style="justify-content: center; display: flex;"),
          
                  h4("Projekti kirjeldus"),
                  p("Mõne inimese jaoks on muusika kuulamine on üks nende vaba aja tegevustest. Isegi on inimesi, kes nimetavad seda oma hobiks. Üks populaarsemaid platvorme muusika kuulamiseks on spotify. Spotifyl on soovitussüsteem, mis saab oma muusika kasutajaid nende maitse järgi kohandada."),
                  p("Selle projekti raames proovime Spotify andmestiku põhjal teha muusikasoovitust. Kasutame K-Meansi rühmitusalgoritmi, mis liigitatakse masinõppes järelevalveta õppimiseks."),
                  p("Andmed pärinevad veebikeskkonnas Kaggle ning on esitatud .csv formaadis. Andmete asukoht:"),
                  a("https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset"),
                  hr(),
                  h4("Projekti eesmärgid:"),
                  p("1. Anda ülevaade spotify laulude andmebaasist"),
                  p("2. Teostada andmete esialgse visuaalse analuusi sõltuvuste defineerimiseks."),
                  p("3. Iga laulu klastri määramiseks k-keskmiste algoritmi abil"),
                  p("4. Luua soovitussüsteem"),
                  hr(),
           
         )
)