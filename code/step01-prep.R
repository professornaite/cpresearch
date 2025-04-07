# this file will prepare the data for analysis

# load libraries
library(readr)
library(dplyr)
library(tidyverse)
library(ggplot2)

# call in data sets
sentences <- read.csv("data/sentences.csv")
str(sentences)




# Plot gender distribution
ggplot(sentences, aes(x = Gender)) +
  geom_bar(fill = "skyblue") +
  labs(title = "Gender Distribution of Defendants", x = "Gender", y = "Count") +
  theme_minimal()

# Plot race distribution
ggplot(sentences, aes(x = Races)) +
  geom_bar(fill = "lightgreen") +
  labs(title = "Race Distribution of Defendants", x = "Race", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Histogram of sentences by year
ggplot(sentences, aes(x = Year)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Sentences Over Time", x = "Year", y = "Count") +
  theme_minimal()

# Line plot for sentences over time
yearly <- yearly_counts <- sentences %>%
  group_by(Year) %>%
  summarise(Count = n())

ggplot(yearly_counts, aes(x = Year, y = Count)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "Trend of Sentences Over Time", x = "Year", y = "Count") +
  theme_minimal()

# Plot regional distribution
regional <- ggplot(sentences, aes(x = Region)) +
  geom_bar(fill = "purple") +
  labs(title = "Regional Distribution of Sentences", x = "Region", y = "Count") +
  theme_minimal()


# Bar plot for state-wise sentence distribution
ggplot(sentences, aes(x = State.Abbreviation)) +
  geom_bar(fill = "pink") +
  labs(title = "State-wise Sentence Distribution", x = "State", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Gender vs Race interaction
ggplot(sentences, aes(x = Races, fill = Gender)) +
  geom_bar(position="dodge") +
  labs(title="Race Distribution by Gender", x="Race", y="Count", fill="Gender") +
  theme_minimal() +
  theme(axis.text.x=element_text(angle=45, hjust=1))

