# Fundamentals

## Contents

- [Fundamentals](#fundamentals)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Getting Started with R](#getting-started-with-r)
  - [Data](#data)
  - [Example: Student Grades](#example-student-grades)
  - [References](#references)

## Introduction

![Linear model constructed from Old Faithful waiting time and eruption time](/Course-Content/img/old-faithful-linear-model.png)

The aim of this course is to develop your understanding of the science of statistics using principles of mathematics and computation. You will learn how to:

1. design experiments to collect data;
1. perform a variety of statistical analyses;
2. build and interpret mathematical models; and
3. produce graphics like the one above.

It is likely that you have come across statistics in one form or another, whether you were aware of it or not. Statistics is used to gain an understanding of data and make predictions about the future. It allows weather reporters to predict what a storm might do and doctors to understand the health of their patients or the prognosis of an illness. Statistics is applied in a wide range of areas: mathematics, economics, social sciences, trade, research, programming, Big Data, data science, health, business, government, and education [[1]](#references). And this list is far from exhaustive.

In a statistical setting, we are concerned with the collection, analysis, and presentation of empirical data using statistical methods [[2]](#references). Inherent to this setting are two key concepts of **uncertainty** and **variation** [[2]](#references). In this course, you will learn to make statistical statements about populations of interest while accounting for uncertainty and variation in the analytical techniques and/or underlying data.

## Getting Started with R

The computational tool that will be used throughout this course is R. It is a "language and environment for statistical computing and graphics" [[3]](#references). To get started, it is recommended that you download and install the latest version of RStudio, an integrated development environment for R that will be used in this course:

[Download R Studio](https://rstudio.com/products/rstudio/download/#download)

## Data

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
This code produces the following output (your specific output will vary):

![Histogram of statistics student grades](/Course-Content/img/histogram-of-statistics-student-grades.png)

This graphic is known as a **histogram** - it is a graphical summary of the underlying data. For now, understand that we randomly generated 35 student grades (from a Normal Distribution with a mean of 88 and standard deviation of 4.7) and assigned the randomly generated grades to a variable `grades` using the `<-` assignment operator. We then used the `hist()` function that is part of base R to plot the histogram.

The histogram shows how frequently students earned grades in the ranges shown on the horizontal x-axis. We can see from the histogram that 3 students earned a grade between 75 and 80, 6 students earned a grade between 80 and 85, and so on. The ranges on the x-axis of a histogram are known as **bins** and we can set the bins to be any width. The y-axis shows the **frequency**, or the number of times in the data that a value that falls within each of the bins occurred.

Now we can begin to answer questions about the grades we simulated. We know that we simulated 35 grades, so we can say that 3/35 = 8.6% of the students earned a grade between 75 and 78. Similarly, we can ask how many students earned a grade of 90 or better. Reading the frequencies from the histogram, we see that 7 students earned a grade between 90 and 95 and 5 students earned a grade between 95 and 100. The answer to the question is that (7 + 5)/25 = 34.3% of the students earned a grade of 90 or better.

R also has a `stem()` function than produces a **stem and leaf plot** like the one below. Notice that this is similar to the histogram above, but uses numbers instead of graphics. Stem and leaf plots partition each observation in the data into a stem (left of the "|") and a leaf (right of the "|") [[4]](#references). The stem and leaf plot produced by R below partitions each observation at the decimal point. Check that you understand how to translate between the stem and leaf plot below and the histogram above:

```R
> stem(grades)

  The decimal point is at the |

  76 | 3
  78 | 29
  80 | 
  82 | 401346
  84 | 1
  86 | 003599
  88 | 2472348
  90 | 1612
  92 | 00
  94 | 355
  96 | 23
  98 | 8
```

## References
1. https://statanalytica.com/blog/importance-of-statistics/
2. https://www.stat.uci.edu/what-is-statistics/
3. https://www.r-project.org/about.html
4. https://faculty.atu.edu/mfinan/3153/section13.pdf