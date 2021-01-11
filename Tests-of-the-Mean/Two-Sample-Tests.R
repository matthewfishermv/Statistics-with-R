# Example: Medical treatment
treatment <- c(98.2, 96.7, 93.0, 91.0, 98.5, 93.1, 99.7, 99.7, 93.9,
               99.1, 95.8, 100.7, 104.3, 100.0, 96.2, 98.2, 99.5, 101.4,
               96.4, 99.2, 90.9, 97.4, 94.9, 96.8, 96.9, 96.8, 89.1,
               97.2, 96.9, 98.6, 101.3, 102.7, 95.4, 97.7, 92.9, 96.1)

control <- c(100.0, 96.8, 101.0, 100.0, 98.7, 96.1, 95.3, 101.7, 93.3,
             99.6, 96.8, 90.1, 97.1, 104.2, 97.1, 99.3, 100.4, 95.1,
             96.9, 92.3, 101.0, 96.8, 95.5, 97.8, 97.5, 98.8, 100.9,
             98.6, 96.8, 101.3, 95.1, 96.9, 99.0, 96.8, 98.7, 100.5)


# Calculate the mean and variance for each sample.
mean.treatment <- mean(treatment)
var.treatment <- var(treatment)
mean.control <- mean(control)
var.control <- var(control)

# Find the critical t-value.
df <- min(length(treatment), length(control)) - 1
critical.t <- qt(0.1, df=df)
print(critical.t)

# Compute the t-statistic.
test.t <- (mean.treatment - mean.control) /
  sqrt((var.treatment / length(treatment)) + (var.control / length(control)))
print(test.t)

# Find the associated p-value.
pt(test.t, df=df)

# Alternate method for carrying out the test.
t.test(treatment, control, alternative="less")
