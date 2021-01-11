# Example of matched pairs test.
# Load the data into R.
x <- c(6, 6, 4, 5, 8, 7)
y <- c(4, 5, 2, 5, 5, 1)

# Compute the difference between variables.
d <- x - y

# Compute the mean difference.
mean.difference <- sum(d) / length(d)
print(mean.difference)

# Perform matched pairs t-test.
t.test(x, y, paired = TRUE)
