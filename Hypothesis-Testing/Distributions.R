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

# Examples with infant birth weights.
mean.birth.weight <- 3500
sd.birth.weight <- 395

# 1. What percentage weigh more than 3,750 grams?
1 - pnorm(3750, mean.birth.weight, sd.birth.weight)
pnorm(3750, mean.birth.weight, sd.birth.weight, lower.tail=FALSE)

# 2. What percentage weigh between 3,105 grams and 3,895 grams?
pnorm(3895, mean.birth.weight, sd.birth.weight) -
  pnorm(3105, mean.birth.weight, sd.birth.weight)

# 3. What do the top 5% of infants weigh?
qnorm(0.05, mean.birth.weight, sd.birth.weight, lower.tail=FALSE)


# Visualize the infant weights examples.
x <- seq(mean.birth.weight - (3 * sd.birth.weight),
         mean.birth.weight + (3 * sd.birth.weight))
y <- dnorm(x, mean.birth.weight, sd.birth.weight)

par(mfrow=c(1, 3))

plot(x, y, type="n", main="Birth Weights >= 3750",
     xlab="Birth Weight", ylab="Density")
polygon(c(3750, seq(3750, 5000), 5000),
          c(0, dnorm(3750, mean.birth.weight, sd.birth.weight),
            dnorm(seq(3750, 5000), mean.birth.weight, sd.birth.weight)),
        col="tomato2", border="tomato2")
lines(c(3750, 3750), c(0, 1), col="steelblue")
text(4000, 1e-03, "q=3750", col="steelblue", cex=1.5, adj=0)
lines(x, y, lwd=2)

plot(x, y, type="n", main="Birth Weights Between 3105, 3895",
     xlab="Birth Weight", ylab="Density")
polygon(c(3105, seq(3105, 3895), 3895, 3895),
        c(0, dnorm(3105, mean.birth.weight, sd.birth.weight),
          dnorm(seq(3105, 3895), mean.birth.weight, sd.birth.weight), 0),
        col="tomato2", border="tomato2")
lines(c(3105, 3105), c(0, 1), col="steelblue")
text(3050, 1e-03, "q1=3105", col="steelblue", cex=1.5, adj=1)
lines(c(3895, 3895), c(0, 1), col="steelblue")
text(4000, 1e-03, "q2=3895", col="steelblue", cex=1.5, adj=0)
lines(x, y, lwd=2)

weights <- seq(qnorm(0.05, mean.birth.weight, sd.birth.weight, lower.tail=FALSE), 5000)

plot(x, y, type="n", main="Birth Weights Top 5%",
     xlab="Birth Weight", ylab="Density")
polygon(c(weights[1], weights, weights[length(weights)]),
        c(0, dnorm(weights, mean.birth.weight, sd.birth.weight), 0),
        col="tomato2", border="tomato2")
lines(c(3750, 4250), c(1e-04, 1e-04), col="tomato2")
text(3750, 1e-04, "p=5%", col="tomato2", cex=1.5, adj=1)
lines(x, y, lwd=2)
