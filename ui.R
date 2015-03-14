shinyUI(fluidPage(
  titlePanel(h2("A Linear Regression Model for Infant Birth Weight", align = "center")),
  
 sidebarLayout(
    sidebarPanel(h5("This shiny application performs linear regression on infant birth weight 
                     (in kilograms) from the birthwt dataset in package MASS. 
                     You can select variables included in the formula used to build
                     the linear model.
                     Performance of your model is displayed along with residual and QQ plots, 
                     and the dataset.
                     Source code for my app is available here:" ), 
                 a("https://github.com/Mark-Ko/dev_data_products"),    
                 br(),
                 h4(strong("Please select predictor(s)")),
                 checkboxGroupInput("predictor", "Predictor:",
                                    c("Mother's age (age)" = "age",
                                      "Mother's weight at last menstrual period (lwt)" = "lwt",
                                      "Mother's race (race)" = "race",
                                      "Smoking status during pregnancy (smoke)" = "smoke",
                                      "History of hypertension (ht)" = "ht"))
                 
    ),
     mainPanel(HTML('<img style="margin:0px auto;display:block" src="Infant2.png"/>'),
       tabsetPanel(
          tabPanel("Summary",
                   verbatimTextOutput("summary")),
          tabPanel("Residuals Plot", plotOutput("resPlot")),
          tabPanel("QQ Plot", plotOutput("qqPlot")),
          tabPanel("Data Table", dataTableOutput("myTable"))
        )
     )
  )
))
