#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that predicts a next word
shinyUI(
  navbarPage("Shiny Application",
             tabPanel("Word Predictor",
                      fluidPage(
                        titlePanel("Predict next word based on 2,3,4,5-gram datasets"),
                        sidebarLayout(
                          sidebarPanel(
                            helpText("Enter a set words to trigger the prediction of next word"),
                            hr(),
                            textInput("textInput", "Input text", value = ""),
                            br(),
                            submitButton("Submit")
                          ),
                          
                          # Show a main panel with predicted words
                          mainPanel(
                            h2("Next predicted word..."),
                            verbatimTextOutput("Predicting next word..."),
                            h3(strong(code(textOutput('predicted_word')))),
                            br(),
                            br(),
                            br(),
                            h4(tags$b('Second best prediction:')),
                            textOutput('prediction2'),
                            br(),
                            h4(tags$b('Third best prediction:')),
                            textOutput('prediction3'),
                            br(),
                            br(),
                            br()
                          )
                        )
                      )
             ),
             
             tabPanel("About the Data",
                      h2("SwiftKey Data"),
                      hr(),
                      h3("Description"),
                      helpText("For this shiny app, the source of the data is from coursera which in turn has been provided by the course partner SwiftKey.",
                               " As stated in the course material, this data was collected from publicly available material using a web crawler."),
                      h3("Format"),
                      helpText("Four language sets have been provided - English, German, Finnish and Russian.",
                               "Each of the languages has data from blogs, new articles and twitter feeds",
                               "These were sampled to build a corpus which inturn were used to generat N-Gram tokenizations."),
              
                      h3("Source"),
                      p("SwiftKey Coursera Dataset"),
                      a("https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip")
             ),
             tabPanel("Link to the Github Repository",
                      a("https://github.com/hisscaredbrain/DS_Capstone"),
                      hr(),
                      h4("Enjoy the Shiny App!")
             )
  )
)
