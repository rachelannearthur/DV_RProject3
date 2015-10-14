require("jsonlite")
require("RCurl")
require(dplyr)
# Changes column names to join by
names(final_grades)[names(final_grades)=="SCHOOLNUMBER"] <- "SCHOOL_CODE"
names(final_grades)

join_df <- dplyr::inner_join(final_grades, enrl_working, by="SCHOOL_CODE", copy=TRUE)
View(join_df)

#join_df <- data.frame(lapply(join_df, as.numeric(as.character(join_df))), stringsAsFactors=FALSE)

#x <- join_df %>% select(SCHOOL_CODE, MATH_GROWTH_GRADE) %>% filter (MATH_GROWTH_GRADE > 10) %>% tbl_df
#x

#join_df <- data.frame(lapply(join_df, as.numeric(as.character(x))), stringsAsFactors=FALSE)

#attempting to change everything to not a factor
#indx <- sapply(k_12_frl, is.factor)
#k_12_frl[indx] <- data.frame(lapply(k_12_frl[indx], function(x) as.numeric(as.character(x))), stringsAsFactors = FALSE)
View (k_12_frl)

#k_12_frl <- data.frame(lapply(k_12_frl, as.numeric(as.character(x))), stringsAsFactors=FALSE)

final_df <- dplyr::inner_join(k_12_frl, join_df, by="SCHOOL_CODE", copy=TRUE)
View (final_df)

