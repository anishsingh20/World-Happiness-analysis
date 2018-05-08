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




#UI of the app


dashboardPage(
  skin="black",
  dashboardHeader(title="Kaggle Survey Data analysis") ,
  
  #dashboard sidebar
  dashboardSidebar(
    sidebarMenu(
      
      menuItem("Home", tabName = "tab1",icon=icon("dashboard")) ,
      menuItem("Country-wise Analysis", tabName = "tab2")
      
      
    )
    
  ) ,
  
  #body of the dashboard
  dashboardBody(
  
      tabItems(
        
        #tab1
        tabItem(tabName = "tab1",
                h2("WorldWide Happpiness Analysis",
                   align="center",style="margin-top:-5px;"),
                br())
    )
  )
  
)


