require("jsonlite")
require("RCurl")
require(dplyr)
# Changes column names to join by
names(final_grades)[names(final_grades)=="SCHOOLNUMBER"] <- "SCHOOL_CODE"
names(final_grades)

df <- transform(join_df, SCHOOL_CODE = as.numeric(paste(SCHOOL_CODE)))
join_df <- dplyr::inner_join(final_grades, enrl_working, k_12_frl, by="SCHOOL_CODE", copy=TRUE)

# Convert Columns to correct type 
indx <- setdiff(names(join_df),true_names)
join_names = c("SCHOOLNAME", "DISTRICTNAME", "EMH", "EMH_COMBINED", "INITIAL_PLANTYPE", "FINAL_PLANTYPE", "NOTES", "ORGANIZATION_NAME", "SCHOOL_NAME")
join_df[indx] <- lapply(join_df[indx], function(x) as.numeric(as.character(x)))
join_df[join_names] <- lapply(join_df[true_names], function(x) as.character(x))

k_names = c("DISTRICT_NAME", "SCHOOL_NAME")
k_nums = c("DISTRICT_CODE","SCHOOL_CODE")
k_12_frl[k_names] <- lapply(k_12_frl[k_names], function(x) as.character(x))
k_12_frl[k_nums] <- lapply(k_12_frl[k_nums], function(x) as.numeric(as.character(x)))

final_df <- dplyr::inner_join(join_df, k_12_frl, by="SCHOOL_CODE", copy=TRUE)

