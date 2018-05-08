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
  skin="purple",
  dashboardHeader(title="Happpiness Analysis") ,
  
  #dashboard sidebar
  dashboardSidebar(
    
    sidebarMenu(
      
      menuItem("Home", tabName = "tab1",icon=icon("dashboard")) ,
      menuItem("Correlation", tabName = "tab2") ,
      menuItem("Country-wise Analysis", tabName = "tab3")
      
      
    )
    
  ) ,
  
  #body of the dashboard
  dashboardBody(
    
    #adding custom-css
    tags$head
    (
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
  
      tabItems(
        
        #tab1
        tabItem(tabName = "tab1",
                h2("Worldwide Happpiness Analysis",
                   align="center",style="margin-top:-5px;"),
                br(),
                
                #chart for top20 most happiest countries              
                fluidRow(
                  
                  h3("Top 20 most happiest countries",
                     align="center",style="margin-top:-5px;"),
                  br(),
                  column(12, 
                         
                         box(
                           
                           selectInput("year",label="Select Year",
                                       choices=c(2015,2016,2017)), 
                           width=12
                         ),  #end box1
                         
                         #box for plots
                         box(
                           
                           highchartOutput("MostHappy"), 
                           width=6
                         ) ,
                         
                         box(
                           
                           highchartOutput("happyScore"), 
                           width=6
                         ) ,
                         
                         br(),
                         
                         h3("Top 20 most unhappy countries",
                            align="center"),
                         br(),
                         
                         box(
                           
                           highchartOutput("MostUnhappy"), 
                           width=12 
                         ) 
                         
                  
                  ) #end column1
                
        )#end fluid-row         
                
      ) , #end tab1
      
      
    tabItem(tabName = "tab2",
              
        fluidRow(    
              
              h2("Correlation Analysis",
                 align="center",style="margin-top:-5px;"),
              br(),
              
              h4("let's check which socio and economic factors influence the Happiness scores-",align="center"),
              
              
              
          column(12,
            
              box(
                
                selectInput("yearcor",label="Select Year",
                            choices=c(2015,2016,2017)), 
                width=12
              ), 
              
              br(),
              
              h3("Correlation Matrix for each year",align="center"),
              br(),
              
              
              box(
                highchartOutput("corplot") ,
                width=12
              )
              
            ) #end column
              
          ) #end fluidrow     
              
      ) #end tab2
      
      
      
    )#end tabItems
  )#end dashboardBody
  
)#end dashboardPage


