
sart <- read.csv("......csv")


#clean the sart to just have correct colums
library(dplyr)
columns_to_remove <- c("UTC.Timestamp", "UTC.Date.and.Time","Local.Timestamp", "Local.Timezone","Local.Date.and.Time","Experiment.Version","Tree.Node.Key", "Repeat.Key", "Participant.Public.ID",
                       "Participant.Starting.Group", "Participant.Status", "Participant.Completion.Code", "Participant.External.Session.ID", "Participant.Device.Type",
                       "Participant.Device", "Participant.OS", "Participant.Browser", "Participant.Monitor.Size", "Participant.Viewport.Size", "Checkpoint", "Room.ID", "Room.Order",
                       "Task.Name", "Task.Version", "spreadsheet.Name", "Spreadsheet", "Spreadsheet.Row", "Zone.Name", "Reaction.Onset", "Responce.Type", "Dishonest", "X.Coordinate", "Y.Coordinate",
                       "randomise_blocks", "randomise_trials", "display", "ANSWER", "UTC.Timestamp", "Spreadhseet.Name", "Local.Date.and.Time", 'Spreadsheet.Name','Response.Type','Correct','Incorrect','ANSWER',"correct","type")

filtered_data <- subset(sart, select = -which(names(sart) %in% columns_to_remove))

## get rid of irrelevent rows in the data 
filtered_data$Trial.Number<-as.numeric(filtered_data$Trial.Number)
# Cleaning everything that happens before Trial.number ==19
data<-subset(filtered_data, filtered_data$Trial.Number>18)

## 2 random sessions to be tested
#uno<-subset(data,data$Schedule.ID==34418755)
#dos<-subset(data,data$Schedule.ID==34453206)

all<-data %>% distinct(Schedule.ID, Trial.Number, .keep_all = TRUE)

# Finding when a key was pressed
all$Attempt_corrected<-all$Attempt
all["Attempt_corrected"][is.na(all["Attempt_corrected"])] <- 0
# Finding accuracy
all$accuracy<-NA
all$accuracy<-ifelse (all$Attempt_corrected==1&all$number!=3,'correct',all$accuracy)
all$accuracy<-ifelse (all$Attempt_corrected==1&all$number==3,'incorrect',all$accuracy)
all$accuracy<-ifelse (all$Attempt_corrected==0&all$number==3,'correct',all$accuracy)
all$accuracy<-ifelse (all$Attempt_corrected==0&all$number!=3,'incorrect',all$accuracy)


all <- all[all$Reaction.Time <= 2800, ]
# Plot
all <- within(all, {
  accuracy   <- factor(accuracy)
  Schedule.ID <- factor(Schedule.ID)
  
  #session <- factor(session)
})

library(ggplot2)
# Graph with Standard error of the mean
p <- ggplot(all, aes(x=Trial.Number, y=Reaction.Time, colour=Schedule.ID, group=Schedule.ID)) + 
  #geom_errorbar(aes(ymin=CV-se, ymax=CV+se), width=.1) +
  geom_line(linetype="dashed") +
  geom_point(size=3, shape=18) + 
  xlab("Trial") +
  ylab("Reaction time") +
  #scale_colour_hue(name="Content",    
  #                breaks=c("1", "2"),
  #               labels=c("Task related", "Task unrelated"),
  #               l=40) +                    
  theme_bw()
p
#p + geom_vline(xintercept = 11, color="red")
ggsave("", p)

########################################################################
# Calculate proportion of errors
all$accuracy2<-ifelse (all$accuracy=="correct",1,0)
total_correct<-sum(all$accuracy2)
total_trials<-nrow(all)
proportion_correct<-total_correct/total_trials

########################################################################
# RTCV
# 1. GRoup trials in groups of 9 trials (aprox 24.3 seconds)
all$new_trial<- all$Trial.Number-18
all$group<-rep(1:25,each=9)

# 2. Clean the dataset from error trials & NOGO trials
# DAtaset without error trials
all_correct<-subset(all, all$accuracy2==1)
# Dataser without correct NO-GO trials
all_correct<-subset(all_correct, all_correct$number!=3)

# Plot to see the new clean dataset
q <- ggplot(all_correct, aes(x=Trial.Number, y=Reaction.Time, colour=Schedule.ID, group=Schedule.ID)) + 
  #geom_errorbar(aes(ymin=CV-se, ymax=CV+se), width=.1) +
  geom_line(linetype="dashed") +
  geom_point(size=3, shape=18) + 
  xlab("Trial") +
  ylab("Reaction time") +
  #scale_colour_hue(name="Content",    
  #                breaks=c("1", "2"),
  #               labels=c("Task related", "Task unrelated"),
  #               l=40) +                    
  theme_bw()
q
ggsave(".....", q)
write.csv(all_correct, ".....csv", row.names = TRUE)
# 3. Calculate RTCV

# Standard deviations
myTest.SD <- aggregate(all_correct$Reaction.Time,
                       by = list(all_correct$Schedule.ID,all_correct$Participant.Private.ID,all_correct$group),
                       FUN = 'sd')

colnames(myTest.SD) <- c("Schedule","Participant","group_trials","SD")

# Mean RT
result.mean <- mean(all_correct$Reaction.Time)

# Coefficient of Variability (CV): SD of 9 trials
myTest.SD$RTCV<-myTest.SD$SD/result.mean
myTest.SD <- myTest.SD[order(myTest.SD$Schedule), ]
head(myTest.SD)

########################################################################################################################
########################## GRAPH

#library(Rmisc)
#tgc <- summarySE(myTest.SD, measurevar="RTCV", groupvars=c("Schedule"))
#tgc

library(ggplot2)
# Graph with Standard error of the mean
test <- ggplot(myTest.SD, aes(x=group_trials, y=RTCV , colour=Schedule, group=Schedule )) + 
  #geom_errorbar(aes(ymin=RTCV-se, ymax=RTCV+se), width=.1) +
  geom_line(linetype="dashed") +
  geom_point(size=3, shape=18) + 
  xlab("Time") +
  ylab("RTCV") +
  #scale_colour_hue(name="Session",    
  #                breaks=c("1", "2"),
  #               labels=c("Task related", "Task unrelated"),
  #              l=40) +                    
  theme_bw()
write.csv(myTest.SD, ".....csv", row.names = TRUE)
ggsave("......png", test)
