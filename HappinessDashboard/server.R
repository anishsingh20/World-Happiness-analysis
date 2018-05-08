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




cor_data1 <- year_2015[,4:12]
#data frame for the correlation between the numeric variables for year 2015 


cor_data2 <- year_2016[,4:13]
cor_data2 <- cor_data2[-c(2,3)]                       
#data frame for the correlation between the numeric variables for year 2016


cor_data3 <- year_2017[,3:12]
cor_data3 <- cor_data3[-c(2,3)]
#data frame for the correlation between the numeric variables for year 2015 





server<-function(input,output)
{
  
  output$MostHappy<-renderHighchart({
    
    if(input$year==2015)
    {
      df<-year_2015 %>% filter(Happiness.Rank <= 20)
    }
    else if(input$year==2016)
    {
      df<-year_2016 %>% filter(Happiness.Rank <= 20)
      
    } 
    else {
      
      df<-year_2017 %>% filter(Happiness.Rank <= 20)
        
    }
  
    hchart(df,hcaes(x = Country, y = Happiness.Rank),type="column",name="Rank",color="#3C8041") %>% 
      hc_add_theme(hc_theme_elementary()) %>% 
      hc_title(text="Top 20 most happy countries",align="center") %>% 
      hc_exporting(enabled=TRUE) %>%
      hc_add_theme(hc_theme_elementary())
      
    
    
  })  
  
  output$corplot <- renderHighchart({
    
    if(input$yearcor==2015)
    {
      hchart(cor(cor_data1))
    }
    else if(input$yearcor==2016)
    {
      hchart(cor(cor_data2))
      
    } 
    else {
      
      hchart(cor(cor_data3))
      
    }
    
  })
  
  
  output$happyScore<-renderHighchart({
    
    if(input$year==2015)
    {
      df<-year_2015 %>% filter(Happiness.Rank <= 20)
    }
    else if(input$year==2016)
    {
      df<-year_2016 %>% filter(Happiness.Rank <= 20)
      
    } 
    else {
      
      df<-year_2017 %>% filter(Happiness.Rank <= 20)
      
    }
    
    
    hchart(df,hcaes(x = Country, y = Happiness.Score),type="line",name="score",color="#15C222") %>% 
      hc_add_theme(hc_theme_elementary()) %>% 
      hc_title(text="Top 20 most happy countries and their happiness scores",align="center") %>% 
      hc_exporting(enabled=TRUE) %>%
      hc_add_theme(hc_theme_elementary())
    
    
    
  })
  
  
  output$MostUnhappy<-renderHighchart({
    
    if(input$year==2015)
    {
      df<-year_2015 %>% filter(Happiness.Rank > 110)
    }
    else if(input$year==2016)
    {
      df<-year_2016 %>% filter(Happiness.Rank > 110)
      
    } 
    else {
      
      df<-year_2017 %>% filter(Happiness.Rank > 110)
      
    }
    
    hchart(df,hcaes(x = Country, y = Happiness.Rank),type="column",name="Rank",color="black") %>% 
      hc_add_theme(hc_theme_elementary()) %>% 
      hc_title(text="Topmost unhappy countries",align="center") %>% 
      hc_exporting(enabled=TRUE) %>%
      hc_add_theme(hc_theme_elementary())
    
    
  })  
  
}
