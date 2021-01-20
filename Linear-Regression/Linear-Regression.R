####
# Visualize linear regression
####

# Simulate data points with a strong positive correlation.
x <- rnorm(50, 45, 4)
y <- jitter(x, amount=2)
plot(x, y, main="Linear Model of X and Y", xlab="X", ylab="Y")

# Add correlation coefficient to top margin.
r <- round(cor(x, y), 2)
r.text <- paste("r = ", r, sep="")
mtext(r.text, col="tomato2", cex=1.5)

# Build a linear model and add it to the plot.
model <- lm(y ~ x)
print(model)
abline(model, col="tomato2", lwd=2)

# Add centroid to the plot.
abline(v=mean(x), lwd=2, lty=3, col="darkgray")
abline(h=mean(y), lwd=2, lty=3, col="darkgray")
points(mean(x), mean(y), pch=16, cex=1.5)

####
# Visualize least squares method
####

# Simulate data points and add a linear regression line.
x <- rnorm(30, 30, 8)
y <- jitter(x, amount=10)
plot(x, y, main="Least Squares Regression", xlab="X", ylab="Y", pch=16)
model <- lm(y ~ x)
abline(model, col="tomato2", lwd=2)

# Add residual lines.
for (i in 1:length(x)) {
  polygon(c(x[i], x[i]), c(predict(model)[i], y[i]))
}

####
# Example: Ages of Spouses
####

# Load the data.
wife <- c(35, 59, 60, 74, 74, 81)
husband <- c(41, 56, 61, 68, 77, 77)
spouse.ages <- data.frame(wife, husband)

# Check for a linear relationship (correlation coefficient).
cor(spouse.ages$wife, spouse.ages$husband)

# Find the model for the linear relationship.
model <- lm(spouse.ages$wife ~ spouse.ages$husband)
print(model)
