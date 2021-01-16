# Linear Regression

## Contents

- [Contents](#contents)
- [Introduction](#introduction)
- [Scatterplots](#scatterplots)
  - [Form](#form)
  - [Direction](#direction)
  - [Strength](#strength)
- [Covariance](#covariance)
- [Correlation](#correlation)
- [Example: Heights and Ages](#example-heights-and-ages)
- [Data Frames in R](#data-frames-in-r)
- [References](#references)

## Introduction

In the previous modules, you have seen how to design experiments and work with variables, infer properties of a population from characteristics of a sample, and compare means across two populations. We turn next to a basic modelling technique - Simple Linear Regression.

In this module, you will learn how to create and interpret <ins>scatterplots</ins>, measure and test relationships between two variables in the same population through <ins>correlation</ins>, build and test a <ins>simple linear model</ins>, and assess the fit of a linear regression model using a <ins>global F-test</ins>.

These concepts will lay the groundwork for understanding Multiple Linear Regression and regression diagnostics in the next module.

## Scatterplots

*Code for this section:* [Scatterplots](/Linear-Regression/Scatterplots.R)

Let us first look at scatterplots to build an understanding of relationships between variables.

In a data set, there are often multiple variables rather than just one. In a data set about car accidents, for example, we may have variables for the number of cars involved, number of vehicles involved, road conditions, and weather conditions. Some of these variables are quantitative (they involve numbers) and others are qualitative (they involve categories).

A **scatterplot** is a graphical depiction of a data set, where one quantitative variable is plotted on the y-axis and one quantitative variable is plotted on the x-axis. The variable selected to be displayed on the y-axis is the **response variable** or **dependent variable**. The variable selected to be displayed on the x-axis is the **explanatory variable** or **independent variable**. In general, we are interested in showing that the independent variable on the x-axis is in some way related to the dependent variable on the y-axis.

A scatterplot is shown below for illustration:

![Example of a scatterplot](/Course-Content/Images/scatterplot.png)

Creating a scatterplot in R is simple - you use the same `plot()` function and pass in two variables:

```R
plot(x, y)
```

The first step in looking for a relationship between two variables is often to plot the variables on a scatterplot and assess whether a clear pattern exists. When reviewing a scatterplot, we assess three attributes - the form, direction, and strength of any perceived association. We will discuss each attribute in turn.

### Form

The **form** of a scatterplot is the general shape of the relationship between the independent and dependent variable [[1]](#references). It describes the overall pattern (or lack of pattern) in the scatterplot. The form may be **linear** (like a line), **curvilinear** (like a curve), or **random** (lacking a pattern).

In the plot above, you can perceive of a linear pattern, where as x increases, so does y. A curvilinear pattern may looks something like the plot below:

![Example of a curvilinear scatterplot pattern](/Course-Content/Images/scatterplot-curvilinear.png)

In a scatterplot with a random form, there appears to be no association between the variables:

![Example of a random scatterplot pattern](/Course-Content/Images/scatterplot-random.png)

### Direction

In this module, we are concerned primarily with a linear pattern. In such scatterplots, you can imagine drawing a line through the center of all the data points that captures the pattern of the data. Such lines are characterized by their **direction** as either **positive** (i.e., they have a positive slope) or **negative** (i.e., they have a negative slope). An example of each is shown below:

![Positive and negative association in a scatterplot](/Course-Content/Images/scatterplot-direction.png)

### Strength

If a linear association appears to exist, its **strength** can be assessed in terms of how closely clustered around the perceived line the data points appear to be. A **strong association** is one in which data points fall close to the line and a **weak association** is one in which data points do not fall close to the line. An example of each is shown below:

![Strong and weak association in a scatterplot](/Course-Content/Images/scatterplot-strength.png)

## Covariance

Imagine drawing a line through the center of the data points on a scatterplot. Doing so, you construct a model of the data - a line, whose formula roughly describes the overall shape of the data. You could hypothesize multiple lines, all of which model the data. Consider the three lines below in the scatterplot below:

![Approximate models in a scatterplot](/Course-Content/Images/scatterplot-lines.png)

All three lines roughly capture the shape and direction of the data. We begin to formalize the process of linear regression, which establishes a more precise model of the data by looking at covariance. **Covariance** is a measure of how much two variables differ from their respective means on average. The formula for the covariance of two variables is:

![Formula for covariance](/Course-Content/Images/Equations/covariance.png)

This measure summarizes the entire data set in terms of how the independent and dependent variable vary jointly from their respective means.

R provides a convenient function for calculating covariance, `cov()`. Given two variables `x`, `y`, their covariance can be calculated as:

```R
cov(x, y)
```

The covariance is the same whether `x` is the dependent variable or `y` is. That is, *cov(x, y) = cov(y ,x)*.

## Correlation

Extending the concept of covariance, we can standardize the (x - x̄) and (y - y̅) terms by dividing by the standard deviation of the variable. Recall that x - x̄ and y - y̅ are called errors. You may notice that by dividing the errors by their standard deviations, you are computing z-scores [[2]](#references). The standardized quantity is known as the **correlation coefficient** or **Pearson's correlation** and it measures linear dependence between two variables:

![Formula for correlation coefficient](/Course-Content/Images/Equations/correlation-coefficient.png)

Note that this is calculated as the covariance of the two variables divided by the product of the standard deviations of both variables. Thus the equation can also be stated as follows:

![Formula for correlation coefficient](/Course-Content/Images/Equations/correlation-coefficient-simplified.png)

Correlation measures how closely related two numeric variables are in a linear relationship [[2]](#references). The measure is useful because it takes on a range of values between -1 and 1. A value of 1 indicates the strongest possible positive association between x and y. A value of -1 indicates the strongest possible negative association between x and y. A value of 0 indicates no association between x and y. An example of each of these values of *r* are shown below:

![Correlation coefficient extreme values](/Course-Content/Images/correlation-coefficients.png)

R provides a convenient function for calculating the correlation coefficient, `cor()`. If you have two variables `x`, `y`, R will return the correlation coefficient if you pass the variables into the function:

```R
cor(x, y)
```

The correlation coefficient can be interpreted as the strength of a linear relationship between two numeric variables. The correlation is the same no matter which variable you select as the dependent variable. That is, *r<sub>xy</sub> = r<sub>yx</sub>*.

In your interpretation of correlation, it is absolutely critical to note that <ins>correlation does not imply causation</ins>. In other words, you cannot assume that one variable has an effect on the other just because a correlation exists [[3]](#references).

## Example: Heights and Ages

The heights (in inches) and ages (in years) of 30 people randomly sampled from a larger population are given below. Is there a correlation between a person's height and a person's age? Interpret the result.

> <ins>Heights<ins>
> 
> 66.9, 52.2, 56.5, 56.0, 62.3, 72.1, 68.3, 66.1, 69.1, 63.1, 70.2, 56.2, 75.2, 61.9, 72.7, 65.7, 54.1, 56.4, 49.5, 57.9, 53.8, 58.4, 63.8, 67.7, 86.3, 54.5, 59.4, 69.3, 50.3, 64.6
> 
> <ins>Ages</ins>
> 
> 55, 36, 71, 43, 10, 28, 46, 39, 59, 40, 49, 4, 34, 31, 40, 36, 50, 26, 32, 21, 29, 18, 28, 35, 47, 39, 27, 25, 75, 33

First, we load the data into R:

```R
heights <- c(66.9, 52.2, 56.5, 56.0, 62.3, 72.1, 68.3, 66.1, 69.1, 63.1,
             70.2,56.2, 75.2, 61.9, 72.7, 65.7, 54.1, 56.4, 49.5, 57.9,
             53.8, 58.4, 63.8, 67.7, 86.3, 54.5, 59.4, 69.3, 50.3, 64.6)
ages <- c(55, 36, 71, 43, 10, 28, 46, 39, 59, 40,
          49, 4, 34, 31, 40, 36, 50, 26, 32, 21,
          29, 18, 28, 35, 47, 39, 27, 25, 75, 33)
```

Next, we compute the correlation coefficient:

```R
cor(heights, ages)
[1] 0.04949018
```

We see that the correlation is close to zero, indicating that there is not a strong correlation between height and age in the population. We would expect a plot of heights and ages to appear random. Indeed, it does:

```R
plot(ages, heights, main="Heights and Ages", xlab="Age", ylab="Height")
r.text <- paste("r=", round(cor(heights, ages), 2), sep="")
mtext(r.text, col="tomato2")
```

The interpretation of this correlation coefficient is that a near-zero correlation exists, so there is not a strong linear association between age and height.

![Scatterplot of heights and ages showing random association](/Course-Content/Images/scatterplot-heights-ages-example.png)

## Data Frames in R

At this point, it will be useful to introduce a new data structure in R: data frames. A **data frame** is "a table or a two-dimensional array-like structure in which each column contains values of one variable and each row contains one set of values from each column" [[4]](#references). This is beneficial for working with data sets that have more than one variable.

You have already seen how to create vectors using the `c()` function. Vectors of related data can be combined into a data frame using the `data.frame()` function. Consider the variables below and we will show how to combine them into a data frame.

> <ins>Names</ins>
> 
> "Mark", "Sally", "Greg", "Patti", "Linda"

> <ins>Ages</ins>
> 
> 43, 37, 39, 48, 33

> <ins>Annual Salary</ins>
> 
> 74325, 49500, 50000, 84380, 34095

The variables are loaded into R as follows:

```R
names <- c("Mark", "Sally", "Greg", "Patti", "Linda")
ages <- c(43, 37, 39, 48, 33)
salary <- c(74325, 49500, 50000, 84380, 34095)
```

Using the `data.frame()` function, we can combine individual variables into a single table. In the example, we call this new variable `employees`:

```R
employees <- data.frame(name=names, age=ages, salary=salary)
```

Note that we give each column a name (name, age, salary) and attach the values (`names`, `ages`, `salary`).

Now if we print the variable, we can see the data frame:

```R
print(employees)
   name age salary
1  Mark  43  74325
2 Sally  37  49500
3  Greg  39  50000
4 Patti  48  84380
5 Linda  33  34095
```

We can now begin to slice and dice the data frame, looking for attributes of interest. Using the `$` notation, we can reference a specific column in the general form `variable$column`:

```R
employees$name
[1] "Mark"  "Sally" "Greg"  "Patti" "Linda"

employees$salary
[1] 74325 49500 50000 84380 34095
```

Using the `[]` notation, we can reference a specific cell or range of cells. The general form is `variable[row.number, column.number]`. We can find the age of the first employee (row 1, column 2) as follows:

```R
employees[1, 2]
[1] 43
```

By leaving out either the row number, we retrieve all rows. By leaving out the column number, we retrieve all columns. For example, we can retrieve all columns for the first employee as follows:

```R
employees[3, ]
  name age salary
3 Greg  39  50000
```

The other way to use the `[]` notation is by referencing column names. Single column names can be referenced in quotes, or multiple can be combined with the `c()` function:

```R
 employees[, 'salary']
[1] 74325 49500 50000 84380 34095

employees[, c('age', 'salary')]
  age salary
1  43  74325
2  37  49500
3  39  50000
4  48  84380
5  33  34095
```

We can apply conditional statements to slice and dice the data frame. For example, we can find out which employees are older than 35:

```R
employees$age > 35
[1]  TRUE  TRUE  TRUE  TRUE FALSE
```

And we can use this to retrieve the names salaries where the condition is met:

```R
employees[employees$age > 35, c('name','salary')]
   name salary
1  Mark  74325
2 Sally  49500
3  Greg  50000
4 Patti  84380
```

Using the concept of correlation, we could examine whether an employee's salary is associated with the employee's age:

```R
cor(employees$salary, employees$age)
[1] 0.9818334
```

The high correlation coefficient of 0.98 suggests a strong correlation between an employee's salary and age.

The flexibility of data frames makes working with data sets very easy in R. Many functions, such as those that import data from external sources, natively create data frames for you. Before continuing, make sure you are comfortable with the basics of data frames.

## References

1. https://courses.lumenlearning.com/wmopen-concepts-statistics/chapter/scatterplots-2-of-5/
2. Verzani, John. "Using R for Introductory Statistics". 2nd Edition, 2014, pp. 105-109.
3. Lander, Jared P. "R for Everyone: Advanced Analytics and Graphics". 2nd Edition, 2017, p. 252.
4. https://www.tutorialspoint.com/r/r_data_frames.htm
