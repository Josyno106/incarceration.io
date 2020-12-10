#################################question 1 : Trends Over Time Chart 

# Load ggplot2
library("ggplot2")

#load data from the csv file ans store in a variable for global access
trends <- read.csv("incarceration_trends.csv")

#print the data to console
trends

#all the data was loaded to the trends variables. 
#we extract the data we want only and continue to plotting the graph
#here, we use the subset function to extract the data we from the dataset
data <- subset(trends, state== "AL" & year>1990)

head(data)

plot(data$year, data$black_prison_pop, type= 'l', 
     ylab='Black Prison Population', xlab = 'Years',main = 'Population of Incarcerated Black People in AL State from 1990 - 2015')








####################### Question 2: Variable Comparison Chart###########

#load tidyverse
library(tidyverse)


#here, we use the subset function to extract the data we from the dataset
data <- subset(trends, state== "AL" & year>1990)

#now we extract the two data variables that we need to compare
mainData<- data.frame(year= data$year,
                      black_prisoners = data$black_prison_pop,
                      white_prisoners = data$white_prison_pop,
                      prison_admission = data$total_prison_adm_rate
)
#set the new data frame as the head
head(mainData)
# Line plot in ggplot2 with groups
mainData %>% gather(key = "Legends", value = "Prison_Population", -year) %>%
  ggplot(aes(x = year, y = Prison_Population, color = Legends), ggtitle("Black Vs White Incarceration")) +
  geom_smooth(method = 'lm') +
  scale_color_manual(values = c("tomato3","goldenrod","skyblue2"))



#################################################question 3 : Geographic Distribution dataMap #########
#load the maps library 
library(usmap)
# Load ggplot2
library("ggplot2")

#set the data to display in the map
data <- subset(trends, year>2005)

#Now display the data on the Map
plot_usmap(
  data = data, values = "black_prison_pop" , color = "red"
) + 
  scale_fill_continuous(
    low = "white", high = "red", name = "Number of Incarcerated People", label = scales::comma
  ) + 
  labs(title = "Incarcelation of Black People Across the United States of America", subtitle = "Date Range : 2005-2015") +
  theme(legend.position = "right")




