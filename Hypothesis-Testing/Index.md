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
    - [Properties of the Normal Distribution](#properties-of-the-normal-distribution)
    - [The 68-95-99.7 Rule](#the-68-95-997-rule)
    - [Z-Scores](#z-scores)
    - [Quantiles](#quantiles)
    - [Calculations in the Normal Distribution](#calculations-in-the-normal-distribution)
    - [Examples: Infant Birth Weights](#examples-infant-birth-weights)
  - [Central Limit Theorem](#central-limit-theorem)
  - [Hypotheses](#hypotheses)
  - [References](#references)

## Introduction

We have learned the fundamentals in the previous module that will allow us to begin statistical work. We set out in this module to learn about hypothesis testing, which underlies much of statistics. You will learn to how to make statistical statements and formally test the plausibility of such statements. You will learn how to sample data from a population, make a hypothesis, and formally test the hypothesis in a statistical setting.

This module begins with a discussion about samples, sampling, distributions, and the Central Limit Theorem, then applies these concepts to the context of hypothesis testing.

## Samples

*Code for this section:* [Samples and Sampling](/Hypothesis-Testing/Samples-and-Sampling.R)

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

*Code for this section:* [Samples and Sampling](/Hypothesis-Testing/Samples-and-Sampling.R)

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

*Code for this section:* [Distributions](/Hypothesis-Testing/Distributions.R)

One of the most used distributions in statistics is the **Normal Distribution**, sometimes referred to as the **Gaussian Distribution** [[4]](#references). The formula for the Normal Distribution is given by:

![Formula for Normal Distribution](/Course-Content/Images/Equations/normal-distribution.png)

You will not need to compute values using this function directly in this course, but notice that the function takes three parameters: *x*, the values from the data set, *μ*, the population mean, and *σ*, the population standard devation, and produces a bell-shaped curve that looks like this:

![Curve of the Normal Distribution](/Course-Content/Images/normal-distribution.png)

Many variables taken from real-world data are normally distributed or approximately so. This distribution is used frequently in statistics for making inferential statements about a population. It is useful for the properties it has, allowing us to apply similar techniques to vastly different sets of data.

### Properties of the Normal Distribution

This distribution is interesting in statistics because of the unique properties it has [[5]](#references):

1. The mean and median are the same.
2. The distribution is symmetrical about the mean. That is, half of the values fall below the mean and half above.
3. The distribution is described by two parameters, the mean and standard deviation.

The notation for a variable that is normally distributed is:

![Notation for a normally distributed variable](/Course-Content/Images/Equations/normal-distribution-notation.png)

We will see below how to calculate different values on the Normal Distribution curve using R. For now, understand that the height of the curve at a given point is given by:

![Formula for Normal Distribution](/Course-Content/Images/Equations/normal-distribution.png)

and to compute the area under the curve below a point a, we would integrate the Normal Distribution function from -∞ to a to get the probability that a given number, or a smaller number, occurs [[4]](#references):

![Formula for cumulative probability function](/Course-Content/Images/Equations/normal-distribution-cumulative.png)

### The 68-95-99.7 Rule

An interesting feature of the Noraml Distribution that we can take advantage of for statistics is the 68%-95%-99.7% Rule:

> For a normally distributed variable, approximately 68% of its values fall within one standard deviation of the mean, 95% fall within two standard deviations of the mean, and 99.7% fall within three standard deviations of the mean [[5]](#references).

That, is 68% of values fall in the range (μ - σ, μ + σ), 95% of the values fall in the range (μ - 2σ, μ + 2σ), and 99.7% of the values fall in the range (μ - 3σ, μ + 3σ). This is visualized in the plot below:

### Z-Scores

In the previous module, we introduced the concepts of the arithmetic mean and standard deviation. We will use those concepts in combination with the Normal Distribution now to understand z-scores.

A **z-score** is a numeric value that expresses the values of a variable in terms of standard deviation units. Essentially, it transforms the original values of a variable into measurements on the Normal Distribution curve to allow us to leverage the properties of the Normal Distribution. The formula for calculating the z-score is:

![Formula for z-score](/Course-Content/Images/Equations/z-score.png)

If we had a population of infant birth weights with a mean of 3,500 grams and a standard deviation of 363 grams, we could compute the z-score for an infant whose birth weight is 3,225 grams:

![Calculation for infant birth weight z-score](/Course-Content/Images/Equations/z-score-example-infant-birth-weight.png)

The interpretation of this z-score is that the infant whose birth weight is 3,225 is -0.76 standard deviations from the mean birth weight of 3,500 grams.

### Quantiles

A related concept to z-scores is quantiles. A **qauntile** is a cut point or division of a variable's values into equiprobable intervals. We saw in the previous module how a quartile divided a variable's value into four equally probably intervals. Quantiles do the same, but with any number of cut points.

Quartiles are a special case of quantiles, where 3 cut points are used to create four intervals. **Percentiles** are another special case of quantiles, where 99 cut points are used to create 100 intervals.

Quantiles are related to z-scores in that z-scores are the same as quantiles in the Normal Distribution. Take the example of infant birth weights, where we found that an infant's birth weight of 3,225 grams was -0.76 standard deviation units from the mean birth weight of 3,500 grams with a standard deviation of 363 grams. The z-score, -0.76, is a quantile in the Normal Distribution and we could use it to find the probability of observing such a birth weight by computing *f(3225; 3500; 363)*. We will see in the next section how to perform such calculations.

### Calculations in the Normal Distribution

When we work with the Normal Distribution, we are interested in converting between known and unknown values of the curve. For example, if we want to know the percentage of values that fall below a given quantile, we need a function that takes the quantile `q` as input and returns the associated `p`-value. The following graphic shows the values of interest in the Normal Distribution:

![Components of the Normal Distribution curve](/Course-Content/Images/normal-distribution-components.png)

These values are:

| Variable | Names | Description | Formula | Example |
|----------|-------|-------------|---------|---------|
| `p` | `p`-value, cumulative probability | The probability of observing a value in the range (-∞, `q`) | ![Formula for cumulative probability function](/Course-Content/Images/Equations/normal-distribution-cumulative.png) |`p` = P(X ≤ -1.96) = 0.024 |
| `q` | quantile | The value, below wich `p`% of the values fall | ![Formula for quantile function](/Course-Content/Images/Equations/quantile-function.png) | `q` = 0.95 is the 95th percentile |
| `d` | density | The probability of observing the quantile `q` | ![Formula for Normal Distribution](/Course-Content/Images/Equations/normal-distribution.png) | `d` = P(-1.96) = 0.06 |

Traditionally, these values are calculated by looking up `q` or `p` in a z-table like the one below:

[Z-Table](https://www.ztable.net/)

For the purpose of this course, we will use R to compute these values more precisely. There are three functions of primary interest:

| Function | Parameters | Returns | Example |
|----------|------------|---------|---------|
| `pnorm()` | `q` - the quantile; `mean` (optional) - the mean; `sd` (optional) - the standard deviation | `p` - the `p`-value associated with `q` | `pnorm(-1.96, mean=22, sd=1.67)` |
| `qnorm()` | `p` - the `p`-value associated with `q`; `mean` (optional) - the mean; `sd` (optional) - the standard deviation | `q` - the quantile | `qnorm(0.382, mean=22, sd=1.67)` |
| `dnorm()` | `q` - the quantile; `mean` (optional) - the mean; `sd` (optional) - the standard deviation | `d` - the probability of a specific event occurring | `dnorm(1.96)` |

By default, R calcultes the lower tail of for each of these functions. By specifying `lower.tail=FALSE`, you can calculate the upper tail. Given the symmetrical nature of the Normal Distribution, this is equivalent to 1 minus the lower tail.

### Examples: Infant Birth Weights

Suppose you are conducting a study on a population of infants at a particular hospital. It was found that the mean birth weight of infants was 3,400 grams with a standard deviation of 395 grams. Assume that infant birth weights are normally distributed.

It is useful to record the parameters of such an experiment for use in calculations:

```R
mean.birth.weight <- 3500
sd.birth.weight <- 395
```

> 1. What percentage of infants born weigh more than 3,750 grams?

```R
1 - pnorm(3750, mean.birth.weight, sd.birth.weight)
[1] 0.2633958
```
We find that 26.3% of infants born weigh more than 3,750 grams.

Since we are interested in determining what percentage of values fall *above* a given quantile, we subtract the cumulative probability below the quantile from 1. We could equivalently specify the `lower.tail=FALSE` argument in the `pnorm()` function to compute the probability *above* the quantile:

```R
pnorm(3750, mean.birth.weight, sd.birth.weight, lower.tail=FALSE)
[1] 0.2633958
```

> 2. What percentage of infants weigh between 3,105 grams and 3,895 grams?

```R
pnorm(3895, mean.birth.weight, sd.birth.weight) -
  pnorm(3105, mean.birth.weight, sd.birth.weight)
[1] 0.6826895
```

We find that 68.3% of infants weigh between 3,105 grams and 3,895 grams.

You may notice that this question is really asking what percentage of infant weights fall within one standard deviation of the mean, (x̄ - s, x̄ + s) = (3105, 3895). Because of this fact, the 68-95-99.7 rule applies and we can conclude that about 68% of weights fall within one standard deviation of the mean.

> 3. What is the weight, above which 5% of infants weights are observed (the top 5%)?

```R
qnorm(0.05, mean.birth.weight, sd.birth.weight, lower.tail=FALSE)
[1] 4149.717
```

The top 5% of infant weights are 4,149.7 grams and above. That is, the top 5% of infant weights fall between 4,149.7 grams and infinity.

In this example, we are given the `p`-value, 5%, and are asked to find the associated quantile. Because we are interested in the *top* 5%, we look at the upper tail of the distribution.

## Central Limit Theorem

*Code for this section:* [Central Limit Theorem](/Hypothesis-Testing/Central-Limit-Theorem.R)

We have seen a sampling methodology of taking repeated samples from the original data and we have introduced the Normal Distribution. Now we unify these two ideas with the Central Limit Theorem. The **Central Limit Theorem** states:

> Given a population with a finite mean μ and a finite non-zero variance σ<sup>2</sup>, the sampling distribution of the sample mean approaches X ~ N(μ, σ) with a mean of μ and a variance of σ<sup>2</sup>/2 as N, the sample size, increases [[3]](#references).

This means that if we employ the sampling methodology discussed above and taking increasingly large samples, the distribution of the mean of the sample means will become approximately normal. In the plots below, observe how the distribution of the sample looks more and more like the normal distribution as the number of samples taken increases from 10 to 30 to 1,000 to 10,000:

![Visualization of Central Limit Theorem](/Course-Content/Images/central-limit-theorem-samples.png)

## Hypotheses


## References
1. https://www.investopedia.com/terms/s/sample.asp
2. https://www.statisticssolutions.com/sample-size-formula/
3. http://www.onlinestatbook.com/2/sampling_distributions/samp_dist_mean.html
4. Lander, Jared P. "R for Everyone: Advanced Analytics and Graphics". 2nd Edition, 2017, pp. 225-230.
5. https://www.scribbr.com/statistics/normal-distribution/
6. Crawley, Michael J. "Statistics: An Introduction Using R". 2nd Edition, 2015, pp. 70-79.