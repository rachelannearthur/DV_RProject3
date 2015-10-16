require(tidyr)
require(dplyr)
require(ggplot2)
require (jsonlite)
require (RCurl)


last_join_df <- final_grades %>% full_join(., enrl_working, by="SCHOOL_CODE") %>% select(TOTAL, PCT_WHITE, DISTRICTNUMBER, OVERALL_ACH_GRADE, RANK_TOT) 

plot3 <- ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous(labels=percent) +
  labs(title='Percentage of White Students Affect on School Success') +
  labs(x="OVERALL RANKING", y=paste("Percentage of White Students"), size="Total Students",color="Achievement Grade") +  
  layer(data=last_join_df, 
        mapping=aes(x = RANK_TOT, y=PCT_WHITE, size=TOTAL, color=OVERALL_ACH_GRADE),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(),
        position= position_jitter(width=0.3)
  )

plot3

