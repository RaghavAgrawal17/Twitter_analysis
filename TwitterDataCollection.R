library(twitteR)
library(jsonlite)
library(httr)

consumer_key <- "XXXXXXXXXXXXXXXXXX"
consumer_secret <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
access_token <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
access_secret <- "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)

tweets <- searchTwitter("taliban + Afghanistan",n=200,lang="en",resultType="recent")


tweets_df <- twListToDF(tweets)
message("Retrieved data for date: ",Sys.Date())
View(tweets_df)

j <- toJSON(tweets_df,pretty=TRUE)
j

write.table(tweets_df,"19BDS0170_Twitter_Tweets.csv",sep=",",append = TRUE,
            row.names = FALSE,col.names = ifelse(file.exists("19BDS0170_Twitter_Tweets.csv"),
                                                 FALSE,TRUE))


