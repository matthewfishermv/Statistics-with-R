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
