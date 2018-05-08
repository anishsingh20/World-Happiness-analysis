require(shinydashboard)
require(shiny)
require(dplyr)
require(highcharter)
require(tidyr)




#reading the datasets
year_2015<-read.csv(file = "2015.csv")
year_2016<-read.csv(file = "2016.csv")
year_2017<-read.csv(file = "2017.csv")


#function to remove columns with NA values
remove_col<-function(df,x,colNum)
{
  df<-df[-colNum] #exculding column 
  df #returns a updated dataframe with removed column X
  
  #can also use df[col]<-NULL to remove a dataframe
  
}

#removing NA values
year_2015<-remove_col(year_2015,X,13)
year_2016<-remove_col(year_2016,X,14)
year_2017<-remove_col(year_2017,X,13)





server<-function(input,output)
{
  output$MostHappy<-highchartOutput({
    
  })  
}
