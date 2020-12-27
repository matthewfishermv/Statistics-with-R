# Simulate student grades.
grades <- round(rnorm(35, 88, 4.7), 1)

# Summarize graphically.
hist(grades, main="Histogram of Grades", xlab="Grade", ylab="Frequency")
stem(grades)

# Find percentage of students with grades of 90 or better.
grades >= 90
grades[grades >= 90]
length(grades[grades >= 90])
length(grades[grades >= 90]) / length(grades)

# Calculate arithmetic mean.
sum(grades) / length(grades)
mean(grades)

# Visualize skew caused by an outlier.
y <- c(10, 15, 14, 15, 4, 20, 5, 3, 2, 9, 12, 16, 6, 13, 10, 9,
       14,8, 9, 3, 2, 7, 11, 12, 13, 16, 8, 7, 5, 7, 6, 9, 4, 21, 30)
hist(y)
abline(v=mean(y), col="tomato2")

# Calculate median.
median(y)

# Five-number summary for student grades.
summary(grades)
range(grades)
IQR(grades)

# Check for 