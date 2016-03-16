library(shiny)

# Coursera Developing Data Products
# R/Shiny program application
# Ideal Body Weight IBW and Body Mass Index BMI calculator
# Marco Siqueira Campos 


shinyUI(fluidPage(
        titlePanel("Ideal Body Weight IBW and Body Mass Index BMI Calculator"),
        sidebarLayout(
        # Input side panel
                sidebarPanel(
        # Numeric height input
                numericInput("height", 
                                     label = h4("Height"), 
                                     value = 70),
        # Numeric weight input  
                numericInput("body_weight", 
                             label = h4("Weight"), 
                             value = 150),
        # Radio buttons measuring system choice input          
                radioButtons("lbs_kg", label = h4("system choice"),
                             choices = list("in/lbs" = 1, "m/kg" = 2
                             ),selected = 1),
        # Radio buttons gender choice input
                radioButtons("gender", label = h4("Gender"),
                     choices = list("female" = 1, "male" = 2
                     ),selected = 2),
                submitButton("Calculate")),
                mainPanel (
        # Main panel outputs
                        h3("Results"),
                        h4("The prediction of your ideal body weight is:"),
                        h5(style="color:blue", textOutput("text1")), 
                        h5(style="color:blue", textOutput("text2")),
                        h4("Your BMI - Body Mass Index is:"),
                        h5(style="color:blue", textOutput("text3")),
                        h4("BMI classification:"),
                        h5(style="color:blue",textOutput("text4")),
                        h4("Discease risk:"),
                        h5(style="color:blue",textOutput("text5")),
                        h4(code(textOutput("text6")))
                        )
                        
                ))
)


