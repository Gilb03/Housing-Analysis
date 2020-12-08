#READ DATA FROM SERVER 
house1 <- read.csv("http://bigblue.depaul.edu/jlee141/econdata/housing/mls2018_smpl.csv")


# DESCRIPTIVE STATISTICS PER VARIABLE


#GENERAL STATS OF HOUSES IN CHI
summary(house1)
head(house1)
tail(house1)


#DESC STATS BY VARIABLE 


#ZIP CODE
summary(house1$ZIP)
head(house1$ZIP)
tail(house1$ZIP)
by(house1, house1$ZIP, summary)


#HOUSE ID 
summary(house1$HOUSEID)
head(house1$HOUSEID)
tail(house1$HOUSEID)
by(house1, house1$HOUSEID, summary)

#YEAR
summary(house1$YEAR)
head(house1$YEAR)
tail(house1$YEAR)
by(house1, house1$YEAR, summary)

#HPRICE
summary(house1$HPRICE)
head(house1$HPRICE)
tail(house1$HPRICE)
by(house1, house1$HPRICE, summary)

#LOG_PRICE
summary(house1$LOG_PRICE)
head(house1$LOG_PRICE)
tail(house1$LOG_PRICE)
by(house1, house1$LOG_PRICE, summary)

#SQFT
summary(house1$SQFT)
head(house1$SQFT)
tail(house1$SQFT)
by(house1, house1$SQFT, summary)

#LOG_SQFT
summary(house1$LOG_SQFT)
head(house1$LOG_SQFT)
tail(house1$LOG_SQFT)
by(house1, house1$LOG_SQFT, summary)

#BEDROOM
summary(house1$BEDROOM)
head(house1$BEDROOM)
tail(house1$BEDROOM)
by(house1, house1$BEDROOM, summary)

#BATHROOM
summary(house1$BATHROOM)
head(house1$BATHROOM)
tail(house1$BATHROOM)
by(house1, house1$BATHROOM, summary)

#GARAGE
summary(house1$GARAGE)
head(house1$GARAGE)
tail(house1$GARAGE)
by(house1, house1$GARAGE, summary)

#AGEBLD
summary(house1$AGEBLD)
head(house1$AGEBLD)
tail(house1$AGEBLD)
by(house1, house1$AGEBLD, summary)

#FIREPLACE
summary(house1$FIREPLACE)
head(house1$FIREPLACE)
tail(house1$FIREPLACE)
by(house1, house1$FIREPLACE, summary)

#SOLD_30DAY
summary(house1$SOLD_30DAY)
head(house1$SOLD_30DAY)
tail(house1$SOLD_30DAY)
by(house1, house1$SOLD_30DAY, summary)


# HISTOGRAMS OF KEY VAREIABLES 

#LOG OF HOUSING PRICE VAR
hist(house1$LOG_PRICE)

#AGE OF BUILDING
hist(house1$AGEBLD)

# SQUAREFEET
hist(house1$SQFT)


#SCATTER PLOT 

#LOG HOUSE PRICE 


plot(LOG_PRICE, LOG_SQFT, main="Scatter Plot of Log_Price by Log_SQFT", col="blue")
abline(lm(LOG_SQFT~LOG_PRICE),col="red")



#MEDIAN PRICE BY BEDROOM
attach(house1)
tapply(HPRICE,BEDROOM,median)
tapply(HPRICE,ZIP,mean)


# TRAINING DATA 
set.seed(1937028)
train_ind <- sample(nrow(house1),round(0.75*nrow(house1)))
train     <- house1[train_ind,]
test      <- house1[-train_ind,]
