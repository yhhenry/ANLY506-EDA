getwd()
setwd(dir = "C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis")
#to find the existing objects in current workspace
ls()
#try to find a non existing object
study3.df


# Create some objects that we'll save later
study1.df <- data.frame(id = 1:5, 
                        sex = c("m", "m", "f", "f", "m"), 
                        score = c(51, 20, 67, 52, 42))

score.by.sex <- aggregate(score ~ sex, 
                          FUN = mean, 
                          data = study1.df)

study1.htest <- t.test(score ~ sex, 
                       data = study1.df)

study1.df

save(study1.df,score.by.sex,study1.htest,file="C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis/study1.RData")


# Save my workspace to complete_image.RData in th,e
#  data folder of my working directory
save.image(file = "C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis/projectimage.RData")

# Load objects in study1.RData into my workspace
load(file = "C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis/study1.RData")

# Load objects in projectimage.RData into my workspace
load(file = "C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis/projectimage.RData")

# Remove huge.df from workspace
rm(study1.df)

# Remove ALL objects from workspace
rm(list = ls())


# Write the pirates dataframe object to a tab-delimited
#  text file called pirates.txt in my working directory

write.table(x = study1.df,
            file = "pirates.txt",  # Save the file as pirates.txt
            sep = "\t")            # Make the columns tab-delimited


# Write the pirates dataframe object to a tab-delimited
#  text file called pirates.txt to my desktop

write.table(x = study1.df,
            file = "C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis/pirates.txt",  # Save the file as pirates.txt to my desktop
            sep = "\t")                                    # Make the columns tab-delimited

# Read a tab-delimited text file called mydata.txt 
#  from the data folder in my working directory into
#  R and store as a new object called mydata

mydata <- read.table(file = 'C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis/pirates.txt',    # file is in a data folder in my working directory
                     sep = '\t',                  # file is tab--delimited
                     header = TRUE,               # the first row of the data is a header row
                     stringsAsFactors = FALSE)    # do NOT convert strings to factors!!


# Read a text file from the web
fromweb <- read.table(file = 'http://goo.gl/jTNf6P',
                      sep = '\t',
                      header = TRUE)







a <- data.frame("sex" = c("m", "f", "m"),
                "age" = c(19, 43, 25),
                "favorite.movie" = c("Moon", "The Goonies", "Spice World"))
b <- mean(a$age)

c <- table(a$sex)
ls()

club <- read.table(file = 'http://nathanieldphillips.com/wp-content/uploads/2015/12/club.txt',
                      sep = '\t',
                      header = TRUE)

write.table(x = club,
            file = "C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis/club.txt",  # Save the file as pirates.txt to my desktop
            sep = "\t")

save(a,b,c,club.df,file="C:/Users/yg/Desktop/HU Master/ANLY 506 - Exploratory Data Analysis/myobjects.RData")
rm(list = ls())


