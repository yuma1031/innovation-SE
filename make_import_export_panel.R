library(tidyverse)
export <- read.csv('export.csv',skip = 4)
export <- export %>% filter(Country.Code %in% c('CHN',"KOR","MYS","THA","IDN")) %>% select(-1,-3,-4)
export_t <- as.data.frame(t(export))
export_t$year <- rownames(export_t)
colnames(export_t) <- c('CHN',"KOR","MYS","THA","IDN","year")
export_t <- export_t %>% filter (year !='Country.Code')
export_panel <- export_t %>% gather (key = country, value = export, - year)
export_panel$year <- substr(export_panel$year,2,5)
export_panel$year <- as.numeric(export_panel$year)

saveRDS(export_panel,'export_panel')



export <- read.csv('import_goods_and_services.csv',skip = 4)
export <- export %>% filter(Country.Code %in% c('CHN',"KOR","MYS","THA","IDN")) %>% select(-1,-3,-4)
export_t <- as.data.frame(t(export))
export_t$year <- rownames(export_t)
colnames(export_t) <- c('CHN',"KOR","MYS","THA","IDN","year")
export_t <- export_t %>% filter (year !='Country.Code')
export_panel <- export_t %>% gather (key = country, value = export, - year)
export_panel$year <- substr(export_panel$year,2,5)
export_panel$year <- as.numeric(export_panel$year)
colnames(export_panel)[3] <- 'import'

saveRDS(export_panel,'import_panel')

