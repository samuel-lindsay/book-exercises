# Exercise 1: reading and querying a web API

# Load the httr and jsonlite libraries for accessing data
# You can also load `dplyr` if you wish to use it
library(httr)
library(jsonlite)
library(dplyr)

# Create a variable base_uri that stores the base URI (as a string) for the 
# Github API (https://api.github.com)
base_uri <- "https://api.github.com"

# Under the "Repositories" category of the API documentation, find the endpoint 
# that will list _repos in an organization_. Then create a variable named
# `org_resource` that stores the endpoint for the `programming-for-data-science`
# organization repos (this is the _path_ to the resource of interest).
org_resource <- "/orgs/programming-for-data-science/repos"

# Send a GET request to this endpoint (the `base_uri` followed by the 
# `org_resource` path). Print the response to show that your request worked. 
# (The listed URI will also allow you to inspect the JSON in the browser easily).

request <- GET(paste0(base_uri, org_resource))
print(request)

# Extract the content of the response using the `content()` function, saving it
# in a variable.

data <- content(request, type="text")

# Convert the content variable from a JSON string into a data frame.

content_df <- fromJSON(data)

# How many (public) repositories does the organization have?

nrow(content_df)
#20 public repositories!

# Now a second query:
# Create a variable `search_endpoint` that stores the endpoint used to search 
# for repositories. (Hint: look for a "Search" endpoint in the documentation).

search_endpoint <- "/search/repositories"

# Search queries require a query parameter (for what to search for). Create a 
# `query_params` list variable that specifies an appropriate key and value for 
# the search term (you can search for anything you want!)

query_params = list(q="machine learning", order="desc")

# Send a GET request to the `search_endpoint`--including your params list as the
# `query`. Print the response to show that your request worked.

search <- GET(paste0(base_uri, search_endpoint), query_params)
print(search)

# Extract the content of the response and convert it from a JSON string into a
# data frame. 


# How many search repos did your search find? (Hint: check the list names to 
# find an appropriate value).


# What are the full names of the top 5 repos in the search results?

##NOTE TO THE GRADER: I think I got locked out of the Github API or something, because
##I would continuously get a "validation failed" error message.