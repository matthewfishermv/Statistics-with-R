# Linear Regression

## Contents

- [Contents](#contents)
- [Introduction](#introduction)
- [Scatterplots](#scatterplots)
  - [Form](#form)
  - [Direction](#direction)
  - [Strength](#strength)
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

## References

1. https://courses.lumenlearning.com/wmopen-concepts-statistics/chapter/scatterplots-2-of-5/
