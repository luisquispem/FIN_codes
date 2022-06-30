"---------------------------"
"Getting data and analyzing it"
"---------------------------"

#install.packages("quantmod")
library(quantmod)

#getSymbols for daily value of WILL5000IND, source: FRED
wilsh <- getSymbols("WILL5000IND", src="FRED", auto.assign = FALSE)
wilsh <- na.omit(wilsh) #omit NaN
wilsh <- wilsh["1979-12-31/2017-12-31"] #select date range
names(wilsh) <- "TR"   #name column

#display some data
head(wilsh, 3)   #first 3 rows
tail(wilsh, 3)   #last 3 rows

"---------------------------"
"Calculate daily returns"
"---------------------------"

#calcualte daily return using natural logarithm and removing first NaN
logret <- diff(log(wilsh))[-1]
head(logret, 10)
round(head(logret,3),6)  #show only 6 decimals

#transform the log-return to discrete-return
levelret <- exp(logret)-1
head(levelret, 3)  #very similar

"----------------------------------"
"Calculate weekly or longer returns"
"----------------------------------"
#collect the data
getSymbols("WILL5000IND",src="FRED")
wilsh <- na.omit(WILL5000IND)
wilsh <- wilsh["1979-12-31/2017-12-31"]
names(wilsh) <- "TR"

# Next, we calculated its daily log returns:
logret <- diff(log(wilsh))[-1]

# We then used the following R commands to calculate longer horizon log returns:
logret.w <- apply.weekly(logret,sum)
logret.m <- apply.monthly(logret,sum)
logret.q <- apply.quarterly(logret,sum)
logret.y <- apply.yearly(logret,sum)

# From these series, we calculated longer horizon discrete returns:
ret.w <- exp(logret.w)-1
ret.m <- exp(logret.m)-1
ret.q <- exp(logret.q)-1
ret.y <- exp(logret.y)-1


"----------------------------------"
"Graded Quiz 1-v1 -> YEN"   #OK!
"----------------------------------"
#collect the data
getSymbols("DEXJPUS",src="FRED")
yen <- na.omit(DEXJPUS)
xchng <- 1/yen
xchng <- xchng["1979-12-31/2017-12-31"]
names(xchng) <- "xchng"

head(xchng, 3)   #first 3 rows

# Next, we calculated its daily log returns:
logret <- diff(log(xchng))[-1]
head(logret, 10)
round(head(logret,3),6)  

# Monthly returns:
logret.m <- apply.monthly(logret,sum)
round(head(logret.m,3),6)  

ret.m <- exp(logret.m)-1  #monthly discrete return
round(head(ret.m,3),6)  

# Quarterly returns:
logret.q <- apply.quarterly(logret,sum)
round(tail(logret.q,3),6)  

# Yearly returns:
logret.y <- apply.yearly(logret,sum)
ret.y <- exp(logret.y)-1
round(tail(ret.y,3),6)  


"----------------------------------"
"Quiz 1-v2 -> BRITISH POUND"
"----------------------------------"
#collect the data
getSymbols("DEXUSUK",src="FRED")
pound <- na.omit(DEXUSUK)
pound <- pound["1979-12-31/2017-12-31"]
names(pound) <- "poundxdollar"

# Next, we calculated its daily log returns:
logret <- diff(log(pound))[-1]
head(logret, 10)
round(head(logret,3),6)  

#Monthly returns
logret.m <- apply.monthly(logret,sum)
ret.m <- exp(logret.m)-1
round(head(logret.m,3),6)  

#quarterly returns
logret.q <- apply.quarterly(logret,sum)
round(tail(logret.q,3),6)  

# Yearly returns:
logret.y <- apply.yearly(logret,sum)
ret.y <- exp(logret.y)-1
round(tail(ret.y,3),6) 



"----------------------------------"
"Quiz 1-v3 -> SWISS FRANC"   #OK!
"----------------------------------"
#collect the data
getSymbols("DEXSZUS",src="FRED") #collect data
swiss <- na.omit(DEXSZUS)        #drop NaN
franc = 1/swiss                  #return
franc <- franc["1979-12-31/2017-12-31"]
names(franc) <- "xchng"

# Next, we calculated its daily log returns:
logret <- diff(log(franc))[-1]
head(logret, 10)
round(head(logret,3),6)  

#Monthly returns
logret.m <- apply.monthly(logret,sum)
ret.m <- exp(logret.m)-1
round(head(ret.m,3),6)  

#quarterly returns
logret.q <- apply.quarterly(logret,sum)
round(tail(logret.q,3),6)  

# Yearly returns:
logret.y <- apply.yearly(logret,sum)
ret.y <- exp(logret.y)-1
round(tail(ret.y,3),6) 


"----------------------------------"
"Quiz 1-v4 -> AUSSIE"   #OK!
"----------------------------------"
#collect the data
getSymbols("DEXUSAL",src="FRED") #collect data
aussie <- na.omit(DEXUSAL)        #drop NaN
aussie <- aussie["1979-12-31/2017-12-31"]
names(aussie) <- "aussie"

# Next, we calculated its daily log returns:
logret <- diff(log(aussie))[-1]
head(logret, 10)
round(head(logret,3),6)  

#Monthly returns
logret.m <- apply.monthly(logret,sum)
ret.m <- exp(logret.m)-1
round(head(ret.m,3),6)  

#quarterly returns
logret.q <- apply.quarterly(logret,sum)
round(tail(logret.q,3),6)  

# Yearly returns:
logret.y <- apply.yearly(logret,sum)
ret.y <- exp(logret.y)-1
round(tail(ret.y,3),6) 
