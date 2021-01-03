# Draw a normal distribution plot.
x <- seq(-5, 5, by=0.1)
y <- dnorm(x)
plot(x, y, xaxt="n", yaxt="n", xlab="", ylab="", type="n",
     main="Confidence Levels and Signficance Levels")

# Shade 2.5% of the area under each tail.
polygon(c(-5, seq(-5, -1.96, by=0.01), -1.96),
        c(0, dnorm(seq(-5, -1.96, by=0.01)), 0),
        col="tomato2", border="tomato2")

polygon(c(1.96, seq(1.96, 5, by=0.01), 5),
        c(0, dnorm(seq(1.96, 5, by=0.01)), 0),
        col="tomato2", border="tomato2")

# Add the distribution curve.
lines(x, y, lwd=2)

# Add labels.
arrows(-1.96, 0.025, 1.96, 0.025, code=3)
text(0, 0.04, expression(1-alpha), adj=0.5, cex=1.5)

lines(c(-2.4, -3), c(0.01, 0.1))
text(-3, 0.13, expression(frac(alpha, 2)), adj=0.5, cex=1.5)

lines(c(2.4, 3), c(0.01, 0.1))
text(3, 0.13, expression(frac(alpha, 2)), adj=0.5, cex=1.5)

# Example: Confidence interval for infant birth weights.
z.upper <- qnorm(0.025, lower.tail=FALSE)

c(3400 - z.upper*(395/sqrt(150)),
  3400 + z.upper*(395/sqrt(150)))

# Visualize the infant birth weights example.
x <- seq(2400, 4400, by=1)
y <- dnorm(x, mean=3400, sd=395)
plot(x, y, type="l", lwd=2,
     main="Infant Birth Weights - 95% Confidence Interval", xlab="Weight", ylab="")

abline(v=3400, lty=2)
abline(v=(3400 - z.upper*(395/sqrt(150))))
abline(v=(3400 + z.upper*(395/sqrt(150))))
