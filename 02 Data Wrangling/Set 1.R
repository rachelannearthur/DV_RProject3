require(tidyr)
require(dplyr)
require(ggplot2)
require (jsonlite)
require (RCurl)

x <- join_df %>% select (READ_GROWTH_GRADE, MATH_GROWTH_GRADE, EMH) %>% tbl_df

View (x)

plot1 <- ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  labs(title='Math Growth Score Versus Reading Growth Score') +
  labs(x="Reading Growth Score", y=paste("Math Growth Score")) +  
  layer(data=x, 
        mapping=aes(x= as.numeric(READ_GROWTH_GRADE), y= as.numeric(MATH_GROWTH_GRADE), color = as.character(EMH)),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(),
        position= position_jitter(width=0.3)
  ) + theme(axis.text.x=element_text(angle= 80, vjust=0.8, lineheight = 1.5),panel.grid.major =element_line(size=0.1)) 

plot1 

