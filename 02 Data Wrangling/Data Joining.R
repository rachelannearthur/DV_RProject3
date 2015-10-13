require("jsonlite")
require("RCurl")
require(dplyr)
# Changes column names to join by
names(final_grades)[names(final_grades)=="SCHOOLNUMBER"] <- "SCHOOL_CODE"
names(final_grades)

join_df <- dplyr::inner_join(final_grades, enrl_working, by="SCHOOL_CODE", copy=TRUE)

final_df <- dplyr::inner_join(join_df, k_12_frl, by="SCHOOL_CODE", copy=TRUE)
