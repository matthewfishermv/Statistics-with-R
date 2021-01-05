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
z.critical <- qnorm(0.025, lower.tail=FALSE)
z.lower <- 3400 - z.critical * (395 / sqrt(150))
z.upper <- 3400 + z.critical * (395 / sqrt(150))

c(3400 - z.critical*(395/sqrt(150)),
  3400 + z.critical*(395/sqrt(150)))

# Visualize the infant birth weights example.
x <- seq(2400, 4400, by=1)
y <- dnorm(x, mean=3400, sd=395)
plot(x, y, type="l", lwd=2,
     main="Infant Birth Weights - 95% Confidence Interval", xlab="Weight", ylab="")

abline(v=3400, lty=2)
abline(v=z.lower, col="steelblue2")
abline(v=z.upper, col="steelblue2")


# Visualize three hypothesis testing scenarios.
par(mfrow=c(1, 3))

x <- seq(-3, 3, by=0.1)
y <- dnorm(x)

# Two-tailed test.
plot(x, y, type="l", main="Two-Tailed Test", xaxt="n", yaxt="n", xlab="", ylab="", lwd=2)
lines(c(qnorm(0.05), qnorm(0.05)), c(0, 0.1), lty=3, col="steelblue", lwd=2)
lines(c(qnorm(0.05, lower.tail=FALSE), qnorm(0.05, lower.tail=FALSE)), c(0, 0.1),
      lty=3, col="steelblue", lwd=2)

text(0, 0.1, expression(frac(alpha, 2)), col="steelblue", cex=1.5)
lines(c(-1.8, -0.3), c(0.05, 0.1), col="steelblue")
lines(c(1.8, 0.3), c(0.05, 0.1), col="steelblue")

# Left-tailed test.
plot(x, y, type="l", main="Left-Tailed Test", xaxt="n", yaxt="n", xlab="", ylab="", lwd=2)
lines(c(qnorm(0.05), qnorm(0.05)), c(0, 0.1), lty=3, col="steelblue", lwd=2)

text(0, 0.1, expression(alpha), col="steelblue", cex=1.5)
lines(c(-1.8, -0.3), c(0.05, 0.1), col="steelblue")

# Right-tailed test.
plot(x, y, type="l", main="Right-Tailed Test", xaxt="n", yaxt="n", xlab="", ylab="", lwd=2)
lines(c(qnorm(0.05, lower.tail=FALSE), qnorm(0.05, lower.tail=FALSE)), c(0, 0.1),
      lty=3, col="steelblue", lwd=2)

text(0, 0.1, expression(alpha), col="steelblue", cex=1.5)
lines(c(1.8, 0.3), c(0.05, 0.1), col="steelblue")


####
# Examples
####

# Example 1: Infant birth weights.
critical.z <- qnorm(0.05, lower.tail=TRUE)
print(critical.z)

test.z <- (3325 - 3400) / (395 / sqrt(150))
print(test.z)

# Example 2: Fluoride levels in water.
critical.z <- qnorm(0.025, lower.tail=FALSE)
print(critical.z)

test.z <- (0.8 - 0.7) / (0.4 / sqrt(40))
print(test.z)

####
# p-values
####

# Example 1.
pnorm(-2.33, lower.tail=TRUE)

# Example 2.
pnorm(-1.58, lower.tail=TRUE) + pnorm(1.58, lower.tail=FALSE)
2 * pnorm(-1.58, lower.tail=TRUE)

# Add p-values to visualization of tailed tests.
# Two-tailed test.
plot(x, y, type="l", main="Two-Tailed Test", xaxt="n", yaxt="n", xlab="", ylab="", lwd=2)
lines(c(qnorm(0.05), qnorm(0.05)), c(0, 0.1), lty=3, col="steelblue", lwd=2)
lines(c(qnorm(0.05, lower.tail=FALSE), qnorm(0.05, lower.tail=FALSE)), c(0, 0.1),
      lty=3, col="steelblue", lwd=2)

text(-2.2, 0.2, expression(P(z <= -z[alpha/2])), col="steelblue", cex=1.5)
text(2.2, 0.2, expression(P(z >= z[alpha/2])), col="steelblue", cex=1.5)
lines(c(-1.8, -2.2), c(0.05, 0.18), col="steelblue")
lines(c(1.8, 2.2), c(0.05, 0.18), col="steelblue")

# Left-tailed test.
plot(x, y, type="l", main="Left-Tailed Test", xaxt="n", yaxt="n", xlab="", ylab="", lwd=2)
lines(c(qnorm(0.05), qnorm(0.05)), c(0, 0.1), lty=3, col="steelblue", lwd=2)

text(-2.2, 0.2, expression(P(z <= -z[alpha])), col="steelblue", cex=1.5)
lines(c(-1.8, -2.2), c(0.05, 0.18), col="steelblue")

# Right-tailed test.
plot(x, y, type="l", main="Right-Tailed Test", xaxt="n", yaxt="n", xlab="", ylab="", lwd=2)
lines(c(qnorm(0.05, lower.tail=FALSE), qnorm(0.05, lower.tail=FALSE)), c(0, 0.1),
      lty=3, col="steelblue", lwd=2)

text(2.2, 0.2, expression(P(z >= z[alpha])), col="steelblue", cex=1.5)
lines(c(1.8, 2.2), c(0.05, 0.18), col="steelblue")