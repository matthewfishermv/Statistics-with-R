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

# Check for outliers in student grades.
low <- quantile(grades)['25%'] - (1.5 * IQR(grades))
high <- quantile(grades)['75%'] + (1.5 * IQR(grades))
grades[grades <= low]
grades[grades >= high]

# Generate a boxplot for student grades.
boxplot(grades, main="Boxplot for Student Grades", xlab="Grade", horizontal=TRUE)

# Generate a boxplot for a variable with an outlier.
y <- c(10, 15, 14, 15, 4, 20, 5, 3, 2, 9, 12, 16, 6, 13, 10, 9,
       14,8, 9, 3, 2, 7, 11, 12, 13, 16, 8, 7, 5, 7, 6, 9, 4, 21, 30)
boxplot(y, main="Boxplot with Outlier", horizontal=TRUE)

# Visualize variance.
plot(grades, main="Grades Data - Visualization of Variance", pch=16)
abline(h=mean(grades), lty=3)
for (i in 1:length(grades)) lines(c(i, i), c(mean(grades), grades[i]), col="tomato2")

# Calculate variance for student grades.
grades - mean(grades)
(grades - mean(grades)) ^ 2
sum((grades - mean(grades)) ^ 2)

length(grades) - 1
sum((grades - mean(grades)) ^ 2)/(length(grades) - 1)

var(grades)
