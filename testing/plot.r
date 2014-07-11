###source("/cbcb/project-scratch/fdorri/Code/methylFlow/testing/plot.r") in  terminal R!

#!/usr/bin/Rscript
		######################################################################### LINUX #######################################
dir <- "/cbcb/project-scratch/fdorri/Code/methylFlow/testing/"



##### reading files ##################


CpGAvg <- read.table(paste(dir,"evalAvgCpG.txt",sep=""), sep="\t", row.names=NULL, header = FALSE)
readLengthAvg <- read.table(paste(dir,"evalAvgReadLength.txt",sep=""), sep="\t", row.names=NULL, header = FALSE)
coverageAvg <- read.table(paste(dir,"evalAvgCoverage.txt",sep=""), sep="\t", row.names=NULL, header = FALSE)


############## different plots for differnet # CPG #################################################################


#### plot the abundance Error for different number of CpG sites ############

print("plot abundance Error vs #CpG sites")
pdf(paste(dir,"/fig/","abdVCpG.pdf",sep=""))

        # get the range for the x and y axis
        xrange <- range(CpGAvg[,1])
        yrange <- range(CpGAvg[,3])
        ntrees <- length(unique(CpGAvg[,2]))
        # set up the plot
        plot(0, 0,
        pch = "",
        ylim = c(yrange[1], yrange[2] + .1),
        xlim = xrange,
        xlab="CpG",
        ylab="Abundance Error" )
        
        colors <- rainbow(ntrees)
        # add lines
        for (i in 1:ntrees) {
            j = 0.02 * i + 0.02
            print(j)
            
            sel <- which(CpGAvg[,2]==j)
            lines(CpGAvg[sel, 1],
            CpGAvg[sel, 3],
            col = colors[i])
        }
        # cex scale the size
        #pch = 16 is circle
        lx <- seq(30, 40, length.out=ntrees) + 5
        ly <- rep(yrange[2] + .1, ntrees)
        points(lx, ly,
        col = colors[1:28],
        pch = 16, cex=0.5)
        
        txt <- unique(CpGAvg[,2])
        sel1 <- c(1, (1:7)*4)
        
        text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
        text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


        dev.off()


#### plot the Methyl Call  Error for different number of CpG sites #############

print("plot methyl call Error vs #CpG sites")
pdf(paste(dir,"/fig/","methylVCpG.pdf",sep=""))


