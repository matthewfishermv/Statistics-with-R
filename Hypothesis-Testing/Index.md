# Hypothesis Testing

## Contents

- [Hypothesis Testing](#hypothesis-testing)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Samples](#samples)
    - [Rule of Thumb: Sample Size](#rule-of-thumb-sample-size)
  - [Sampling](#sampling)
    - [Step 0: Summarize the available data](#step-0-summarize-the-available-data)
    - [Step 1: Take repeated samples](#step-1-take-repeated-samples)
    - [Step 2: For each sample, compute the mean](#step-2-for-each-sample-compute-the-mean)
    - [Step 3: Consider the sampling means together](#step-3-consider-the-sampling-means-together)
  - [Normal Distribution](#normal-distribution)
  - [Central Limit Theorem](#central-limit-theorem)
  - [Hypotheses](#hypotheses)
  - [References](#references)

## Introduction

We have learned the fundamentals in the previous module that will allow us to begin statistical work. We set out in this module to learn about hypothesis testing, which underlies much of statistics. You will learn to how to make statistical statements and formally test the plausibility of such statements. You will learn how to sample data from a population, make a hypothesis, and formally test the hypothesis in a statistical setting.

This module begins with a discussion about samples, sampling, distributions, and the Central Limit Theorem, then applies these concepts to the context of hypothesis testing.

## Samples

*Code for this section:* [Samples](/Hypothesis-Testing/Samples-and-Sampling.R)

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

*Code for this section:* [Samples](/Hypothesis-Testing/Samples-and-Sampling.R)

Knowing that we rarely have access to an entire population, we concern ourselves next with the methods we can use to compensate for this fact.

Whereas a sample is a single subset of a population, **sampling** refers to the procedure for taking samples. In the section above, our sampling procedure was first to take three repeated samples of size n=10, then to take three samples of sizes n=15, n=30, n=100.

Let us consider a sampling procedure used frequently in statistics that allows us to compensate for the fact that we do not have access to an entire population's data:

0. Summarize the available data.
1. Take repeated samples from the available data.
2. For each sample, compute the arithmetic mean.
3. Consider all of the computed means together as a new data set for analysis.

Using R, we can carry out this sampling methodology to see what happens. First, suppose we have a random sample of temperatures (in Fahrenheit) taken from a sensor mounted to the top of a radio tower during the summer. The sample data are below:

```R
temps <- c(59.39,62.31,76.77,62.72,68.92,55.52,68.25,58.04,62.95,58.35,58.47,
           63.88,60.61,60.87,58.31,63.38,70.54,62.23,62.4,56.5,76.01,67.47,73.52,
           65.7,66.93,68.18,56.74,66.98,64.87,67.74,56.96,59.07,73.13,62.01,60.08)
```

### Step 0: Summarize the available data

As always, it is necessary to summarize the data using graphical and numerical methods. We plot a histogram and boxplot for the temperature data below:

```R
# Produce graphical summaries.
par(mfrow=c(1, 2))
hist(temps, main="Distribution of Temperatures", xlab="Temperature")
abline(v=mean(temps), col="tomato3")
boxplot(temps, horizontal=TRUE, main="Distribution of Temperatures", xlab="Temperature")
```

![Histogram and boxplot of sample temperature data](/Course-Content/Images/histogram-boxplot-of-temperatures.png)

From this graphical summary, we can see that there is a skew in the sample data, as seen by the long upper tail in the histogram and the long whisker in the boxplot. We will observe what happens to this skew as we work through the sampling methodology.

### Step 1: Take repeated samples

Now we begin sampling from this sample. We choose an arbitrarily large number of samples (10,000) and sample a single temperature (n=1) each time. We use a `for` loop in R to take the samples. In R, a `for` loop allows you to perform repeated actions. In the sampling below, we set up a numeric variable `outcomes` that will store each temperature from the 1000 samples we take, then run the `for` loop to take the samples:

```R
# Take 10,000 samples of size n=1 from the temperature data.
outcomes <- numeric(10000)
for (i in 1:10000) outcomes[i] <- sample(temps, 1)
```

Now if we compare the mean of the original data with the mean of all the outcomes in our sampling, we see something interesting:

```R
cat(mean(temps), mean(outcomes))
63.88 63.8897

cat(sd(temps), sd(outcomes))
5.659822 5.617059
```

The mean and standard deviation of the original data and those of the sampling data are very close. That is, through our sampling methodology, we have managed to obtain a representation of the original data through sampling.

### Step 2: For each sample, compute the mean

We take this one step further by computing the mean each time we take a sample. Instead of using n=1 as our sample size, let us use n=30 and we can modify the `for` loop to take the mean before storing the results in `outcomes`:

```R
# Take 10,000 samples of size n=30 from the temperature data.
outcomes <- numeric(10000)
for (i in 1:10000) outcomes[i] <- mean(sample(temps, 30))
```

### Step 3: Consider the sampling means together

Again, we compare the mean and standard deviation of our original data and those of the sampling data:

```R
cat(mean(temps), mean(outcomes))
63.88 63.88754

cat(sd(temps), sd(outcomes))
5.659822 0.3906602
```

Now the value of this sampling methodology becomes apparent: the sampling distribution is representative of the mean of the original data, but we have reduced the variability. The mean of the sampling distribution is special, and we refer to it as the **mean of the sampling distribution of the means** [[3]](#references). Observe how the distributions of the original data and the sampling data differ, particularly how the skew in the original data is removed by the sampling methodology:

![Histograms of original temperature data and sampling data](/Course-Content/Images/histograms-of-temperatures-data-and-sampling-data.png)

The sampling data (the histogram on the right) follows a bell-shaped curve known as the Normal Distribution, which has many useful properties for statistical analysis. We will turn to these properties next for developing and testing hypotheses.

## Normal Distribution

![Formula for Normal Distribution](/Course-Content/Images/Equations/normal-distribution.png)
`
## Central Limit Theorem

## Hypotheses

## References
1. https://www.investopedia.com/terms/s/sample.asp
2. https://www.statisticssolutions.com/sample-size-formula/
3. http://www.onlinestatbook.com/2/sampling_distributions/samp_dist_mean.html
4. Crawley, Michael J. "Statistics: An Introduction Using R". 2nd Edition, 2015, pp. 70-79.