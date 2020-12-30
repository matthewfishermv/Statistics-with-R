library(datasets)
attach(faithful)

# Using Old Faithful Geyser Data from the datasets package, construct a simple
# linear model of eruption time as a function of waiting time.

# Produce a scatterplot.
plot(eruptions ~ waiting,
     main="Old Faithful Eruptions",
     xlab="Waiting Time (mins.)", ylab="Eruption Time (mins.)")

# Construct the linear model.
model <- lm(eruptions ~ waiting)
abline(model, col="tomato2")

# Add labels.
r <- cor(eruptions, waiting)
r2 <- summary(model)$adj.r.squared

label <- paste("r=", round(r, 2), ", R^2=", round(r2, 2), sep="")
mtext(label, side=3, adj=0, col="tomato2")


x <- seq(1, 35, by=1)
y <- choose(62, x)
plot(x, y, type="l")
