rm(list=ls())
####################################################################################################################
##
## vizingData_1_densityPlot.R
## viz1 : Density plot
##
####################################################################################################################
## History:
##         18 May 2020 | Tan Shi Hui | First Draft
####################################################################################################################

# Load packages
packages <- c('dplyr', 'ggplot2', 'MASS')
lapply(packages, function(x){
  if (!require(x, character.only = TRUE)) {
    stop('Required packages not found in PC')
  }
})

# constants
plotOutputFolder <- 'Rplots'
plotTitle <- 'viz1_densityPlot.png'

# Load sample data
data(survey)
surveyDat <- survey %>% filter(!is.na(Sex))

# Generate density plot
png(paste(plotOutputFolder, plotTitle, sep ='/'), res = 150, height = 700, width = 1080)
ggplot(surveyDat) +
  geom_density(aes(Wr.Hnd, color=Sex, fill=Sex), alpha=0.4) + 
  xlab('Span (cm)') + ylab('Density') + 
  theme_minimal() + 
  theme(axis.text=element_text(size=15), axis.title = element_text(size=15), 
        legend.text = element_text(size=15), legend.title = element_text(size=15))
dev.off()