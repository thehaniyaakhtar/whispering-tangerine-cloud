# IDE ----------------------------------------------------------------------

# IDE (Integrated Development Environment) is a pre-configured set of tools for programming
# R has its own IDE called RStudio
# The > symbol denotes the R console where commands can be issued

# Creating Your First Program ----------------------------------------------

# Create a new R program file
file.create("hello.R")  # Creates a file named hello.R in the working directory
# [1] TRUE indicates successful creation

# In the hello.R file editor:
print("hello, world")  # Basic print function to display text

# Run the program by clicking the Run button in RStudio

# Functions ---------------------------------------------------------------

# Functions execute a set of instructions
print("hello, world")  # print is a function, "hello, world" is its argument

# Bugs --------------------------------------------------------------------

# Demonstrates a bug (unintentional mistake in code)
prin("hello, world")  # Missing 't' in print causes an error
# Debugging is the process of finding and fixing bugs

# readline ----------------------------------------------------------------

# Reads input from user
name <- readline("What's your name? ")  # Stores user input in 'name' variable
print("Hello, Carter")  # Static output (bug - always shows Carter)

# Corrected version storing and using user input:
name <- readline("What's your name? ")  # <- is the assignment operator
print("Hello, name")  # Still has a bug (prints literal "name")

# paste -------------------------------------------------------------------

# Corrected version using string concatenation:
name <- readline("What's your name? ")
greeting <- paste("Hello, ", name)  # Combines strings with a space
print(greeting)  # Still has extra space between comma and name

# Improved version controlling separator:
greeting <- paste("Hello, ", name, sep = "")  # sep="" removes default space
# Or using paste0 (equivalent to paste with sep=""):
greeting <- paste0("Hello, ", name)

# Final simplified version:
name <- readline("What's your name? ")
print(paste("Hello,", name))  # Nested functions (print and paste)

# Arithmetic --------------------------------------------------------------

# New program to count votes (count.R)
mario <- readline("Enter votes for Mario: ")  # Reads as character/string
peach <- readline("Enter votes for Peach: ")
bowser <- readline("Enter votes for Bowser: ")

# Convert to integers for arithmetic:
mario <- as.integer(mario)
peach <- as.integer(peach)
bowser <- as.integer(bowser)

total <- mario + peach + bowser  # + is arithmetic operator
print(paste("Total votes:", total))

# Simplified version:
total <- sum(mario, peach, bowser)  # sum() function adds multiple values

# Tables ------------------------------------------------------------------

# Clear environment before working with tables
ls()  # List all variables
rm(list = ls())  # Remove all variables
ls()  # Verify environment is clear

# Read table from CSV file:
votes <- read.table("votes.csv")  # Basic table reading
View(votes)  # Displays table in separate tab

# Improved table reading with proper separators and headers:
votes <- read.table(
  "votes.csv",
  sep = ",",  # Specifies comma as column separator
  header = TRUE  # Treats first row as column headers
)

# Simplified CSV reading:
votes <- read.csv("votes.csv")  # Built-in CSV reader with proper defaults

# Accessing table data:
votes[, 1]  # First column (all rows)
votes[, 2]  # Second column
colnames(votes)  # View column names
votes$candidate  # Access column by name
votes$poll  # Access another column

# Vectors -----------------------------------------------------------------

# Vectors are lists of values with the same storage mode
sum(votes$poll[1], votes$poll[2], votes$poll[3])  # Sum specific rows
sum(votes$poll)  # Sum entire vector (more dynamic)

# Vector Arithmetic -------------------------------------------------------

# Element-wise addition of vectors:
votes$poll + votes$mail  # Adds corresponding elements

# Store result and write to new file:
votes$total <- votes$poll + votes$mail
write.csv(votes, "totals.csv", row.names = FALSE)  # Exclude row names

# External Data -----------------------------------------------------------

# Read data directly from URL:
url <- "https://github.com/fivethirtyeight/data/raw/master/non-voters/nonvoters_data.csv"
voters <- read.csv(url)

# Get dataset dimensions:
nrow(voters)  # Number of rows
ncol(voters)  # Number of columns

# Find unique values in a column:
unique(voters$voter_category)  # Distinct values in voter_category

# Special Values ----------------------------------------------------------

# NA represents "not available" (missing data)
voters$Q22  # View column with NA values
unique(voters$Q22)  # See all possible values including NA

# Other special values:
# Inf, -Inf: Infinite values
# NaN: Not a Number
# NULL: Null/none value

# factor ------------------------------------------------------------------

# Convert numeric codes to meaningful labels:
voters$Q21  # View numeric codes

factor(
  voters$Q21,
  labels = c("?", "Yes", "No", "Unsure/Undecided")  # Map codes to labels
)

# Exclude unwanted values from factors:
voters$Q21 <- factor(
  voters$Q21,
  labels = c("Yes", "No", "Unsure/Undecided"),  # New labels
  exclude = c(-1)  # Exclude -1 values
)