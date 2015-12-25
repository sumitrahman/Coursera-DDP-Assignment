library("shiny")
library("ggplot2")
library("scales")

AAA <- read.csv("anondata.csv", header=TRUE)
AAA$Score<-AAA$Score/100
AAA$LL<-AAA$LL/100
AAA$UL<-AAA$UL/100
AAA$S<-ifelse(substr(AAA$Directorate,1,1)=="D","D","notD")


shinyServer(function(input, output, session) {
    
    selected.data <- reactive({
        if (input$y=="All groups and directorates") {
            AAA[AAA$Theme==input$x,]
        } else {
            AAA[AAA$Theme==input$x & (AAA$Group=="BIS" | substr(AAA$Group,1,7)==substr(input$y,1,7)),]
        }
        
        })

    selected.title <- reactive({
        if (input$y=="All groups and directorates") {
            "for all groups and directorates"
        } else {
            "for selected group and its directorates"
        }
        
    })
    
    output$plot <- renderPlot({
            ggplot(data=selected.data(), aes(y=reorder(Directorate,Score),x=Score,colour=Group,shape=Group))+
            geom_errorbarh(aes(xmin=LL,xmax=UL),height=0.5,colour="lightgrey")+
            geom_point(aes(size=S))+
            scale_shape_manual(values=c(15,16,16,16))+
            scale_colour_manual(values=c("black","#E69F00","#56B4E9","#D55E00"))+
            scale_size_manual(values=c("D"=4,"notD"=8))+
            theme_bw()+
            ggtitle(paste(input$x,selected.title()))+
            guides(colour=guide_legend(title=NULL),size=FALSE,shape=FALSE)+
            scale_x_continuous(labels=percent,name="theme score")+
            theme(axis.title.y=element_blank(),
                  panel.grid.minor.x=element_blank(),
                  panel.grid.major.x=element_blank(),
                  panel.grid.major.y=element_line(colour="lightblue",linetype="dotted"),
                  axis.text.y=element_text(size=rel(1.1)),
                  legend.position=c(1,0),legend.justification=c(1,0))
    })
    
#    output$summary<-renderPrint({"Here is a summary"})

#    output$text1 <- renderText({paste("You have selected")})
#    output$text2 <- renderText({paste("You have chosen a range that goes from","to")})
    output$summary <- renderUI({
        str1 <- paste("This app displays results from a staff survey at a large 
                        organisation called BIS 
                      (where the app author works). BIS is organised into a number of 
                      groups, and the groups are organised further into directorates.")
        str2 <- paste("The survey was distributed to three groups.  
                      The questions were grouped into six themes, and this app 
                      presents the theme scores for each directorate, group and 
                      for BIS.  Theme scores can range from 0% to 100%, and are 
                      basically average responses to the questions in the theme.")
        str3 <- paste("You can choose which theme to present the scores for by 
                      selecting it from the drop down menu on the sidebar.")
        str4 <- paste("You can choose to focus on the results for one group and 
                      its directorates, or for all groups and directorates at the 
                      same time, by choosing the appropriate option from the left 
                      hand sidebar.  Note that all graphs include the overall result 
                      for BIS.  The BIS result is indicated by the black square, 
                      the groups with large circles and the directorates with small 
                      circles.  If you select the charts which show all groups and 
                      directorates, the directorates in the same group are in 
                      the same colour as each other.")
        str5 <- paste("The graphs include confidence intervals for each estimate.  
                      These are approximate 95% confidence interval, and reflect the 
                      uncertainty due to the fact that some people did not take part 
                      (even though the survey was intended to be a census of these 
                      three groups).")
        str6 <- paste("I have not given the group, directorate and theme names as 
                        these results are for internal use only at this time - 
                      I cannot publish too many details about who scored what!")
        str7 <- paste("To see the code and dataset used to produce this app go 
                      to https://github.com/sumitrahman/Coursera-DDP-Assignment")
        HTML(paste(str1, str2, str3, str4, str5, str6, str7,sep = '<br/><br/>'))
    })
})
