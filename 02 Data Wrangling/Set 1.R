require(tidyr)
require(dplyr)
require(ggplot2)
require (jsonlite)
require (RCurl)

join_df <- data.frame(lapply(join_df, as.numeric(as.character(x))), stringsAsFactors=FALSE)

View(join_df)

x <- join_df %>% select (SCHOOL_CODE, DISTRICTNAME, MATH_ACH_GRADE, MATH_GROWTH_GRADE, EMH) %>% tbl_df

View (x)

plot1 <- ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  labs(title='Math Growth Rate in EMH in Different Districts') +
  labs(x="School Numbers", y=paste("Math Growth Grades"))  +
  layer(data=x, 
        mapping=aes(x= SCHOOL_CODE, y= MATH_GROWTH_GRADE , color = as.character(EMH)),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(),
        position= position_jitter(width=0.3)
  ) + theme(axis.text.x=element_text(angle= 80, vjust=0.8, lineheight = 1.5),panel.grid.major =element_line(size=0.1))

plot1
