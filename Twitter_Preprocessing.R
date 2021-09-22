#importing the libraries
library(utils)
library(base)
library(dplyr)
library(rvest)

df <- read.csv("https://raw.githubusercontent.com/RaghavAgrawal17/Twitter_analysis/main/19BDS0170_Twitter_Tweets.csv",na.strings = c("", "NA"))

df <- df %>%
  filter(favorited %in% c("FALSE","TRUE"))
df <- select(df,1:14)

df$retweetCount <- as.integer(df$retweetCount)
df$favoriteCount <- as.integer(df$favoriteCount)

df$created <- strptime(df$created,format="%d-%m-%Y %H:%M")

plain_text <- function(source){
  html <- minimal_html(source)
  content <- html_elements(html, "a")
  return(html_text(content))
}
df$statusSource <- lapply(df$statusSource, plain_text)

df <- select(df,1,3:13)

summary(df)
