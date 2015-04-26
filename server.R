 library(shiny)
 library(RCurl)
 #options(RCHART_WIDTH = 600)
 #require(rCharts)
 library(rCharts)
 library(ggplot2)
 library(reshape2)
 #require(reshape2)
 
shinyServer(function(input, output) {
   
   data1<-data.frame(year=c(2014,2014,2014,2014,2014,2014,2014,2014,2014,2014,2014,2014),month=c(1,2,3,4,5,6,7,8,9,10,11,12),incomes=c(500,1000,1100,1200,1350,900,800,900,1000,1150,1200,1300),
                    expenses=c(20,30,40,50,60,70,65,60,54,77,87,88))
  
   data2<-data.frame(year=c(2013,2013,2013,2013,2013,2013,2013,2013,2013,2013,2013,2013),month=c(1,2,3,4,5,6,7,8,9,10,11,12),incomes=c(500,900,500,500,500,600,800,820,840,860,880,900),
                    expenses=c(50,50,50,50,50,50,65,65,70,70,70,70))
   
   data3<-data.frame(year=c(2012,2012,2012,2012,2012,2012,2012,2012,2012,2012,2012,2012),month=c(1,2,3,4,5,6,7,8,9,10,11,12),incomes=c(600,650,700,710,720,730,750,710,720,730,740,750),
                     expenses=c(60,60,65,56,58,77,70,65,72,73,71,70))
   
   data<-rbind(data1,data2,data3)
   
   output$chart1 <- renderChart({
         YEAR = input$year
         datos <- subset(data, year == YEAR)
         
         p1<-rPlot(incomes~month,data=datos,type="line")
         p1$guides(y = list(min = 0, title = ""))
         p1$guides(y = list(title = ""))
        p1$addParams(width = 600,height = 300, dom = 'chart1')
        return(p1)
   })
   
#    
   output$chart2 <- renderChart({
     YEAR = input$year
     datos <- subset(data, year == YEAR)
     
     datos$utilidad<-datos$incomes-datos$expenses
     
     p2<-xPlot(utilidad ~ month, group = "year", data = datos, type = "line-dotted")
    p2$addParams(width = 600,height = 200, dom = 'chart2')
    
    return(p2)
   })


output$chart3 <- renderChart({
  YEAR = input$year
  datos <- subset(data, year == YEAR)
  
  m1 <- mPlot(x = "month", y = c("incomes", "expenses"), type = "Line", data = datos)
  m1$set(pointSize = 0, lineWidth = 1)
  
  m1$addParams(width = 600,height = 350, dom = 'chart3')
  
  return(m1)
})


output$chart4 <- renderChart({
 
  n1 <- nPlot(incomes ~ month, group = "year", data = data, type = "multiBarChart")
  
  n1$addParams(width = 600,height = 350, dom = 'chart4')
  
  n1$xAxis(axisLabel = 'Month')
  n1$yAxis(axisLabel = 'Income')
  
  return(n1)
})


}) 
  
 
 