# Simulate student grades.
grades <- round(rnorm(35, 88, 4.7), 1)

# Summarize graphically.
hist(grades, main="Histogram of Grades", xlab="Grade", ylab="Frequency")
stem(grades)

# Summarize numerically.
