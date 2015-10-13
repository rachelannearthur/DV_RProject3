require("jsonlite")
require("RCurl")
# Change the USER and PASS below to be your UTEid
final_grades <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from FINAL_GRADE"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_mh42375', PASS='orcl_mh42375', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

enrl_working <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from ENRL_WORKING"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_mh42375', PASS='orcl_mh42375', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))

k_12_frl <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from K_12_FRL"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521/PDBF15DV.usuniversi01134.oraclecloud.internal', USER='cs329e_mh42375', PASS='orcl_mh42375', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE), ))
