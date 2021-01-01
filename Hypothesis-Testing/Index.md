# Hypothesis Testing

## Contents

- [Hypothesis Testing](#hypothesis-testing)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Samples](#samples)
    - [Rule of Thumb: Sample Size](#rule-of-thumb-sample-size)
  - [Sampling](#sampling)
  - [Hypotheses](#hypotheses)
  - [References](#references)

## Introduction

We have learned the fundamentals in the previous module that will allow us to begin statistical work. We set out in this module to learn about hypothesis testing, which underlies much of statistics. You will learn to how to make statistical statements and formally test the plausibility of such statements. You will learn how to sample data from a population, make a hypothesis, and formally test the hypothesis in a statistical setting.

This module begins with a discussion about samples, sampling, distributions, and the Central Limit Theorem, then applies these concepts to the context of hypothesis testing.

## Samples

*Code for this section:* [Samples](/Hypothesis-Testing/Samples.R)

In statistics, we are interested in making statements about a population, however data about the entire population are almost never available due to budget limitations, feasability of collecting or processing large amounts of data, and the like. Instead, we must take a reasonably sized sample from the entire population under study in a controlled manner, such that the characteristics of the sample are representative of the entire population. A **sample** is a "smaller, manageable version of a larger group. It is a subset containing the characteristics of a larger population" [[1]](#references).

R provides the function `sample()`, which allows us to take a sample from any larger set of data. The code below randomly generates the ages of 500 people to simulate a population, then takes three separate samples of size n=10. Graphical summaries (using histograms) of the overall population and each of the samples are then plotted.

```R
# Generate a set of random data points.
ages <- rnorm(500, 36, 8.7)

# Take three samples of n=10 ages.
sample.1 <- sample(ages, 10)
sample.2 <- sample(ages, 10)
sample.3 <- sample(ages, 10)

# Plot the population and the three samples.
par(mfrow=c(2, 2))
hist(ages, main="Population (n=500)")
hist(sample.1, main="Sample 1 (n=10)")
hist(sample.2, main="Sample 2 (n=10)")
hist(sample.3, main="Sample 2 (n=10)")
```

![Histograms of population ages and 3 samples of size 10](/Course-Content/Images/histograms-of-ages-and-size-10-samples.png)

Note the use of `par(mfrow=c(2 ,2))`. The `par()` function in R allows you to set parameters for plotting, such as `mfrow`, which we use here to lay out the plots in a 2x2 grid. For more information on this function, type `?par` into the R console.

You may have observed that the histograms of the samples look dissimilar from the population. Our samples of size n=10 are rather small, given the objective to represent the entire population. Let us confirm this using numerical summary. We compare the means and standard deviations of the population with the means and standard deviations of each of the samples:

```R
print(c(mean(ages), mean(sample.1), mean(sample.2), mean(sample.3)))
[1] 36.14643 37.53238 40.11402 37.15131

print(c(sd(ages), sd(sample.1), sd(sample.2), sd(sample.3)))
[1] 8.229684 6.751736 7.968278 9.085657
```

We see that the means differ and that there is a different amount of varaiability in each sample relative to the population. This is an important characteristic of samples - the mean and standard deviation of any sample may be different from those of the underlying population. That is, each sample is unique and will not exactly match the characteristics of the population. Thus, you can never be 100% certain that a sample is representative of the population. We will discuss this point shortly in the context of confidence intervals. For now, notice what occurs what we increase the sample size.

The code below repeats the sampling methodology used above, but with different sample sizes. Here, sample sizes of n=15, n=30, and n=100 are used.

```R
# Take three samples of n=15, n=30, n=100.
sample.4 <- sample(ages, 15)
sample.5 <- sample(ages, 30)
sample.6 <- sample(ages, 100)

# Plot the population and the three samples.
par(mfrow=c(2, 2))
hist(ages, main="Population (n=500)")
hist(sample.4, main="Sample 4 (n=15)")
hist(sample.5, main="Sample 5 (n=30)")
hist(sample.6, main="Sample 6 (n=100)")
```

![Histograms of population ages and 3 samples of sizes 15, 30, 100](/Course-Content/Images/histograms-of-ages-and-size-15-30-100-samples.png)

Notice that we take large samples and the variability decreases. That is, the distribution of values in the sample become a better approximate of the distribution of the population as the sample size increases. You can convince yourself that this is true by imagining what a sample of size n=500 would look like from this population of N=500 ages. Using numerical summaries, we can also observe the decreasing varaibility:

```R
print(c(mean(ages), mean(sample.4), mean(sample.5), mean(sample.6)))
[1] 36.14643 38.13701 36.23341 34.60919

print(c(sd(ages), sd(sample.4), sd(sample.5), sd(sample.6)))
[1]  8.229684 12.129739 10.043686  7.744706
```

### Rule of Thumb: Sample Size

We conclude this section by sharing this general rule of thumb:

> A sample size of at least 30 is desirable for valid statistical analysis. [[2]](#references)

## Sampling

Knowing that we rarely have access to an entire population, we concern ourselves next with the methods we can use to compensate for this fact.

## Hypotheses

A **hypothesis** is a

## References
1. https://www.investopedia.com/terms/s/sample.asp
2. https://www.statisticssolutions.com/sample-size-formula/