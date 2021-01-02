# Draw a normal distribution plot.
x <- seq(-5, 5, by=0.1)
y <- dnorm(x)
plot(x, y, xaxt="n", yaxt="n", xlab="", ylab="", type="l", lwd=2, main="Normal Distribution")

# Visualize the 68-95-99.7 Rule.
plot(x, y, xlab="", ylab="", type="l", lwd=2, main="The 68-95-99.7 Rule")

abline(v=mean(y) - sd(y))
abline(v=mean(y) + sd(y))

abline(v=mean(y) - (2 * sd(y)))
abline(v=mean(y) + (2 * sd(y)))

abline(v=mean(y) - (3 * sd(y)))
abline(v=mean(y) + (3 * sd(y)))

# Visualize quantiles and probabilities.
plot(x, y, type="n", xlab="", ylab="",
     main="Normal Distribution: Quantiles, Densities, Probabilities")
polygon(c(-6, seq(-6, -1.96, 0.01), -1.96),
        c(dnorm(-6), dnorm(seq(-6, -1.96, 0.01)), -1.96),
        col="tomato2", border="tomato")
lines(x, y, lwd=2)

# Add labels.
lines(c(-3, -3.5), c(0, 0.1), col="tomato2")
text(-3.5, 0.125, "p", col="tomato2")

lines(c(-1.96, -1.96), c(-1, 0.2), col="steelblue")
text(-1.96, 0.225, "q", col="steelblue")

points(-1.96, dnorm(-1.96), pch=16, col="darkorange")
lines(c(-1.96, -1), c(dnorm(-1.96), dnorm(-1.96)), col="darkorange")
text(-0.75, dnorm(-1.96), "d", col="darkorange")

# Examples with the Normal Distribution.
pnorm(21.5, mean=22, sd=1.67)
qnorm(0.382, mean=22, sd=1.67)
dnorm(1.96)
