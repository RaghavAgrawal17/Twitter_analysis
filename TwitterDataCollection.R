library(twitteR)
library(jsonlite)
library(httr)

consumer_key <- "J2QI9Amqdou8RWIYmBVdvqv8R"
consumer_secret <- "NWU2Pp3JKWckH9YgdUPcp2fy45Z6f2kFc0ye2FTsX0M7be8kOq"
access_token <- "1427924939189854213-E3tssSlmq7CP9TnVCSfb8rzUzbPQH9"
access_secret <- "fCtfKkxNxxvhikTdyI78zVSdyMFNJUR1MSjde6JnvUrQT"

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


