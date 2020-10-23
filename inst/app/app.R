#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(shinyWidgets)
library(plotly)
library(reactable)
library(ggthemes)
library(covideu)

owid <- read_csv("owid-covid-data (1).csv") 

EUCountryList <- c("Austria","Italy","Belgium","Latvia","Bulgaria","Lithuania",
                   "Croatia","Luxembourg","Cyprus","Malta","Czechia","Netherlands",
                   "Denmark","Poland","Estonia","Portugal","Finland","Romania","France",
                   "Slovakia","Germany","Slovenia","Greece","Spain","Hungary","Sweden",
                   "Ireland")

owid_eu <- owid %>%
    filter(location %in% c("Austria", "Italy", "Belgium",	"Latvia", "Bulgaria",	"Lithuania", "Croatia",	"Luxembourg", "Cyprus",	"Malta", "Czechia",	"Netherlands", "Denmark",	"Poland", "Estonia",	"Portugal", "Finland",	"Romania", "France",	"Slovakia", "Germany",	"Slovenia", "Greece",	"Spain", "Hungary",	"Sweden", "Ireland")) %>%
    select(location, date, total_cases, new_cases, total_deaths, new_deaths, population, life_expectancy)

owid_eu_long <- owid_eu %>%
    pivot_longer(cols = c("new_cases", "new_deaths"),
                 names_to = "type_new",
                 values_to = "count") 
Dtlist <- c("2020-01-05", "2020-02-05", "2020-03-05", "2020-04-05", "2020-05-05", "2020-06-05", "2020-07-05", "2020-08-05", "2020-09-05", "2020-10-05")

eutable_draft <- owid_eu %>%
    filter(date %in% as.Date(Dtlist)) %>%
    mutate(`Case fatality rate` = round(total_deaths / total_cases, digits = 3)) %>%
    select(-new_cases, -new_deaths) %>%
    rename("Location" = "location", "Date" = "date", `Total cases` = "total_cases", `Total deaths` = "total_deaths", "Population" = "population", `Life expectancy` = "life_expectancy")

# Define UI for application that draws a histogram
ui <- fluidPage(
    setBackgroundColor(
        color = c("#003399", "#FFCC00"),
        gradient = "radial",
        direction = c("top", "left")
    ),

    
    # Application title
    titlePanel(h2(id = "title", "COVID-19 in EU")),
    tags$style(HTML(ic("title", "white"))),
    
    # Sidebar with a slider input for number of bins 
    sidebarPanel(br(),
                 dateInput(inputId = "date",
                           "Please enter a date",
                           min = as.Date(min(owid_eu_long$date)),
                           max = as.Date(max(owid_eu_long$date))),
                 
                 selectizeInput(inputId = "location", "Please select one or more EU countries",
                                    choices = EUCountryList, multiple = TRUE, selected = c("Austria", "Italy")),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 
                 dateRangeInput(inputId = "daterange", "Please select duration",
                                start = as.Date(min(owid_eu$date)),
                                end = as.Date(max(owid_eu$date)),
                                min = as.Date(min(owid_eu$date)),
                                max = as.Date(max(owid_eu$date))),
                 
                 select1country(),
                 
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
                 br(),
    
                 sliderInput(inputId = "datee", "Please select a date or a duration",
                             min = as.Date(min(eutable_draft$Date)),
                             max = as.Date(max(eutable_draft$Date)),
                             value = c(as.Date("2020-02-05"),
                                       as.Date("2020-03-05"),
                                       as.Date("2020-04-05"),
                                       as.Date("2020-05-05"),
                                       as.Date("2020-06-05"),
                                       as.Date("2020-06-05"),
                                       as.Date("2020-07-05"),
                                       as.Date("2020-08-05"),
                                       as.Date("2020-09-05")))),
    
    mainPanel(
        tabsetPanel(type = "tab",
                    tabPanel("Main", h4(id = "sub1", "Daily number of confirmed cases and deaths"),
                             tags$style(HTML(ic("sub1", "white"))),
                             plotlyOutput("Plot1"),
                             br(),
                             h4(id = "sub2", "Trend of cumulative cases and deaths, according to available data recorded for each country"),
                             tags$style(HTML(ic("sub2", "white"))),
                             h6(id = "ann1", "Yellow line represents confirmed cases."),
                             tags$style(HTML(ic("ann1", "yellow"))),
                             h6(id = "ann2", "Red line represents confirmed deaths."),
                             tags$style(HTML(ic("ann2", "red"))),
                             plotlyOutput("Plot2"),
                             verbatimTextOutput("plotly_click"),
                             br(),
                             h4(id = "sub3", "Covid-19 related information recorded on the 5th of each month, from 5th January, 2020 to 5th October, 2020"),
                             tags$style(HTML(ic("sub3", "white"))),
                             reactableOutput("table")),
                    tabPanel("About",
                             fluidPage(includeMarkdown("about.md"))))
    
    ))




# Define server logic required to draw a histogram
server <- function(input, output, session) {
    observe({updateDateInput(session, "date", value = as.Date(median(owid_eu_long$date)))})
    output$Plot1 <- renderPlotly({
        P1 <- draw_plot(filter(owid_eu_long, date %in% input$date, 
                     location %in% input$location), location, count, type_new)
        
        ggplotly(P1) %>%
            config(displayModeBar = FALSE)
    }
    )
    
    newowid_eu <- reactive({
        filter(owid_eu, between(date ,input$daterange[1], input$daterange[2]),
               location %in% input$locationn)
    })
    
    output$Plot2 <- renderPlotly({
        P2 <- ggplot(newowid_eu(), aes(x = date)) +
            geom_line(aes(y = total_cases), color = "yellow") +
            geom_line(aes(y = total_deaths), color = "red") +
            scale_color_discrete(name = "Cumulative number type", labels = c("Cases", "Deaths")) +
            xlab("Date") +
            ylab("Number of confirmed deaths and cases") +
            labs(color = "#D0D3D4") +
            ylim(0, max(owid_eu$total_cases)) +
            theme(panel.background = element_rect(fill = "transparent", color = NA),
                  plot.background = element_rect(fill = "transparent", color = NA),
                  axis.text = element_text(color = "white"),
                  axis.title.x = element_text(colour = "#D0D3D4"),
                  axis.title.y = element_text(colour = "#D0D3D4"))
        
    ggplotly(P2) %>%
        config(displayModeBar = FALSE)
    }
    )
    
    output$plotlyClick <- renderPrint(event_data("plotly_click"))
    
    theme <- reactableTheme(color = "#ECECEC", 
                            backgroundColor = "#ffffff00",
                            borderColor = "#D0D3D4",
                            searchInputStyle = list(color = "#000000"))
    
    output$table <- renderReactable({
        reactable(eutable_draft %>%
                      filter(between (Date, input$datee[1], input$datee[2])), defaultSortOrder = "desc", searchable = TRUE,
                  columns = list(
                      `Case fatality rate` = colDef(format = colFormat(percent = TRUE, digits = 3)),
                      Population = colDef(format = colFormat(separators = TRUE)),
                      `Total deaths` = colDef(format = colFormat(separators = TRUE)),
                      `Total cases` = colDef(format = colFormat(separators = TRUE)),
                      `Life expectancy` = colDef(format = colFormat(digits = 2))
                      ),
                  theme = theme, 
                  highlight = TRUE)
    })
    
}    

    



# Run the application 
shinyApp(ui, server)