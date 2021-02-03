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
- [Test for Correlation](#test-for-correlation)
  - [Example: Heights and Ages](#example-heights-and-ages-1)
- [Linear Regression](#linear-regression)
  - [Equation of the Linear Regression Line](#equation-of-the-linear-regression-line)
  - [Example: Ages of Spouses](#example-ages-of-spouses)
- [Assessing Linear Regression Fit](#assessing-linear-regression-fit)
  - [Regression Components](#regression-components)
  - [Coefficient of Variation](#coefficient-of-variation)
- [Linear Regression Tests](#linear-regression-tests)
  - [T-Test for Linear Regression](#t-test-for-linear-regression)
- [Summary](#summary)
- [References](#references)

## Introduction

In the previous modules, you have seen how to design experiments and work with variables, infer properties of a population from characteristics of a sample, and compare means across two populations. We turn next to a basic modelling technique - Simple Linear Regression.

In this module, you will learn how to create and interpret <ins>scatterplots</ins>, measure and test relationships between two variables in the same population through <ins>correlation</ins>, build and test a <ins>simple linear model</ins>, and assess the fit of a linear regression model using the <ins>coefficient of determination</ins>.

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

In the plot above, you can perceive of a linear pattern, in which as x increases, so does y. A curvilinear pattern may look something like the plot below:

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

*Code for this section:* [Correlation](/Linear-Regression/Correlation.R)

Extending the concept of covariance, we can standardize the (x - x̄) and (y - y̅) terms by dividing by the standard deviation of the variable. Recall that x - x̄ and y - y̅ are called errors. You may notice that by dividing the errors by their standard deviations, you are computing z-scores [[2]](#references). The standardized quantity is known as the **correlation coefficient** or **Pearson's correlation** and it measures linear dependence between two variables:

![Formula for correlation coefficient](/Course-Content/Images/Equations/correlation-coefficient.png)

Note that this is calculated as the covariance of the two variables divided by the product of the standard deviations of both variables. Thus, the equation can also be stated as follows:

![Formula for correlation coefficient](/Course-Content/Images/Equations/correlation-coefficient-simplified.png)

Correlation measures how closely related two numeric variables are in a linear relationship [[2]](#references). The measure is useful because it takes on a range of values between -1 and 1. A value of 1 indicates the strongest possible positive association between x and y. A value of -1 indicates the strongest possible negative association between x and y. A value of 0 indicates no association between x and y. An example for each of these values of *r* is shown below:

![Correlation coefficient extreme values](/Course-Content/Images/correlation-coefficients.png)

R provides a convenient function for calculating the correlation coefficient, `cor()`. If you have two variables `x`, `y`, R will return the correlation coefficient if you pass the variables into the function:

```R
cor(x, y)
```

The correlation coefficient can be interpreted as the strength of a linear relationship between two numeric variables. The correlation is the same no matter which variable you select as the dependent variable. That is, *r<sub>xy</sub> = r<sub>yx</sub>*.

In your interpretation of correlation, it is crucial to note that <ins>correlation does not imply causation</ins>. In other words, you cannot assume that one variable has an effect on the other just because a correlation exists [[3]](#references).

### Example: Heights and Ages

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

*Code for this section:* [Data Frames](/Linear-Regression/Data-Frames.R)

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

By leaving out the row number, we retrieve all rows. By leaving out the column number, we retrieve all columns. For example, we can retrieve all columns for the first employee as follows:

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

The flexibility of data frames makes working with data sets quite easy in R. Many functions, such as those that import data from external sources, natively create data frames for you. Before continuing, make sure you are comfortable with the basics of data frames.

## Test for Correlation

*Code for this section:* [Correlation](/Linear-Regression/Correlation.R)

A test statistic exists for correlation, allowing us to formally test the strength of a linear association between two variables. We use a t-test [[5]](#references):

![Formula for t-test for correlation](/Course-Content/Images/Equations/t-test-correlation.png)

We use *n - 2* degrees of freedom in the t-distribution since we have already estimated two parameters: the means of the variables and the correlation coefficient.

Recall that the purpose for making inferences based on a sample statistic is to estimate a population parameter to a level of confidence. In the case of correlation, we use the sample correlation coefficient, *r*, to estimate the population correlation, *ρ* (Greek letter "rho"). Thus, the hypothesis tests for correlation are:

> H<sub>0</sub>: ρ = 0 (there is no linear association)
> 
> **Left-tailed test**: H<sub>1</sub>: ρ < 0 (there is a negative linear association)
> 
> **Right-tailed test**: H<sub>1</sub>: ρ > 0 (there is a positive linear association)
> 
> **Two-tailed test**: H<sub>1</sub>: ρ ≠ 0 (there is a positive or negative linear association)

R provides a function for carrying out a formal correlation t-test, `cor.test()`.

### Example: Heights and Ages

The heights (in inches) and ages (in years) of 30 people randomly sampled from a larger population are given below. Formally test whether there is a correlation between a person's height and a person's age.

> <ins>Heights<ins>
> 
> 66.9, 52.2, 56.5, 56.0, 62.3, 72.1, 68.3, 66.1, 69.1, 63.1, 70.2, 56.2, 75.2, 61.9, 72.7, 65.7, 54.1, 56.4, 49.5, 57.9, 53.8, 58.4, 63.8, 67.7, 86.3, 54.5, 59.4, 69.3, 50.3, 64.6
> 
> <ins>Ages</ins>
> 
> 55, 36, 71, 43, 10, 28, 46, 39, 59, 40, 49, 4, 34, 31, 40, 36, 50, 26, 32, 21, 29, 18, 28, 35, 47, 39, 27, 25, 75, 33

After loading the data into R, we can use the `cor.test()` function to carry out the test. We use the five-step procedure for hypothesis testing.

**State the hypotheses and significance level**

> H<sub>0</sub>: ρ = 0 (there is no linear association)
> 
> H<sub>1</sub>: ρ ≠ 0 (there is a positive or negative linear association)
> 
> α = 0.05

**Select the test statistic**

![Formula for t-statistic/t-test](/Course-Content/Images/Equations/t-test-correlation.png)

**State the decision rule**

We find a critical value from the t-distribution with *n - 2 = 28* degrees of freedom a left-hand tail probability of α, t<sub>0.025, 28</sub>:

```R
critical.t <- qt(0.025, df=length(heights) - 2, lower.tail=FALSE)
print(critical.t)
[1] 2.048407
```

We reject H<sub>0</sub> if the p-value associated with the t-statistic is less than α. Otherwise, we fail to reject H<sub>0</sub>.

**Compute the test statistic**

```R
test.t <- (r * sqrt(length(heights) - 2)) /
  (sqrt(1 - r ^ 2))
print(test.t)
[1] 0.2621987
```

The p-value associated with this t-statistic is:

```R
pt(test.t, df=length(heights) - 2, lower.tail=FALSE) * 2
[1] 0.7950877
```

**Draw a conclusion**

We fail to reject the null hypothesis H<sub>0</sub>: ρ = 0 since 0.80 > 0.05. We do not have significance evidence at the *α = 0.05* level that a linear association exists between age and height.

**Alternate method**

We could have carried out this test using the `cor.test()` function in R, which produces the same results:

```R
cor.test(heights, ages)

	Pearson's product-moment correlation

data:  heights and ages
t = 0.2622, df = 28, p-value = 0.7951
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 -0.3164208  0.4025815
sample estimates:
       cor 
0.04949018
```

## Linear Regression

*Code for this section:* [Linear Regression](/Linear-Regression/Linear-Regression.R)

Correlation sets out to show whether a linear relationship exists between two variables. **Linear regression** extends the concept of correlation by establishing the equation of the line that describes the linear relationship. The process for establishing a linear regression line builds a model that fits the observed data.

This is useful because it allows us to make predictions. That is, we can estimate the value of the dependent variable for any value of the independent variable, even those values that were not measured in the sample.

The process for carrying out a linear regression is similar to the process for computing test statistics - we estimate a population parameter from the sample data. When we perform linear regression with one dependent variable and one independent variable, it is called **simple linear regression**, sometimes abbreviated as SLR. The general equation for simple linear regression is:

![Formula for simple linear regression](/Course-Content/Images/Equations/linear-regression-simple.png)

where:

- *y* is the dependent variable,
- *β<sub>0</sub>* is the *y*-intercept of the line,
- *β<sub>1</sub>* is the slope of the line,
- *x* is the independent variable, and
- *ε* (Greek letter "epsilon") is the error term.

You may notice this equation follows the slope-intercept form of a line, *y = a + bx*. When performing simple linear regression, we are interested in estimating *β<sub>1</sub>*, the slope of the line. The population parameter we are estimating is *β<sub>1</sub>* ("beta-1") and the estimate notation has a hat over it ("beta-hat-1"). This is the **slope coefficient**:

![Beta-hat-1 - the slope coefficient](/Course-Content/Images/Equations/beta-hat-1.png)

To visualize linear regression, suppose you have two variables *X*, *Y* with some positive linear relationship (as determined by observing the scatterplot and formally testing for correlation). Such an example is shown below.

![Example of positively correlated variables](/Course-Content/Images/linear-regression-XY-example.png)

In R, we compute a linear model by using the `lm()` function and passing in the dependent and independent variables in the form `dependent.variable ~ independent.variable`. This notation is called a **model formula** in R [[6]](#references). If we have two variables `x`, `y` in R, we can construct a linear model from them with `y` as the dependent variable as follows:

```R
model <- lm(y ~ x)
```

You can view the coefficients (y-intercept and slope) by printing the output:

```R
print(model)

Call:
lm(formula = y ~ x)

Coefficients:
(Intercept)            x  
     0.5983       0.9885
```

This example shows a linear relationship constructed with `y` as the dependent variable and `x` as the independent variable. The equation we extract is *y = 0.60 + 0.99x*. Adding the model to the plot using the `abline()` function, we can see that the model is a best-fit line for the data:

```R
abline(model)
```

![Example of linear regression line](/Course-Content/Images/linear-regression-XY-model-example.png)

### Equation of the Linear Regression Line

The equation for the regression line can be computed by hand, but we usually rely on software like R to calculate the line for us. With that in mind, let us develop an understanding for where the equation comes from. The equation for the **least-squares regression line**, which is the simple linear regression line we are interested in, is:

![Equation of the least-squares regression line](/Course-Content/Images/Equations/linear-regression-simple-estimate.png)

The hat symbol (^) above y and the beta coefficients indicates that these quantities are *estimates* rather than population parameters. The beta coefficients in the equation above are sample estimates for the population coefficients *β₀* and *β₁* respectively. The *ŷ* quantity is the value that the model predicts or a given value of *x*.

A useful property of the linear regression line is that it will always pass through the point known as the **centroid**, which is the point *(x̄, y̅)*:

![Example of linear model with centroid](/Course-Content/Images/linear-regression-XY-model-with-centroid-example.png)

For the purposes of this course, we are not concerned with the specific calculations involved in computing a linear regression line. Instead, we briefly touch on the subject by suggesting that a method of **least squares regression** is used, in which the goal is to minimize the sum of all squared errors. The errors (also called "residuals") are shown as vertical lines in the model below between each data point a possible line. The sum of these values squared is what we seek to minimize to produce the best fit linear regression line.

![Least squares regression line](/Course-Content/Images/linear-regression-least-squares.png)

As with other population parameters we estimate using sample statistics, there is a standard error for simple linear regression. The standard error for simple linear regression is:

![Formula for standard error in linear regression](/Course-Content/Images/Equations/standard-error-linear-regression.png)

### Example: Ages of Spouses

A sample of the ages of husbands and wives is given below. Find the equation of the linear relationship.

> | Couple # | Wife | Husband |
> |----------|------|---------|
> | 1 | 35 | 41 |
> | 2 | 59 | 56 |
> | 3 | 60 | 61 |
> | 4 | 74 | 68 |
> | 5 | 74 | 77 |
> | 6 | 81 | 77 |

First, we load the data into R and create a data frame:

```R
wife <- c(35, 59, 60, 74, 74, 81)
husband <- c(41, 56, 61, 68, 77, 77)
spouse.ages <- data.frame(wife, husband)
```

Next, we check whether there a linear relationship exists by computing the correlation coefficient:

```R
cor(spouse.ages$wife, spouse.ages$husband)
[1] 0.9703923
```

Indeed, there is a strong positive correlation. Now we can find the equation for the linear relationship:

```R
model <- lm(spouse.ages$wife ~ spouse.ages$husband)
print(model)

Call:
lm(formula = spouse.ages$wife ~ spouse.ages$husband)

Coefficients:
        (Intercept)  spouse.ages$husband  
             -9.864                1.164
```

The equation for the linear relationship between ages of spouses is *age<sub>husband</sub> = -9.9 + 1.2 × age<sub>wife</sub>*.

## Assessing Linear Regression Fit

Two very different sets of variables may produce a linear equation with the same slopes and intercepts [[7]](#references). To account for this, we need a measure for the fit of a line to the data that accounts for the <ins>strength</ins> of the relationship, or how closely clustered the data points are around the regression line. The **coefficient of variation** or **coefficient of determination** is a measure of the variation in the response variable that is explained by variation in the explanatory variable.

### Regression Components

To find the coefficient of variation, we first break the regression model into two distinct components. For each point on the regression line, the **regression component** is the difference between the point on the regression line and the mean of the sample. This is the variation that is *explained by the model*:

![Formula for regression component](/Course-Content/Images/Equations/linear-regression-component-regression.png)

For each point on the regression line, the **residual component** is that which is *not explained by the model*. It is the residual between the observed value and that which was predicted by the model:

![Formula for residual component](/Course-Content/Images/Equations/linear-regression-component-residual.png)

The scatterplot below visualizes the regression components. The mean (*ȳ*) is shown as a dotted blue line, the regression line is shown as a red line, and the residual and regression components are shown for the point *(11.5, 11.4)*.

![Visualization of regression components](/Course-Content/Images/linear-regression-components.png)

From these components, we can derive new quantities: the **regression sum of squares** and **residual sum of squares** (also called the **sum of squared errors**). They are the *variation explained by the model* and the *variation not explained by the model* respectively. The regression sum of squares is denoted *SSR* and the error sum of squared errors is denoted *SSE*:

![Formula for regression sum of squares](/Course-Content/Images/Equations/sum-of-squares-regression.png)

![Formula for residual sum of squares](/Course-Content/Images/Equations/sum-of-squared-errors.png)

Thus, the total variation in the data is explained partly by the model and partly by other factors. The **total sum of squares** describes the overall variability:

![Formula for total sum of squares](/Course-Content/Images/Equations/sum-of-squares-total.png)

### Coefficient of Variation

The regression components give us the variability in the data that is explained by the model and that which is not. The coefficient of variation is simply the proportion of the variability explained by the model, *SSR/SST*. We denote the coefficient of determination *R²*:

![Formula for coefficient of variation](/Course-Content/Images/Equations/coefficient-of-determination.png)

This quantity gives us a sense of the model fit. A coefficient of *1* would be a perfect fit (a straight line) and a coefficient of *0* would be the worst possible fit (100% scatter) [[7]](#references). In general, a well-fit regression line will have a small residual sum of squares, *Σ (yᵢ - ŷᵢ)²*, because the model sufficiently explains most of the variability [[2]](#references).

The interpretation of *R²* is the percentage of the variation in the response variable explained by the variation in the explanatory variable. An *R²* of *0.75*, for example, means that 75% of the variability in the dependent variable is explained by the variability in the independent variable.

In R, we can view the *R²* value by calling `summary()` on a linear model generated using the `lm()` function:

```R
model <- lm(y ~ x)
summary(model)
```

The output gives a "Multiple R-Squared" value and an "Adjusted R-Squared" value. The adjusted *R²* is *R²* divided by the degrees of freedom, which in the simple linear regression case is *n - 2*. The adjusted *R²* is more conservative than the *R²* value, as it "penalizes models that get better values of *R²* by using more predictors" [[2]](#references).

## Linear Regression Tests

Having established a linear regression line, the next logical step is to test it for statistical significance. The slope coefficient, β₁ is the focus of formal tests for linear regression since it quantifies the linear relationship. We will see two equivalent tests that test whether a linear relationship exists - the linear regression t-test and an equivalent F-test.

### T-Test for Linear Regression

The **T-test for linear regression** tests whether there is a statistically significant linear relationship between two continuous variables. The test statistic is:

![Formula for T-test in linear regression](/Course-Content/Images/Equations/t-test-linear-regression.png)

Since we have estimated two parameters in the calculation of this t-statistic, there are *n - 1* degrees of freedom.

In this test, we assess the following hypotheses:

> H<sub>0</sub>: β₁ = 0 (there is no linear relationship)
> 
> **Left-tailed test**: H<sub>1</sub>: β₁ < 0 (there is a negative linear relationship)
> 
> **Right-tailed test**: H<sub>1</sub>: β₁ > 0 (there is a positive linear relationship)
> 
> **Two-tailed test**: H<sub>1</sub>: β₁ ≠ 0 (there is a positive or negative linear relationship)

Using R, we can carry out the t-test for linear regression by using the `summary()` function and passing in the model generated by the `lm()` linear model function. The result gives the t-statistic computed for the slope coefficient and the associated p-value:

```R
summary(lm(y ~ x))
```

With this t-distribution wen can construct a confidence interval:

![Formula for confidence interval in linear regression t-test](/Course-Content/Images/Equations/confidence-interval-t-linear-regression.png)

There is a function in R `confint()` that will compute the confidence interval for us, given a model generated using the `lm()` function and an optional confidence level. For example, the below function would generate the 95% confidence interval for the simple linear regression model generated with `y` as the dependent variable and `x` as the independent variable:

```R
confint(lm(y ~ x), level=0.95)
```

The results will show the confidence interval for both the intercept (β₀) estimate and slope (β₁) estimate. We are more interested in the slope coefficient, as it defines the strength and direction of the linear relationship, whereas the intercept only serves to shift the linear regression function up or down the y-axis.

## Summary

| Concept | Discussion | Formula | R Code | Examples |
|---------|------------|---------|--------|----------|
| Scatterplots | Scatterplots are a visual representation of the relationship between two continuous variables. They show how a dependent variable changes as an independent variable changes. Scatterplots have varying <ins>form</ins>, <ins>direction</ins>, and <ins>strength</ins>. | N/A | `plot()` | `plot(x, y)`, `plot(y ~ x)` |
| Covariance | Covariance is a measure of the joint variability of two variables with respect to their means. Values close to *1* indicate a strong relationship between the variables. | ![Formula for covariance](/Course-Content/Images/Equations/covariance.png) | `cov()` | `cov(x, y)`, `cov(y, x)` |
| Correlation | Correlation is the standardized covariance. It measures whether a strong, weak, or no linear relationship exists and in what direction, positive or negative. | ![Formula for correlation coefficient](/Course-Content/Images/Equations/correlation-coefficient.png) | `cor(x, y)` | `cor(x, y)`, `cor(y, x)` |
| Data frames | A two-dimensional table of data with rows and columns. | N/A | `data.frame()` | `data.frame(name=c("Samantha", "Greg", "Patricia"), age=c(45, 50, 55))` |
| Correlation t-test | A t-test that assesses whether a linear relationship exists between two continuous variables. | ![Formula for t-test for correlation](/Course-Content/Images/Equations/t-test-correlation.png) | `cor.test()` | `cor.test(x, y)` |
| Linear regression | A process by which an equation is derived for a line that best fits through the center of points formed by two related variables, an independent (explanatory) and dependent (response) variable.<br><br>This is a simple linear model of the relationship between the variables and allows us to estimate values and make predictions. | ![Formula for simple linear regression](/Course-Content/Images/Equations/linear-regression-simple.png)<br>![Formula for standard error in linear regression](/Course-Content/Images/Equations/standard-error-linear-regression.png) | `lm()` | `lm(y ~ x)` |
| Regression fit (R²) | The coefficient of variation or coefficient of determination (R²) is a measure of the variability explained by a linear model as a proportion of the total variability. | ![Formula for coefficient of variation](/Course-Content/Images/Equations/coefficient-of-determination.png) | `summary(lm())` | `summary(lm(y ~ x))` |

## References

1. https://courses.lumenlearning.com/wmopen-concepts-statistics/chapter/scatterplots-2-of-5/
2. Verzani, John. "Using R for Introductory Statistics". 2nd Edition, 2014, pp. 105-109, 373.
3. Lander, Jared P. "R for Everyone: Advanced Analytics and Graphics". 2nd Edition, 2017, p. 252.
4. https://www.tutorialspoint.com/r/r_data_frames.htm
5. https://online.stat.psu.edu/stat501/lesson/conducting-hypothesis-test-population-correlation-coefficient-r
6. https://thomasleeper.com/Rcourse/Tutorials/formulae.html
7. Crawley, Michael J. "Statistics: An Introduction Using R". 2nd Edition, 2015, pp. 133-134.
