library("shiny")

shinyUI(pageWithSidebar(
    headerPanel('Staff survey results for groups and directorates'),
    sidebarPanel(
        selectInput('x', 'Theme', paste("Theme",1:6)),
        selectInput('y', 'Management Units',
                    c("Group 1 and directorates",
                      "Group 2 and directorates",
                      "Group 3 and directorates",
                      "All groups and directorates"),
                    selected="Theme 1")
    ),
    mainPanel(
        tabsetPanel(
            tabPanel("What is this app?", htmlOutput("summary")),
            tabPanel("Graph", plotOutput("plot")) 
        )
    )

))

