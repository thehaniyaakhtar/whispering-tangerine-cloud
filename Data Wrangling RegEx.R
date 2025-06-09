library(dplyr)
library(stringr)

#sample data frame
df <- data.frame(
  CITY = c("Melbourne[12]", "Paris", "London[7]"),
  SYSTEM = c("BikeShare[3]", "Vélib", "Santander[5]"),
  BICYCLES = c("1000[253]", "3200", "1200 (including e-bikes)")
)

#Define RegEx pattern for reference links
ref_pattern <- "\\[[A-z0-9]+\\]" #find anything in square brackets and remove it

#Removing reference links
remove_references <- function(x) {
  str_replace_all(x, ref_pattern, "")
}

#Extract numbers from messy numeric strings
extract_numbers <- function(x) {
  str_extracts(x, "[0-9]+") #extract any digit from 0-9, + : one or more digits in a row
}

clean_df <- df %>%
  mutate(
    CITY = remove_references(CITY),
    SYSTEM = remove_references(SYSTEM),
    BICYCLES = extract_numbers(BICYCLES)
  )

#convert bicycle columns to numeric types
clean_df$BICYCLES <- as.numeric(clean_df$BICYCLES)

print(clean_df)
