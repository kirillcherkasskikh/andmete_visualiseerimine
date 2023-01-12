# Read data
data <- read.csv("data/dataset.csv", encoding = "UTF-8")

# Customizing the data type
data <- data %>% 
  mutate(artists = as.character(artists),
         track_name = as.character(track_name),
         track_id = as.character(track_id),
         mode = as.factor(mode),
         key = as.factor(key),
         time_signature = as.factor(time_signature),
         explicit = as.factor(explicit),
         track_genre = as.factor(track_genre),
                             
         duration_ms = round(duration_ms/6000,digits = 2)) %>% 
  rename(duration_min = duration_ms)

# Clean track_id
data <- data %>% 
  rename(del1 = track_id,
         track_id =  X)

#remove old track id column
data <- data[,-2]

# Remove duplicated data 
data <- data[!duplicated(data$track_id),]

# Assign track_id into rownames
rownames(data) <- data$track_id

data <- filter(data, popularity > 0)

############################################################

