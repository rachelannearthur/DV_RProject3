require(tidyr)
require(dplyr)
require(ggplot2)
require (jsonlite)
require (RCurl)

# inner join 
x <- final_grades %>% inner_join(., enrl_working, by="SCHOOL_CODE", copy=TRUE) %>% inner_join(., k_12_frl, by="SCHOOL_CODE", copy =TRUE) %>% select (READ_GROWTH_GRADE, MATH_GROWTH_GRADE, EMH) %>% filter(EMH != "A")


plot1 <- ggplot() + 
  coord_cartesian() + 
  scale_x_continuous(breaks=1:15) +
  scale_y_continuous(breaks=1:15) +
  labs(title='Math Growth Score Versus Reading Growth Score') +
  labs(x="Reading Growth Score", y=paste("Math Growth Score")) +  
  layer(data=x, 
        mapping=aes(x= as.numeric(READ_GROWTH_GRADE), y= as.numeric(MATH_GROWTH_GRADE), color = as.character(EMH)),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(),
        position= position_jitter(width=0.3)
  ) 

plot1 

