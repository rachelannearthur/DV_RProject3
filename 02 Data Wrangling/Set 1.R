require(tidyr)
require(dplyr)
require(ggplot2)
require (jsonlite)
require (RCurl)

names(final_grades)[names(final_grades)=="SCHOOLNUMBER"] <- "SCHOOL_CODE"
names(final_grades)

join_df <- dplyr::inner_join(final_grades, enrl_working, k_12_frl, by="SCHOOL_CODE", copy=TRUE)

x <- join_df %>% select (READ_GROWTH_GRADE, MATH_GROWTH_GRADE, EMH) %>% tbl_df

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
  ) + 

plot1 

