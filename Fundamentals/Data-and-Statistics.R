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
