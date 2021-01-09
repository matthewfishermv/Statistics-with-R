# Visualize decision rule equivalence.
par(mfrow = c(1, 1))

x <- seq(-4, 4, by=0.1)
y <- dnorm(x)
critical.z <- qnorm(0.05)

# Left tail.
plot(x, y, type="n", xlab="", ylab="")
polygon(c(-4, seq(-4, critical.z, by=0.01), critical.z),
        c(0, dnorm(seq(-4, critical.z, by=0.01)), 0),
        col="tomato2", border=0)

# Right tail.
polygon(c(abs(critical.z), seq(abs(critical.z), 4, by=0.01), 4),
        c(0, dnorm(seq(abs(critical.z), 4, by=0.01)), 0),
        col="tomato2", border=0)
abline(v=abs(critical.z), col="steelblue", lty=3, lwd=2)
text(abs(critical.z), 0.35, "z", adj=-0.1, cex=1.5, col="steelblue")

# Add lines for distribution, population mean, sample mean.
lines(x, y, lwd=2, col="gray")
abline(v=0, lwd=2, col="steelblue")
text(0, 0.35, "µ", col="steelblue", adj=-0.7, cex=1.5)

mean.x <- 2.1
abline(v=mean.x, lwd=2)
text(mean.x, 0.35, expression(bar(x)), adj=-0.7, cex=1.5)
points(mean.x, dnorm(mean.x), pch=16, cex=1.5)

# Add confidence interval lines.
arrows(mean.x - 1.2, dnorm(mean.x), mean.x, dnorm(mean.x), lwd=2, code=1)
lines(c(mean.x - 1.2, mean.x - 1.2), c(dnorm(mean.x) - 0.025, dnorm(mean.x) + 0.025), lwd=2)
text(mean.x - 1.2, 0.08, expression(bar(x) - z %*% SE[bar(x)]), cex=1.1)

arrows(mean.x, dnorm(mean.x), mean.x + 1.2, dnorm(mean.x), lwd=2, code=2)
lines(c(mean.x + 1.2, mean.x + 1.2), c(dnorm(mean.x) - 0.025, dnorm(mean.x) + 0.025), lwd=2)
text(mean.x + 1.2, 0.08, expression(bar(x) + z %*% SE[bar(x)]), cex=1.1)
