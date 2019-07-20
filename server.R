# Coursera - Developing Data Products- Course Project

# server.R file for the shiny app



library(shiny)
library(datasets)
library(dplyr)
data<-read.csv("GE_india_2014_results.csv")
shinyServer(function(input, output) {

    # Show the cars that correspond to the filters
    output$table <- renderDataTable({
        evmvote_seq <- seq(from = input$evmvoteinput[1], to = input$evmvoteinput[2], by = 1)
        postalvote_seq <- seq(from = input$postalvoteinput[1], to = input$postalvoteinput[2], by = 1)
        totalvote_seq <- seq(from = input$totalvoteinput[1], to = input$totalvoteinput[2], by = 1)
        data <- filter(data, evm_votes %in% evmvote_seq, state %in% input$state,postal_votes %in% postalvote_seq,party %in%input$party,
                       total_votes %in% totalvote_seq)
        data
    }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})