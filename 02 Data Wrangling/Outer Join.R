require("jsonlite")
require("RCurl")
require(dplyr)

outer_join_df <- enrl_working %>% left_join(., k_12_frl, by = "SCHOOL_CODE", copy=TRUE) %>% right_join(., final_grades, by = "SCHOOL_CODE", copy=TRUE) %>% select(SPF_PS_IND_GRAD_RATE, PCT_AMIND, PCT_ASIAN, PCT_BLACK, PCT_HISP, PCT_WHITE, PCT_PI, PCT_2ORMORE, X_FREE_AND_REDUCED, EMH) %>% dplyr::rename(., GRAD_RATE=SPF_PS_IND_GRAD_RATE) %>% filter()


outer_join_df <- enrl_working %>% left_join(., k_12_frl, by = "SCHOOL_CODE", copy=TRUE) %>% right_join(., final_grades, by = "SCHOOL_CODE", copy=TRUE) %>% mutate(PCT_NONWHITE = PCT_AMIND + PCT_ASIAN + PCT_BLACK + PCT_HISP + PCT_PI + PCT_2ORMORE) %>% select(SPF_PS_IND_GRAD_RATE, X_FREE_AND_REDUCED, EMH, PCT_NONWHITE, PCT_WHITE) %>% dplyr::rename(., GRAD_RATE=SPF_PS_IND_GRAD_RATE)
