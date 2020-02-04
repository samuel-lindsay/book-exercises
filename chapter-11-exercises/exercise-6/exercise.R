# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?

avg_dest_delays <- flights %>% group_by(dest) %>% summarize(avg_delay = mean(arr_delay, na.rm=TRUE)) %>% rename(faa = dest)
avg_dest_delays <- left_join(avg_dest_delays, airports, by="faa")
print(paste("The airport with the greatest name is", avg_dest_delays %>% filter(avg_delay == max(avg_delay, na.rm = TRUE)) %>% pull(name)))

# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?

avg_airline_delays <- flights %>% group_by(carrier) %>% summarize(avg_delay = mean(arr_delay, na.rm=TRUE)) %>% left_join(airlines, by="carrier")
print(paste("The airline with the greatest average delay is", avg_airline_delays %>% filter(avg_delay == max(avg_delay, na.rm = TRUE)) %>% pull(name)))
