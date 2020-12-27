# Fundamentals

## Contents

- [Fundamentals](#fundamentals)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Getting Started with R](#getting-started-with-r)
  - [Data and Statistics](#data-and-statistics)
  - [Example: Student Grades](#example-student-grades)
  - [References](#references)

## Introduction

The aim of this course is to develop an understanding of the science of statistics using principles of mathematics and computation through programming.

It is likely that you have come across statistics in one form or another, whether you were aware of it or not. Statistics is used to gain an understanding of data and make predictions about the future. It allows weather reporters to predict what a storm might do and doctors to understand the health of their patients or the prognosis of an illness. Statistics is applied in a wide range of areas: mathematics, economics, social sciences, trade, research, programming, Big Data, data science, health, business, government, and education [[1]](##-References). And this list is far from exhaustive.

In a statistical setting, we are concerned with the collection, analysis, and presentation of empirical data using statistical methods [[2]](##-References). Inherent to this setting are two key concepts of **uncertainty** and **variation** [[2]](##-References). In this course, you will learn to make statistical statements about populations of interest while accounting for uncertainty and variation in the analytical techniques and/or underlying data.

## Getting Started with R

The computational tool that will be used throughout this course is R. It is a "language and environment for statistical computing and graphics" [[3]](##-References). To get started, it is recommended that you download and install the latest version of RStudio, an integrated development environment for R that will be used in this course:

[Download R Studio](https://rstudio.com/products/rstudio/download/#download)

## Data and Statistics

Let us first discuss the general design of experiments to gain an appreciation for data and statistics.

When we do analytical work, we have a **population** we are interested in studying, comprised of people, objects, or events. For example, we may study the grades of students in a statistics course or the number of car accidents that occur with different road conditions or the efficacy of a vaccine. Each member or unit in the population is an **observational unit** or **experimental unit**.

To study these populations, we collect **data** about them. That is, we make **observations** by taking **measurements** of certain aspects of the observational units. For example, we may record the grades of statistics students, the number of vehicles involved in accidents and the road conditions, or the reduction of disease in vaccinated groups of individuals.

Each of these characteristics of a population (and we can study multiple characteristics of a single population) is called a **variable**. The value of a characteristic is different between different observational units. One student in a statistics course may have earned a 96% in the course, while another student earned a 74%. There are two types of variables:

- **Quantitative variables**: Variables that take on a numerical value (e.g., grades, ages, temperature). These are also called **continuous variables**.
- **Qualitative variables**: Variables that categorize observational units (e.g., gender, vehicle color, group). These are also called **categorical variables**.

## Example: Student Grades

With this understanding of data and statistics, we simulate our first data set - the grades of statistics students. Run the code below for yourself and we will analyze the output.

```R
# Simulate student grades.
grades <- rnorm(35, 88, 4.7)
hist(grades, main="Histogram of Grades", xlab="Grade", ylab="Frequency")
```
This code produces the following output:

![Histogram of statistics student grades](/Course Content/img/histogram-of-statistics-student-grades.png)

## References
1. https://statanalytica.com/blog/importance-of-statistics/
2. https://www.stat.uci.edu/what-is-statistics/
3. https://www.r-project.org/about.html