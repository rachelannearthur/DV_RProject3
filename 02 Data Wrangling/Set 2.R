require(tidyr)
require(dplyr)
require(ggplot2)
require (jsonlite)
require (RCurl)

plot2 <- ggplot() + 
  coord_cartesian() + 
  scale_x_continuous(labels=percent) +
  scale_y_discrete(labels=percent) +
  scale_color_hue() +
  labs(title='Graduation Rates') +
  labs(x="Graduation Rate", y=paste("% of Students with Free/Reduced Lunches")) +  
  layer(data=outer_join_df, 
        mapping=aes(x= as.numeric(X_FREE_AND_REDUCED), y=GRAD_RATE, color = as.character(EMH)),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(),
        position= position_jitter(width=0.3,height = 0.3)
  )  
  
  plot2 

