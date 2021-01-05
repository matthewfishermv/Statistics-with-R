# One- and Two-Sample Tests of the Mean

## Contents

- [One- and Two-Sample Tests of the Mean](#one--and-two-sample-tests-of-the-mean)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [Procedure for Hypothesis Testing](#procedure-for-hypothesis-testing)
  - [One-Sample Tests](#one-sample-tests)
    - [One-Sample Z-Test](#one-sample-z-test)
    - [Standard Error](#standard-error)
  - [References](#references)

## Introduction

In the previous module, we built upon the concepts the Normal Distribution, the Central Limit Theorem, and confidence intervals to understand how to conduct formal tests of hypotheses and make statements about a population parameter based on available sample data and a level of significance. We will build upon these ideas in this module as we dig into the details of z-tests for one and two samples, as well as a related t-test for one and two samples.

## Procedure for Hypothesis Testing

Because of its importance in the science of statistics, let us recap the general hypothesis testing procedure we learned in the last module:

> **Hypothesis Testing Procedure**
> 1. State the hypotheses and select a significance level.
> 2. Select the test statistic.
> 3. State the decision rule.
> 4. Compute the test statistic.
> 5. Draw a conclusion.

In step 1, we state:

- The <ins>null hypothesis H<sub>0</sub></ins>, which is a statement of "no difference" or "no change";
- The <ins>alternative hypothesis H<sub>1</sub></ins>, which is the alternative to H<sub>0</sub> that we are actually interested in showing; and
- The <ins>significance level α</ins>, which sets the strength of evidence required to be able to reject H<sub>0</sub>.

In step 2, we select the test statistic. We have already seen one test statistic, the z-test or z-statistic:

![Formula for z-statistic/z-test](/Course-Content/Images/Equations/z-test.png)

In step 3, we state the decision rule that would allow us to reject H<sub>0</sub> or force us to fail to reject H<sub>0</sub>. The rule can take one of two forms:

> Reject H<sub>0</sub> if the test statistic is as extreme or more extreme than a critical value. Fail to reject H<sub>0</sub> otherwise.

or:

> Reject H<sub>0</sub> if the p-value associated with the test statistic is less than or equal to α. Fail to reject H<sub>0</sib> otherwise.

Both forms of the decision rule yield the same conclusion, but using the p-value allows readers of the study to select their own significance level and determine whether the result is still significant.

In step 4, we carry out the test by computing the test statistic we selected in step 2.

In step 5, we draw a conclusion based on the value of the test statistic from step 4, applying the decision rule from step 3.

## One-Sample Tests

### One-Sample Z-Test

The test we have seen already is known as a **one-sample z-test**. It allows us to determine whether a statistically significant difference exists between the measured sample mean and the known population mean. In order to use this test, we need to ensure that its assumptions are met [[1]](#references):

1. The data come from a single sample.
2. The mean and variance of the population are known.
3. The test statistic follows a Normal Distribution.

We have stated previously that data about a population are frequently not available, but note that the assumptions require a known mean and variation for the population. Although these are sometimes known, for example from literature or industry publications, they are frequently unknown and so the z-test is rarely used in practice. As an ancillary assumption for using the z-test, a sample size of n ≥ 30 is assumed.

### Standard Error

We glossed over the denominator of the one-sample z-test when we first looked at it, but it deserves some discussion. When estimating a population parameter using sample data, there is some unreliability, given that the sample size is smaller than the population size and may not be completely representative. The **standard error** is a measure of the unreliability of an estimate we make of a population parameter, expressed in the same terms as the parameter we are estimating [[2]](#references).

Recall that variance is a measure of the variability of data points in a sample with respect to the mean. It tells us how much the values in the sample differ from the mean on average. When the variance increases (i.e., there is more variability in the data), the unreliability also increases. When the variance decreases (i.e., there is less variability in the data), the unreliability also decreases. This means that unreliability is proportional to the variance [[2]](#references):

![Unreliability proportional to variance](/Course-Content/Images/Equations/unreliability-proportional-variance.png)

With larger sample sizes, unreliability decreases, so unreliability is inversely proportional to the sample size [[2]](#references):

![Unreliability proportional to variance and inversely to sample size](/Course-Content/Images/Equations/unreliability-proportional-variance-inversely-n.png)

Just like we take the square root of the variance to get the standard deviation, we can take the square root of the unreliability measure to get the standard error. It is denoted SE<sub>y̅</sub> and known as the **standard error of the mean**:

![Formula for standard error](/Course-Content/Images/Equations/standard-error.png)

You will see that estimating different parameters from sample data produces different standard error values. It may be useful to recognize that the standard error is to sample data as the standard deviation is to population data - a measure of variability or unreliability.

Thus, we can summarize the varaibility measures we have seen so far as follows:

| Parameter (Population) | Standard Deviation (Population) | Statistic (Sample) | Standard Error (Sample) |
|------------------------|---------------------------------|--------------------|-------------------------|
| µ | σ/√(N) | y̅ | s/√(n) |

We will expand this table in the sections that follow.

## References

1. http://www.analystsoft.com/en/products/statplus/content/help/analysis_basic_statistics_one_sample_z-test.html
2. Crawley, Michael J. "Statistics: An Introduction Using R". 2nd Edition, 2015, pp. 60-62.