# Show correlation coefficients.
par(mfrow=c(1, 3))

x <- seq(1, 50)
y <- seq(1, 50)
r <- cor(x, y)
r.text <- paste("r=", round(r, 0), sep="")
plot(x, y, main=r.text, xlab="", ylab="")

x <- seq(1, 50)
y <- rnorm(50)
r <- cor(x, y)
r.text <- paste("r=", round(r, 0), sep="")
plot(x, y, main=r.text, xlab="", ylab="")

x <- seq(1, 50)
y <- -1 * seq(1, 50)
r <- cor(x, y)
r.text <- paste("r=", round(r, 0), sep="")
plot(x, y, main=r.text, xlab="", ylab="")

####
# Example: Heights and Ages
####

par(mfrow=c(1,1))

# Load the data.
heights <- c(66.9, 52.2, 56.5, 56.0, 62.3, 72.1, 68.3, 66.1, 69.1, 63.1,
             70.2,56.2, 75.2, 61.9, 72.7, 65.7, 54.1, 56.4, 49.5, 57.9,
             53.8, 58.4, 63.8, 67.7, 86.3, 54.5, 59.4, 69.3, 50.3, 64.6)
ages <- c(55, 36, 71, 43, 10, 28, 46, 39, 59, 40,
          49, 4, 34, 31, 40, 36, 50, 26, 32, 21,
          29, 18, 28, 35, 47, 39, 27, 25, 75, 33)

# Compute the correlation coefficient - two methods.
cov(heights, ages)/(sd(heights) * sd(ages))
cor(heights, ages)

# Plot heights and ages.
plot(ages, heights, main="Heights and Ages", xlab="Age", ylab="Height")
r.text <- paste("r=", round(cor(heights, ages), 2), sep="")
mtext(r.text, col="tomato2")
