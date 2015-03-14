library(shiny)
library(MASS)
data(birthwt)

birthwt <- birthwt[, -c(1, 6, 8:9)]
birthwt <- within(birthwt, {
        race <- factor(race, labels = c("White", "Black", "Other"))
        smoke <- factor(smoke, labels = c("No", "Yes"))
        ht <- factor(ht, labels = c("No", "Yes"))
        bwt <- bwt/1000
})

modfit <- function(x) {
        preds <- paste("bwt ~ ", paste(x ,collapse = " + "))
        lm(preds, data = birthwt)       
} 


shinyServer(  
  function(input, output) { 
    
    output$summary <- renderPrint({
            if(length(input$predictor) > 0){
                    summary(modfit(input$predictor))  
            }
    })
    
    output$resPlot <- renderPlot({
            if(length(input$predictor) > 0){
                    plot(modfit(input$predictor), which = 1)
            }
    })
    
    output$qqPlot <- renderPlot({
            if(length(input$predictor) > 0){
                    plot(modfit(input$predictor), which = 2)
            }
    })
    
    output$myTable <- renderDataTable({
            if(length(input$predictor) > 0){
                    birthwt
            }
    }, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
    
    
    })
    