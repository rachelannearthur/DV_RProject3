require(tidyr)
require(dplyr)
require(ggplot2)
require (jsonlite)
require (RCurl)

# outer_join_df
outer_join_df <- enrl_working %>% left_join(., k_12_frl, by = "SCHOOL_CODE", copy=TRUE) %>% right_join(., final_grades, by = "SCHOOL_CODE", copy=TRUE) %>% mutate(PCT_NONWHITE = PCT_AMIND + PCT_ASIAN + PCT_BLACK + PCT_HISP + PCT_PI + PCT_2ORMORE, FRL = X_FREE_AND_REDUCED / 100) %>% select(SPF_PS_IND_GRAD_RATE, FRL, EMH, PCT_NONWHITE, FINAL_PLANTYPE) %>% dplyr::rename(., GRAD_RATE=SPF_PS_IND_GRAD_RATE) %>% filter(EMH != "A")


plot2 <- ggplot() + 
  coord_cartesian() + 
  scale_x_continuous(labels=percent) +
  scale_y_continuous(labels=percent) +
  facet_grid(.~EMH)+
  labs(title='FRL School Minority Distribution') +
  labs(x="Percentage of Non-White Students", y=paste("Percentage of Students on Free/Reduced Lunch Meal Plan")) +  
  layer(data=outer_join_df, 
        mapping=aes(x = PCT_NONWHITE, y= FRL, color=FINAL_PLANTYPE),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(),
        position= position_jitter(width=0.3)
  )
  
plot2 
