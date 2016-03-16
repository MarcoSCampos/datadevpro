library(shiny)

# Coursera Developing Data Products
# R/Shiny program application
# Ideal Body Weight IBW and Body Mass Index BMI calculator
# Marco Siqueira Campos 


# functions
# ibw Dr Robinson (1983) for women international
ibww<-function(hw)round((((((hw*100)-152.4)/2.54)*1.7)+49),1)
# ibw Dr Robinson (1983) for women english
ibww_in<-function(hw)round(((((((hw*2.54)-152.4)/2.54)*1.7)+49)*2.20462),1)


# ibw Dr B. J. Devine (1974) for men international
ibwm<-function(hm)round((((((hm*100)-152.4)/2.54)*2.3)+50),1)
# ibw Dr B. J. Devine (1974) for men english 
ibwm_in<-function(hm)round(((((((hm*2.54)-152.4)/2.54)*2.3)+50)*2.20462),1)

# bmi international
bmim_kg<-function (h,w)round((w/(h^2)),1)
# bmi english
bmiin_lbs<-function(h,w)round((w*0.453592)/((h*0.0254)^2),1)

a<-0

# server.R
shinyServer(
        function(input, output) {
 # IBW output
      output$text1<-renderPrint({
              if(input$lbs_kg ==1 & input$gender ==1) ibww_in(input$height)
              else if (input$lbs_kg ==2 & input$gender ==1) ibww(input$height)
              else if (input$lbs_kg ==1 & input$gender ==2) ibwm_in(input$height)
              else if (input$lbs_kg ==2 & input$gender ==2) ibwm(input$height)               
                        })
 # weight unit system
           output$text2<-renderText({
              if( input$lbs_kg==1) "lbs"
              else if (input$lbs_kg==2) "kg"
                })
 # BMI output     
      output$text3<-renderPrint({
              if (input$lbs_kg==1) bmiin_lbs(input$height,input$body_weight)
              else if (input$lbs_kg==2) bmim_kg(input$height,input$body_weight) 
                })          
 # weight classification    
     output$text4<-renderText({
               if (input$lbs_kg==1) {
                       a<-bmiin_lbs(input$height,input$body_weight)
               } else if (input$lbs_kg==2){ 
                       a<-bmim_kg(input$height,input$body_weight) 
                             }
                              if (a<18.5) "Underweight"
              else if (a >=18.5 & a<25) "Normal weight"
              else if (a >=25 & a<30) "Pre-Obesity"
              else if (a >=30 & a<35) "Obsesity class I"  
              else if (a >=35 & a<40) "Obsesity class II"  
              else if (a >40)  "Obsesity class III"     
                })
# overweight WHO classification   
      output$text5<-renderText({
             if (input$lbs_kg==1) {
                     a<-bmiin_lbs(input$height,input$body_weight)
             } else if (input$lbs_kg==2){ 
                     a<-bmim_kg(input$height,input$body_weight) 
                         }
               if (a >=18.5 & a<25) "No risk"
             else if (a >=25 & a<30) "Increase"
             else if (a >=30 & a<35) "Low risk"  
             else if (a >=35 & a<40) "Moderate risk"  
             else if (a >40)  "High risk"     
         })
# low height alert
        output$text6<-renderText({
                if (input$height<1.524 & input$lbs_kg==2) "too low height, not accurate"
                else if (input$height< 60 & input$lbs_kg==1)"too low height, not accurate"
        })
           
  
        }
)