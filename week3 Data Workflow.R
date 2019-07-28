##Read in your data
library(readr)
ozone <- read_csv("C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis/week3/US EPA data 2017.csv")

names(ozone) <- make.names(names(ozone))
nrow(ozone)

ncol(ozone)

#Run str()
str(ozone)

#Look at the top and the bottom of your data

head(ozone[, c(6:7, 10)])
tail(ozone[, c(6:7, 10)])

#Check your "n"s
table(ozone$Valid.Day.Count)

mean(ozone$Observation.Count)
library(dplyr)
filter(ozone, Valid.Day.Count == "100:200") %>% 
  +         select(ozone$State.Code, County.Code, Date, 
                   +                Valid.Day.Count)
# A tibble: 2 × 5
# ... with 1 more variables:
#   Sample.Measurement <dbl>

filter(ozone, State.Code == "36" 
       +        & County.Code == "033") %>%
  +         select(ozone$Valid.Day.Count) %>% 
  +         as.data.frame

select(ozone, State.Code) %>% unique %>% nrow
unique(ozone$State.Code)
unique(ozone$State.Name)


#validate with at least one external data source
summary(ozone$Observation.Count)
quantile(ozone$Observation.Count, seq(0, 1, 0.1))

#Try the easy solution first
ranking <- group_by(ozone, State.Name, County.Name) %>%
  +         summarize(ozone = mean(Sample.Measurement)) %>%
  +         as.data.frame %>%
  +         arrange(desc(ozone))

head(ranking, 10)

tail(ranking, 10)

filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>% nrow

ozone <- mutate(ozone, Date.Local = as.Date(Date.Local))

filter(ozone, State.Name == "California" & County.Name == "Mariposa") %>%
  +         mutate(month = factor(months(Date.Local), levels = month.name)) %>%
  +         group_by(month) %>%
  +         summarize(ozone = mean(Sample.Measurement))

filter(ozone, State.Name == "Oklahoma" & County.Name == "Caddo") %>% nrow

filter(ozone, State.Name == "Oklahoma" & County.Name == "Caddo") %>%
  +         mutate(month = factor(months(Date.Local), levels = month.name)) %>%
  +         group_by(month) %>%
  +         summarize(ozone = mean(Sample.Measurement))

#Challenge your solution

set.seed(10234)
N <- nrow(ozone)
idx <- sample(N, N, replace = TRUE)
ozone2 <- ozone[idx, ]

ranking2 <- group_by(ozone2, State.Name, County.Name) %>%
  +         summarize(ozone = mean(Sample.Measurement)) %>%
  +         as.data.frame %>%
  +         arrange(desc(ozone))

cbind(head(ranking, 10),
      +       head(ranking2, 10))

cbind(tail(ranking, 10),
      +       tail(ranking2, 10))

