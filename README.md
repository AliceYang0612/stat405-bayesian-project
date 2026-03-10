# STAT405 Bayesian Project

This repository contains the course project for STAT405.

The goal of this project is to apply Bayesian inference to a real-world dataset.

Team members:  
-Aiwei Yang 42274209       
-Chang Sun 19062439

## Team Contribution Plan

To ensure that both team members contribute equally to the project, the work will be divided into several stages.

Both members will collaborate on data exploration and model design. Aiwei will focus on implementing the Laplace approximation method, while Chang will implement the self-normalized importance sampling (SNIS) method. Afterward, both members will work together to analyze the results, compare the inference methods, and prepare the final report and presentation.

All code and documents will be maintained in the shared GitHub repository so that both team members can contribute and review each other's work.

Repository structure:
- proposal/ : project proposal
- data/ : datasets used in the project
- code/ : R scripts for Bayesian analysis


# STAT405 Bayesian Project Proposal

## 1. Introduction

Bike sharing systems are widely used in many cities and provide an important form of urban transportation. Understanding the factors that influence bike demand can help improve transportation planning and system management. Weather conditions such as temperature, humidity, and wind speed may affect how many people choose to use bike sharing services.

In this project, we will apply Bayesian inference to study how weather conditions influence daily bike rental demand. In particular, we focus on the relationship between temperature and the number of rented bikes.

---

## 2. Research Question

The main question of this project is:

#### How does temperature affect daily bike rental demand?

Since the number of rented bikes represents count data, it is natural to model it using a Poisson distribution. We will estimate the relationship between temperature and bike rentals using a Bayesian Poisson regression model.

---

## 3. Dataset

We will use the **Bike Sharing Dataset** from the UCI Machine Learning Repository. The dataset contains daily bike rental counts together with weather information and contains 731 daily observations from January 2011 to December 2012.

Dataset source:

https://www.kaggle.com/datasets/sriramm2010/uci-bike-sharing-data

The dataset includes variables such as:

- `cnt` – total number of rented bikes
- `temp` – normalized temperature
- `hum` – humidity
- `windspeed` – wind speed

Example rows of the dataset:

| date | temp | hum | windspeed | cnt |
|-----|-----|-----|-----|-----|
| 2011-01-01 | 0.34 | 0.80 | 0.16 | 985 |
| 2011-01-02 | 0.36 | 0.70 | 0.18 | 801 |
| 2011-01-03 | 0.20 | 0.44 | 0.25 | 1349 |

The variable **cnt** represents the number of bike rentals per day and will be used as the response variable.

### Backup Dataset

As a backup option, we will use another bike sharing dataset that also contains daily bike rental counts and weather information.

This dataset covers the period from January 1, 2018 to December 31, 2019 and includes 730 daily observations. Similar to the main dataset, it contains variables describing weather conditions and the total number of rented bikes.

Data source:

[https://www.kaggle.com/search?q=chicago+bike+sharing+in%3Adatasets](https://www.kaggle.com/datasets/vaidehisavaliya08/bike-sharing-demand)

Key variables include:

- `cnt` – total number of bike rentals
- `temp` – temperature
- `hum` – humidity
- `windspeed` – wind speed

Example rows of the dataset:

| date | temp | hum | windspeed | cnt |
|-----|-----|-----|-----|-----|
| 2018-01-01 | 0.28 | 0.78 | 0.12 | 654 |
| 2018-01-02 | 0.30 | 0.74 | 0.15 | 721 |
| 2018-01-03 | 0.25 | 0.70 | 0.20 | 689 |

Because this dataset contains the same key variables (bike rental counts, temperature, humidity, and wind speed) as the main dataset, the same Bayesian Poisson regression model can be applied if necessary.

---

## 4. Exploratory Data Analysis

Before fitting the Bayesian model, we will perform exploratory data analysis to better understand the dataset.

First, we will compute summary statistics for the key variables such as bike rental counts, temperature, humidity, and wind speed.

Second, we will examine the distribution of bike rental counts using histograms to understand the variability of daily demand.

Third, we will visualize the relationship between temperature and bike rentals using scatter plots. This will help determine whether higher temperatures are associated with increased bike usage.

These exploratory analyses will help motivate the choice of predictors used in the Bayesian regression model.

---

## 5. Bayesian Models

We consider two Bayesian models for daily bike rental counts.

### Model 1: Baseline Poisson Model

First, we assume that the number of daily bike rentals follows a Poisson distribution with a constant rate:

$$
y_i \sim \text{Poisson}(\lambda)
$$

where $y_i$ represents the number of bike rentals on day $i$.

We place a Gamma prior on the rate parameter:

$$
\lambda \sim \text{Gamma}(a,b)
$$

This model assumes that the expected bike demand is constant across days and does not depend on weather conditions.

---

### Model 2: Bayesian Poisson Regression

To account for the effect of temperature, we extend the model to a Poisson regression.

$$
y_i \sim \text{Poisson}(\lambda_i)
$$

The expected number of rentals is modeled as

$$
\log(\lambda_i) = \beta_0 + \beta_1 temp_i
$$

where $temp_i$ represents the temperature on day $i$.

We place Normal priors on the regression coefficients:

$$
\beta_0 \sim N(0,10)
$$

$$
\beta_1 \sim N(0,10)
$$

This model allows the expected number of bike rentals to vary with temperature.

---

## 6. Posterior Computation

The posterior distribution is proportional to the likelihood times the prior:

$$
p(\theta | y) \propto p(y|\theta)p(\theta)
$$

We will approximate the posterior distribution using two different methods.

### Laplace Approximation

First, we will apply the Laplace approximation. This method approximates the posterior distribution with a Gaussian distribution centered at the maximum a posteriori (MAP) estimate.

### Self-Normalized Importance Sampling (SNIS)

We will also use self-normalized importance sampling (SNIS). In this approach, we draw parameter samples from a proposal distribution and compute importance weights based on the likelihood and prior. These weights are then normalized and used to approximate posterior expectations.

---

## 7 Model and Inference Comparison

We will compare both Bayesian models and inference methods. In particular, we will examine posterior mean estimates and credible intervals for the model parameters.

We will also compare the results obtained from Laplace approximation and self-normalized importance sampling (SNIS) to evaluate the performance of the two approximate inference methods.

---

## 8. Repository

GitHub repository for this project:

https://github.com/AliceYang0612/stat405-bayesian-project

The repository will contain the proposal, dataset, and code used in the Bayesian analysis.
