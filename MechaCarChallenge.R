#Part 1: Linear Regression to Predict MPG
library(dplyr)
df1 <- read.csv("Resources/MechaCar_mpg.csv", check.names = F, stringsAsFactors = F) 
lm1 <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=df1)
summary(lm1)

#Part 2: Create Visualizations for the Trip Analysis
df2 <- read.csv("Resources/Suspension_Coil.csv", check.names = F, stringsAsFactors = F) 
  #2a:
total_summary <- df2 %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')
  #2b:
lot_summary <- df2 %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups = 'keep')

#Part 3: T-Tests on Suspension Coils
  #3a:
t.test(df2$PSI, mu=1500)
  #3b:
t.test(subset(df2$PSI, df2$Manufacturing_Lot == "Lot1"), mu=1500)
  #3c:
t.test(subset(df2$PSI, df2$Manufacturing_Lot == "Lot2"), mu=1500)
  #3d:
t.test(subset(df2$PSI, df2$Manufacturing_Lot == "Lot3"), mu=1500)