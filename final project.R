# Load necessary libraries
library(rvest)
library(httr)

# Define the function with the argument 'show_id'
scrape_imdb_reviews <- function(show_id) {
  # Define the function with the argument 'show_id'
  scrape_imdb_reviews <- function(show_id) {
    # Construct the IMDb URL using the provided show_id
    imdb_url <- paste0("https://www.imdb.com/title/", show_id, "/reviews")
    
    # Rest of the code for scraping goes here
    
    # Placeholder return for demonstration
    return(imdb_url)
  }
  
  # Example usage:
  imdb_id <- "tt0108778"  # IMDb ID for Friends
  friends_imdb_reviews <- scrape_imdb_reviews(imdb_id)
  
  # Output the IMDb URL
  print(friends_imdb_reviews)
  
# Construct the IMDb URL using the provided show_id
  imdb_url <- paste0("https://www.imdb.com/title/", show_id, "/reviews")
  webpage <- read_html(imdb_url)
  reviews <- html_nodes(webpage, ".text.show-more__control")
  reviews_text <- html_text(reviews)
  return(reviews_text)
 }

# Define a function to scrape reviews from Rotten Tomatoes
scrape_rotten_tomatoes_reviews <- function(show_name) {
  # Define the function with the argument 'show_name'
  scrape_rotten_tomatoes_reviews <- function(show_name) {
    # Construct the Rotten Tomatoes URL using the provided show_name
    rt_url <- paste0("https://www.rottentomatoes.com/tv/", show_name, "/reviews")
    
    # Rest of the code for scraping goes here
    
    # Placeholder return for demonstration
    return(rt_url)
  }
  
  # Example usage:
  show_name <- "friends"  # Name of the show for Friends
  friends_rt_reviews <- scrape_rotten_tomatoes_reviews(show_name)
  
  # Output the Rotten Tomatoes URL
  print(friends_rt_reviews)
  
  rt_url <- paste0("https://www.rottentomatoes.com/tv/", show_name, "/reviews")
  webpage <- read_html(rt_url)
  reviews <- html_nodes(webpage, ".review_body")
  reviews_text <- html_text(reviews)
  return(reviews_text)
}

# Define a function to scrape reviews from Rotten Tomatoes with a delay
scrape_rotten_tomatoes_reviews <- function(show_name) {
  # Construct the Rotten Tomatoes URL using the provided show_name
  rt_url <- paste0("https://www.rottentomatoes.com/tv/", show_name, "/reviews")
  
  # Add a User-Agent header to the request
  headers <- c('User-Agent' = 'Mozilla/5.0')
  
  # Send the GET request with a delay of 5 seconds
  Sys.sleep(5)
  response <- GET(rt_url, add_headers(headers))
  
  # Check if the response was successful
  if (http_error(response)) {
    stop(paste("HTTP error:", http_status(response)$reason))
  }
  
  # Extract reviews from the response
  webpage <- read_html(content(response, "text"))
  reviews <- html_nodes(webpage, ".review_body")
  reviews_text <- html_text(reviews)
  
  return(reviews_text)
}

# Example usage:
show_name <- "friends"
friends_rt_reviews <- scrape_rotten_tomatoes_reviews(show_name)

# Define a function to scrape reviews from Rotten Tomatoes with a delay
scrape_rotten_tomatoes_reviews <- function(show_name) {
  # Construct the Rotten Tomatoes URL using the provided show_name
  rt_url <- paste0("https://www.rottentomatoes.com/tv/", show_name, "/reviews")
  
  # Add a User-Agent header to the request
  headers <- c('User-Agent' = 'Mozilla/5.0')
  
  # Send the GET request with a delay of 5 seconds
  Sys.sleep(5)
  response <- httr::GET(rt_url, httr::add_headers(headers))
  
  # Check if the response was successful
  if (http_error(response)) {
    stop(paste("HTTP error:", http_status(response)$reason))
  }
  
  # Extract reviews from the response
  webpage <- read_html(content(response, "text"))
  reviews <- html_nodes(webpage, ".review_body")
  reviews_text <- html_text(reviews)
  
  return(reviews_text)
}

# Example usage:
show_name <- "friends"
friends_rt_reviews <- scrape_rotten_tomatoes_reviews(show_name)

# Define a function to scrape reviews from Rotten Tomatoes with a delay
scrape_rotten_tomatoes_reviews <- function(show_name) {
  # Construct the Rotten Tomatoes URL using the provided show_name
  rt_url <- paste0("https://www.rottentomatoes.com/tv/", show_name, "/reviews")
  
  # Add a User-Agent header to the request
  headers <- c('User-Agent' = 'Mozilla/5.0')
  
  # Send the GET request with a delay of 5 seconds
  Sys.sleep(5)
  response <- httr::GET(rt_url, httr::add_headers(headers))
  
  # Check the HTTP status code of the response
  if (status_code(response) != 200) {
    stop(paste("HTTP error:", status_reason(response)))
  }
  
  # Extract reviews from the response
  webpage <- read_html(content(response, "text"))
  reviews <- html_nodes(webpage, ".review_body")
  reviews_text <- html_text(reviews)
  
  return(reviews_text)
}

# Example usage:
show_name <- "friends"
friends_rt_reviews <- scrape_rotten_tomatoes_reviews(show_name)

# Example usage:
friends_imdb_reviews <- scrape_imdb_reviews("tt0108778")  # IMDb ID for Friends
friends_rt_reviews <- scrape_rotten_tomatoes_reviews("friends")  # Rotten Tomatoes ID for Friends
big_bang_theory_imdb_reviews <- scrape_imdb_reviews("tt0898266")  # IMDb ID for The Big Bang Theory
big_bang_theory_rt_reviews <- scrape_rotten_tomatoes_reviews("big_bang_theory")  # Rotten Tomatoes ID for The Big Bang Theory

# Display the reviews
cat("Friends IMDb Reviews:\n")
cat(friends_imdb_reviews, sep = "\n")
cat("\nFriends Rotten Tomatoes Reviews:\n")
cat(friends_rt_reviews, sep = "\n")
cat("\nThe Big Bang Theory IMDb Reviews:\n")
cat(big_bang_theory_imdb_reviews, sep = "\n")
cat("\nThe Big Bang Theory Rotten Tomatoes Reviews:\n")
cat(big_bang_theory_rt_reviews, sep = "\n")

# Create a data frame with IMDb IDs and show names
shows_data <- data.frame(
  IMDb_ID = c("tt0108778", "tt0898266"),  # IMDb IDs for Friends and The Big Bang Theory
  Show_Name = c("Friends", "The Big Bang Theory")
)

# Write the data frame to a CSV file
write.csv(shows_data, file = "shows_data.csv", row.names = FALSE)

# Print a message indicating the file has been created
cat("CSV file 'shows_data.csv' has been created.\n")
