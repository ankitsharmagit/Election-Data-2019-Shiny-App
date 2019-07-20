# Coursera - Developing Data Products- Course Project

# ui.R file for the shiny app

library(markdown)
data<-read.csv("GE_india_2014_results.csv")
shinyUI(navbarPage("Find your Election Data 2019",
                   
                            # Sidebar
                            sidebarLayout(
                              sidebarPanel(
                                helpText("Provide information about candidate who contested in 2019 General Elections in India"),
                                selectInput("state","By State",choices = data$state,selected = NULL,multiple = FALSE),
                                selectInput("party","By Party",choices = data$party,selected = NULL,multiple = FALSE),
                                sliderInput('evmvoteinput', 'EVM Vote', min=min(data$evm_votes), max=max(data$evm_votes), value=c(0,1000000), step=10),
                                sliderInput('postalvoteinput', 'Postal Vote', min=min(data$postal_votes), max=max(data$postal_votes), value=c(0,100000), step=10),
                                sliderInput('totalvoteinput', 'Total Vote', min=min(data$total_votes), max=max(data$total_votes), value=c(0,1000000), step=10)
                                ),
                                
                              mainPanel(
                                         dataTableOutput('table')
                                
                              )
                            )
                   
)
)   