require(ggplot2, scales)

AAA <- read.csv("dummydata.csv", header=TRUE)
AAA$Score<-AAA$Score/100

ggplot(data=AAA[AAA$Theme=="Theme 1",],
       aes(y=reorder(Directorate,Score),x=Score))+
    geom_point(aes(colour=Group),size=4)+
    scale_colour_brewer(palette="Paired")+
    theme_bw()+
    ggtitle("Theme 1 for directorates")+
    guides(colour=guide_legend(title="Group"),size=FALSE)+
    scale_x_continuous(labels=percent,name="index score")+
    theme(axis.title.y=element_blank(),
          panel.grid.minor.x=element_blank(),
          panel.grid.major.x=element_blank(),
          panel.grid.major.y=element_line(colour="lightblue",linetype="dotted"),
          axis.text.y=element_text(size=rel(0.5)),
          legend.position=c(1,0),legend.justification=c(1,0))
