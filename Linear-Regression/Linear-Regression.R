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

####
# Regression fit
####

# Visualize regression components.
x <- c(10.1, 8.5, 9.0, 11.2, 10.2, 11.8, 10.5, 10.3, 11.0,
       10.1, 11.5, 10.4, 11.7, 9.8, 8.8, 10.5, 10.6, 10.3,
       9.2, 11.6, 11.7, 11.8, 10.4, 10.9, 9.9, 9.3, 9.2, 9.6,
       12.6, 10.5)
y <- c(9.4, 9.1, 8.5, 11.0, 9.5, 11.8, 9.6, 10.4, 10.1, 9.7,
       10.7, 11.1, 11.3, 9.8, 8.6, 10.7, 11.2, 11.0, 10.1,
       12.4, 11.5, 11.3, 9.9, 9.9, 10.0, 10.1, 9.7, 10.3,
       13.6, 11.3)
plot(x, y, main="Regression Components", xlab="", ylab="")

# Draw the linear model and mean line.
model <- lm(y ~ x)
abline(h=mean(y), col="steelblue", lwd=2, lty=3)
abline(model, col="tomato2", lwd=2)

# Add labels for regression line and mean line.
polygon(c(9, 9.5), c(9.17, 9.17), border="tomato2", lwd=2)
text(9.5, 9.17, expression(hat(y)==beta[0]+beta[1]*x+epsilon), pos=4, cex=1.5, col="tomato2")

polygon(c(11, 11.5), c(mean(y), 9.9), border="steelblue", lwd=2, lty=3)
text(11.5, 9.9, expression(bar(y)), cex=1.5, col="steelblue", pos=4)

# Draw a point on the regression line and lines showing the
# regression component and residual component.
points(11.6, predict(model)[20], pch=16)
polygon(c(11.6, 11.6), c(predict(model)[20], mean(y)), lwd=2, lty=3)
polygon(c(11.6, 11.6), c(predict(model)[20], y[20]), lwd=2, lty=3)

# Add labels fir regression an residual components.
polygon(c(10, 11.6), c(12, 12), lwd=2)
text(10, 12, expression(y[i] - hat(y)[i]), pos=2, cex=1.5)
text(10, 12.5, "Residual:", pos=2, cex=1.5)

polygon(c(10, 11.6), c(11, 11), lwd=2)
text(10, 11, expression(hat(y)[i] - bar(y)), pos=2, cex=1.5)
text(10, 11.5, "Regression:", pos=2, cex=1.5)

####
# Example: Marketing and sales
####

# Load the data into a data frame.
quarters <- c(1, 2, 3, 4, 5, 6, 7, 8)
marketing <- c(150, 145, 160, 180, 190, 190, 200, 210)
sales <- c(789, 766, 815, 823, 810, 880, 885, 900)

data <- data.frame(qarter=quarters, marketing, sales)

# Always plot the data first.
plot(data$sales ~ data$marketing, main="Sales vs. Marketing", xlab="Marketing ($100k)", ylab="Sales ($100k)")

# Build a linear model.
model <- lm(data$sales ~ data$marketing)

# Add the model to the plot.
abline(model, col="tomato", lwd=2)

# Test the model for significance.
summary(model)

# Values used in the formal test.
critical.t <- qt(0.025, df=6, lower.tail=FALSE)
print(critical.t)
