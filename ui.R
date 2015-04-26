library(shiny)
library(rCharts)
library(markdown)
#require(rCharts)



options(RCHART_LIB = 'polycharts')
shinyUI(pageWithSidebar(
  headerPanel("Incomes and Expenses of a Company"),
  sidebarPanel(
    selectInput(inputId = "year",
                label = "Select year to compare Incomes/Expenses",
                choices = c(2012,2013,2014),selected = 2014),
    
    helpText("How it works",
             "1. The user select a year",
             "2. In all cases above, when the user make a choice, the plot is updated with the year selected by the user.",
             "3. The Platform calculates Utility from year selected",
             " 4. The user can choise between several graphical options: 
    Incomes in the selected year.
  Compare incomes/expenses 
  Utility in the year")
   
  )
    ,
  

  
mainPanel(
   
  tabsetPanel(
    tabPanel("Incomes in the Selected Year", showOutput("chart1", "polycharts")),
    tabPanel("Compare Incomes and Expenses in the Selected Year", showOutput("chart3","morris")),
  tabPanel("Utility in the Selected Year",showOutput("chart2","xcharts"))),
    showOutput("chart4","nvd3")
    
)
)
)




