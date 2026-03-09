# STAT405 Bayesian Project

This repository contains the course project for STAT405.

The goal of this project is to apply Bayesian inference to a real-world dataset.

Team members:
Aiwei Yang 42274209
Chang Sun 19062439

Repository structure:
- proposal/ : project proposal
- data/ : datasets used in the project
- code/ : R scripts for Bayesian analysis

# STAT405 Bayesian Project Proposal
## 1. Introduction
Bike sharing systems are idely used in many cities around the world. Understanding the factors that influence bike usage can help improve transportation planning and system management. Weather conditions such as temperature, humidity, and wind speed may affect how many people choose to use bike sharing services.

In this project, we will apply Bayesian inference to study how weather variables influence bike rental demand. We will use a real-world bike sharing dataset and fit Bayesian models to analyze the relationship between weather conditions and the number of rented bikes.

---
## 2. Research Question

The main research questions of this project are:

- How do weather conditions affect bike sharing demand?
- In particular, how does temperature influence the number of rented bikes?
- Can Bayesian regression models provide useful estimates for bike demand?

We will model the number of rented bikes as a count variable and investigate how it changes with temperature.

---
## 3. Dataset

### Main Dataset

We will use the **Bike Sharing Dataset**, which contains daily bike rental counts along with weather information.

Dataset source:

https://www.kaggle.com/datasets/imakash3011/bike-sharing-dataset

The dataset includes variables such as:

- `count`: total number of rented bikes
- `temp`: normalized temperature
- `humidity`
- `windspeed`
- `date`

Example structure of the dataset:

| date | temp | humidity | windspeed | count |
|-----|------|----------|-----------|------|
| 2011-01-01 | 0.24 | 0.81 | 0.0 | 985 |

The variable of interest is **count**, which represents the total number of bike rentals on a given day.

---

### Backup Dataset

As a backup option, we may use the **Chicago Bike Sharing Dataset**:

https://www.kaggle.com/datasets/chicago/chicago-bike-share

This dataset also contains information about bike rentals and weather conditions.

---

## 4. Bayesian Models

We will consider two Bayesian models.

### Model 1: Baseline Poisson Model

We first assume that the number of bike rentals follows a Poisson distribution:

\[
y_i \sim Poisson(\lambda)
\]

where \(y_i\) is the number of rentals on day \(i\).

We place a Gamma prior on the rate parameter:

\[
\lambda \sim Gamma(a,b)
\]

This model assumes that bike demand is constant across days.

---

### Model 2: Bayesian Poisson Regression

To incorporate the effect of weather, we extend the model to a Poisson regression:

\[
y_i \sim Poisson(\lambda_i)
\]

\[
\log(\lambda_i) = \beta_0 + \beta_1 temp_i
\]

where \(temp_i\) is the temperature on day \(i\).

We place Normal priors on the regression coefficients:

\[
\beta_0 \sim N(0,10)
\]

\[
\beta_1 \sim N(0,10)
\]

This model allows bike demand to vary with temperature.

---

## 5. Posterior Computation

We will compute the posterior distribution using two different methods:

1. **Laplace Approximation**

   We will approximate the posterior distribution around the MAP estimate using a Gaussian approximation.

2. **Importance Sampling**

   We will generate samples from a proposal distribution and use importance weights to approximate posterior expectations.

These two approaches will allow us to compare approximate Bayesian inference methods.

---

## 6. Model Comparison

We will compare the models and inference methods using:

- Posterior mean estimates
- Credible intervals
- Predictive performance

In particular, we will examine how including temperature improves the model compared to the baseline Poisson model.

---

## 7. Repository

GitHub repository for this project:

https://github.com/AliceYang0612/stat405-bayesian-project

The repository will contain the proposal, datasets, and code used for Bayesian analysis.
