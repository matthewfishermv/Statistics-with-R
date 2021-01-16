# Create vectors from the values.
names <- c("Mark", "Sally", "Greg", "Patti", "Linda")
ages <- c(43, 37, 39, 48, 33)
salary <- c(74325, 49500, 50000, 84380, 34095)

# Combine the vectors into a table.
employees <- data.frame(name=names, age=ages, salary=salary)
print(employees)

# Reference specific areas of the frame.
employees$name
employees$salary
employees[1, 2]
employees[3, ]
employees[, 'salary']
employees[, c('age', 'salary')]

# Conditions on rows and columns.
employees$age > 35
employees[employees$age > 35, c('name','salary')]
