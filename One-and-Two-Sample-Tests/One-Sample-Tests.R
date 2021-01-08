# Example: Weight loss program.
critical.z <- qnorm(0.05, lower.tail=TRUE)
print(critical.z)

test.z <- (-2.26 - 0) / (6.58 / sqrt(42))
print(test.z)

pnorm(test.z, lower.tail=TRUE)

# Visualize this example.
x <- seq(-4, 4, by=0.1)
y <- dnorm(x)
plot(x, y, type="n", xlab="", ylab="")
lines(c(critical.z, critical.z), c(0, dnorm(critical.z)), col="steelblue", lty=3, lwd=2)
polygon(c(-4, seq(-4, test.z, by=0.001), test.z),
        c(0, dnorm(seq(-4, test.z, by=0.001)), 0),
        col="tomato2", border=0)
lines(c(test.z, test.z), c(0, 0.1), col="steelblue", lwd=2)
lines(x, y, lwd=2)

# Compare normal distribution with t-distribution.
x <- seq(-4, 4, by=0.1)

y.normal <- dnorm(x)
y.t.df5 <- dt(x, df=5)
y.t.df10 <- dt(x, df=10)
y.t.df25 <- dt(x, df=25)

plot(x, y.normal, lwd=2, type="l", xaxt="n", yaxt="n",
     main="Normal vs. T Distribution", xlab="", ylab="")
lines(x, y.t.df5, lwd=2, col="steelblue2", lty=3)
lines(x, y.t.df10, lwd=2, col="seagreen4", lty=3)
lines(x, y.t.df25, lwd=2, col="tomato2", lty=2)

text(0, 0.3, "Normal", cex=1.25)
text(0, 0.25, "T with 25 d.f.", cex=1.25, col="tomato2")
text(0, 0.2, "T with 10 d.f.", cex=1.25, col="seagreen4")
text(0, 0.15, "T with 5 d.f.", cex=1.25, col="steelblue2")

# Calculations in the t-distribution.
pt(-1.96, df=9)
qt(0.041, df=9)
dt(1.96, df=9)
qt(0.025, df=9, lower.tail=FALSE)