# get the range for the x and y axis
xrange <- range(CpGAvg[,1])
yrange <- range(CpGAvg[,4])
ntrees <- length(unique(CpGAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="CpG",
ylab="Methyl Call Error" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(CpGAvg[,2]==j)
    lines(CpGAvg[sel, 1],
    CpGAvg[sel, 4],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(CpGAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()

#### plot #TP for different number of CpG sites ##################

print("plot TP vs #CpG sites")
pdf(paste(dir,"/fig/","TPVCpG.pdf",sep=""))


# get the range for the x and y axis
xrange <- range(CpGAvg[,1])
yrange <- range(CpGAvg[,5])
ntrees <- length(unique(CpGAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="CpG",
ylab="TP" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(CpGAvg[,2]==j)
    lines(CpGAvg[sel, 1],
    CpGAvg[sel, 5],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(CpGAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()




######## plot sensitivity  for different number of CpG sites ###############


print("plot sensitivity vs #CpG sites")
pdf(paste(dir,"/fig/","sensitivityVCpG.pdf",sep=""))

sensitivity = CpGAvg[,5]/(CpGAvg[,5] + CpGAvg[,6])

# get the range for the x and y axis
xrange <- range(CpGAvg[,1])
yrange <- range(sensitivity)
ntrees <- length(unique(CpGAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="CpG",
ylab="sensitivity" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(CpGAvg[,2]==j)
    lines(CpGAvg[sel, 1],
    sensitivity[sel],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(CpGAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()



######## plot Precision(Positive Predictive Rate)  for different number of CpG sites ###############


print("plot precision vs #CpG sites")
pdf(paste(dir,"/fig/","precisionVCpG.pdf",sep=""))

precision = CpGAvg[,5]/(CpGAvg[,5] + CpGAvg[,7])

# get the range for the x and y axis
xrange <- range(CpGAvg[,1])
yrange <- range(precision)
ntrees <- length(unique(CpGAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="CpG",
ylab="precision" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(CpGAvg[,2]==j)
    lines(CpGAvg[sel, 1],
    precision[sel],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(CpGAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()


######## plot FDR false discovery rate  for different number of CpG sites ###############


print("plot false discovery rate vs #CpG sites")
pdf(paste(dir,"/fig/","FDRVCpG.pdf",sep=""))

FDR = CpGAvg[,7]/(CpGAvg[,5] + CpGAvg[,7])

# get the range for the x and y axis
xrange <- range(CpGAvg[,1])
yrange <- range(FDR)
ntrees <- length(unique(CpGAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="CpG",
ylab="FDR" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(CpGAvg[,2]==j)
    lines(CpGAvg[sel, 1],
    FDR[sel],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(CpGAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()






############## different plots for differnet read Length #################################################################


#### plot the abundance Error for different read Length

print("plot abundance Error vs read Length")
pdf(paste(dir,"/fig/","abdVreadLength.pdf",sep=""))

# get the range for the x and y axis
xrange <- range(readLengthAvg[,1])
yrange <- range(readLengthAvg[,3])
ntrees <- length(unique(readLengthAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="readLength",
ylab="Abundance Error" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(readLengthAvg[,2]==j)
    lines(readLengthAvg[sel, 1],
    readLengthAvg[sel, 3],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(readLengthAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()


#### plot the Methyl Call  Error for different read Length

print("plot methyl call Error vs readLength ")
pdf(paste(dir,"/fig/","methylVreadLength.pdf",sep=""))


# get the range for the x and y axis
xrange <- range(readLengthAvg[,1])
yrange <- range(readLengthAvg[,4])
ntrees <- length(unique(readLengthAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="readLength",
ylab="Methyl Call Error" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(readLengthAvg[,2]==j)
    lines(readLengthAvg[sel, 1],
    readLengthAvg[sel, 4],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(readLengthAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()

#### plot #TP for different read Length

print("plot TP vs readLength ")
pdf(paste(dir,"/fig/","TPVreadLength.pdf",sep=""))


# get the range for the x and y axis
xrange <- range(readLengthAvg[,1])
yrange <- range(readLengthAvg[,5])
ntrees <- length(unique(readLengthAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="readLength",
ylab="TP" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(readLengthAvg[,2]==j)
    lines(readLengthAvg[sel, 1],
    readLengthAvg[sel, 5],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(readLengthAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()




######## plot sensitivity  for different readLength  ###############


print("plot sensitivity vs readLength")
pdf(paste(dir,"/fig/","sensitivityVreadLength.pdf",sep=""))

sensitivity = readLengthAvg[,5]/(readLengthAvg[,5] + readLengthAvg[,6])

# get the range for the x and y axis
xrange <- range(readLengthAvg[,1])
yrange <- range(sensitivity)

 yy  <- ifelse(is.na(yrange[2]) , 0, yrange[2])
yrange[2] <- yy

yy  <- ifelse(is.na(yrange[1]) , 0, yrange[1])
yrange[1] <- yy

print(yrange[1])
print(yrange[2])

ntrees <- length(unique(readLengthAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="readLength",
ylab="sensitivity" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(readLengthAvg[,2]==j)
    lines(readLengthAvg[sel, 1],
    sensitivity[sel],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(readLengthAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()



######## plot Precision(Positive Predictive Rate)  for different readLength ###############


print("plot precision vs readLength")
pdf(paste(dir,"/fig/","precisionVreadLength.pdf",sep=""))

precision = readLengthAvg[,5]/(readLengthAvg[,5] + readLengthAvg[,7])

# get the range for the x and y axis
xrange <- range(readLengthAvg[,1])
yrange <- range(precision)
ntrees <- length(unique(readLengthAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="readLength",
ylab="precision" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(readLengthAvg[,2]==j)
    lines(readLengthAvg[sel, 1],
    precision[sel],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(readLengthAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()


######## plot FDR false discovery rate  for readLength ###############


print("plot false discovery rate vs readLength ")
pdf(paste(dir,"/fig/","FDRVreadLength.pdf",sep=""))

FDR = readLengthAvg[,7]/(readLengthAvg[,5] + readLengthAvg[,7])

# get the range for the x and y axis
xrange <- range(readLengthAvg[,1])
yrange <- range(FDR)
ntrees <- length(unique(readLengthAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="readLength",
ylab="FDR" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(readLengthAvg[,2]==j)
    lines(readLengthAvg[sel, 1],
    FDR[sel],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(readLengthAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()





############## different plots for differnet coverage rate #################################################################


#### plot the abundance Error for different coverage rate

print("plot abundance Error vs coverage rate")
pdf(paste(dir,"/fig/","abdVcoverage.pdf",sep=""))

# get the range for the x and y axis
xrange <- range(coverageAvg[,1])
yrange <- range(coverageAvg[,3])
ntrees <- length(unique(coverageAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="coverage",
ylab="Abundance Error" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(coverageAvg[,2]==j)
    lines(coverageAvg[sel, 1],
    coverageAvg[sel, 3],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(coverageAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()


#### plot the Methyl Call  Error for different coverage rate

print("plot methyl call Error vs coverage rate ")
pdf(paste(dir,"/fig/","methylVcoverage.pdf",sep=""))


# get the range for the x and y axis
xrange <- range(coverageAvg[,1])
yrange <- range(coverageAvg[,4])
ntrees <- length(unique(coverageAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="coverage",
ylab="Methyl Call Error" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(coverageAvg[,2]==j)
    lines(coverageAvg[sel, 1],
    coverageAvg[sel, 4],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(coverageAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()

#### plot #TP for different coverage rate

print("plot TP vs coverage rate ")
pdf(paste(dir,"/fig/","TPVcoverage.pdf",sep=""))


# get the range for the x and y axis
xrange <- range(coverageAvg[,1])
yrange <- range(coverageAvg[,5])
ntrees <- length(unique(coverageAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="coverage",
ylab="TP" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(coverageAvg[,2]==j)
    lines(coverageAvg[sel, 1],
    coverageAvg[sel, 5],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(coverageAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()




######## plot sensitivity  for different coverage  ###############


print("plot sensitivity vs coverage")
pdf(paste(dir,"/fig/","sensitivityVcoverage.pdf",sep=""))

sensitivity = coverageAvg[,5]/(coverageAvg[,5] + coverageAvg[,6])

# get the range for the x and y axis
xrange <- range(coverageAvg[,1])
yrange <- range(sensitivity)
ntrees <- length(unique(coverageAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="coverage",
ylab="sensitivity" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(coverageAvg[,2]==j)
    lines(coverageAvg[sel, 1],
    sensitivity[sel],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(coverageAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()



######## plot Precision(Positive Predictive Rate)  for different readLength ###############


print("plot precision vs coverage")
pdf(paste(dir,"/fig/","precisionVcoverage.pdf",sep=""))

precision = coverageAvg[,5]/(coverageAvg[,5] + coverageAvg[,7])

# get the range for the x and y axis
xrange <- range(coverageAvg[,1])
yrange <- range(precision)
ntrees <- length(unique(coverageAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="coverage",
ylab="precision" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(coverageAvg[,2]==j)
    lines(coverageAvg[sel, 1],
    precision[sel],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(coverageAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()


######## plot FDR false discovery rate  for readLength ###############


print("plot false discovery rate vs readLength ")
pdf(paste(dir,"/fig/","FDRVreadLength.pdf",sep=""))

FDR = coverageAvg[,7]/(coverageAvg[,5] + coverageAvg[,7])

# get the range for the x and y axis
xrange <- range(coverageAvg[,1])
yrange <- range(FDR)
ntrees <- length(unique(coverageAvg[,2]))
# set up the plot
plot(0, 0,
pch = "",
ylim = c(yrange[1], yrange[2] + .1),
xlim = xrange,
xlab="coverage",
ylab="FDR" )

colors <- rainbow(ntrees)
# add lines
for (i in 1:ntrees) {
    j = 0.02 * i + 0.02
    print(j)
    
    sel <- which(coverageAvg[,2]==j)
    lines(coverageAvg[sel, 1],
    FDR[sel],
    col = colors[i])
}
# cex scale the size
#pch = 16 is circle
lx <- seq(30, 40, length.out=ntrees) + 5
ly <- rep(yrange[2] + .1, ntrees)
points(lx, ly,
col = colors[1:28],
pch = 16, cex=0.5)

txt <- unique(coverageAvg[,2])
sel1 <- c(1, (1:7)*4)

text(xrange[1], yrange[2]+.1, "Legend", cex=0.5, pos=4)
text(lx[sel1], ly[sel1] - 0.02, txt[sel1], cex=0.5, srt=90)


dev.off()









