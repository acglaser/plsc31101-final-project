con <- DBI::dbConnect(
  bigquery(),
  project = "bigquery-public-data",
  dataset = "google_political_ads",
  billing = "plsc-31101"
)

DBI::dbListTables(con)
advertiser_stats <- tbl(con, "advertiser_stats")
x <- advertiser_stats %>% 
  filter(elections == "US-Federal",
         spend_usd >= 1000000) %>%
  arrange(desc(spend_usd)) %>%
  collect(n=10)

show_query(x)
x
