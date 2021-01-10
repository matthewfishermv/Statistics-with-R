# Example: Medical treatment
treatment <- c(98.2, 96.7, 93.0, 91.0, 98.5, 93.1, 99.7, 99.7, 93.9,
               99.1, 95.8,100.7, 104.3, 100.0, 96.2, 98.2, 99.5, 101.4)
control <- c(100.0, 96.8, 109.0, 100.0, 98.7, 96.1, 95.3, 101.7, 93.3,
             99.6, 96.8, 90.1, 97.1, 104.2, 97.1, 99.3, 100.4, 95.1)


# Calculate the mean and variance for each sample.
mean.treatment <- mean(treatment)
var.treatment <- var(treatment)
mean.control <- mean(control)
var.control <- var(control)

# Find the critical t-value.
critical.t <- dt(0.1, df=17)

# Compute the t-statistic.
test.t <- (mean.treatment - mean.control) /
  sqrt((var.treatment / 18) + (var.control / 18))
