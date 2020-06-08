# Load packages for data wrangling and visualization
install.packages("dplyr")
install.packages("tidyr")

library("dplyr")
library("tidyr")
# Load .csv file of notices
notices <- read.csv("D:/Practice R/Eviction_Notices.csv",
                    stringsAsFactors = F)

head(notices)
# Data wrangling: format dates, filter to 2017 notices,extract lat/long data

notices <- notices %>%
  mutate(date = as.Date(File.Date, format="%m/%d/%y")) %>%
  filter(format(date, "%Y") == "2017") %>%
  separate(Location, c("lat", "long"), ", ") %>%    # split column at the comma
  
  mutate(
    lat = as.numeric(gsub("\\(", "", lat)), # removestarting parentheses
    long = as.numeric(gsub("\\)", "", long)) # remove  closing parentheses
  ) 

print(notices)

df <- data.frame(x = c("POINT (-13 234.8512890111102347)", "POINT (-234 12.5)", "POINT (-256 567.5)"))
print(df)

df <- df %>% separate(x, c(NA, "B"), " ", extra="merge") %>% separate(B, c("lat", "long")," ")

as.numeric(gsub("\\(","",df$lat), options(digits = 15))
as.double(gsub("\\)", "", df$long), options(digits = 20)) # remove closing parentheses

df7 <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
df7 %>% separate(x, c("A", "B"))

print(df)
