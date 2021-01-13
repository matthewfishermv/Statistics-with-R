# Draw a scatterplot.
x <- seq(1, 100)
y <- seq(1, 100) + rnorm(100, sd=15)
plot(x, y, main="Scatterplot", xlab="X", ylab="Y")

# Visualize guess lines on the plot.
abline(a=0, b=1, col="red", lwd=2)
abline(a=-5, b=1.1, col="orange", lwd=2)
abline(a=5, b=0.9, col="green", lwd=2)

# Add mean lines and centroid.
abline(h=mean(y), lwd=2, lty=3)
abline(v=mean(x), lwd=2, lty=3)
points(mean(x), mean(y), pch=16, cex=2)

# Add linear regression line.
abline(lm(y ~ x), lwd=4)

# Show a curvilinear pattern.
x <- seq(-50, 100)
y <- jitter(a, factor=100) ^ 2
plot(x, y, main="Curvilinear Pattern", xlab="X", ylab="Y")

# Show a random pattern.
x <- seq(-500, 500)
y <- rnorm(1001, mean=10, sd=1)
plot(x, y, main="Random Pattern", xlab="X", ylab="Y")

# Show positive and negative associations.
par(mfrow=c(1, 2))

x <- seq(-100, 100)
y <- jitter(x, factor=400)
plot(x, y, main="Positive Association", xlab="X", ylab="Y")

x <- seq(-100, 100)
y <- 1 - jitter(x, factor=400)
plot(x, y, main="Negative Association", xlab="X", ylab="Y")

# Show weak and strong associations.
par(mfrow=c(1, 2))

x <- seq(-100, 100)
y <- jitter(x, factor=1)
plot(x, y, main="Strong Association", xlab="X", ylab="Y")

x <- seq(-100, 100)
y <- jitter(x, factor=500)
plot(x, y, main="Weak Association", xlab="X", ylab="Y")
