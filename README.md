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

Bike sharing systems are widely used in many cities and provide an important form of urban transportation. Understanding the factors that influence bike demand can help improve system planning and resource allocation. Weather conditions such as temperature, humidity, and wind speed may affect how many people choose to use bike sharing services.

In this project, we will apply Bayesian inference to analyze how weather conditions influence daily bike rental demand. We will use a real-world dataset containing bike rental counts together with weather variables. The goal is to estimate the relationship between temperature and bike demand using Bayesian models.

---

## 2. Research Question

This project focuses on the following research questions:

- How does temperature affect daily bike rental demand?
- Can Bayesian regression models capture the relationship between weather conditions and bike usage?
- How do different Bayesian inference methods compare when estimating the posterior distribution?

Since the number of rented bikes is a count variable, it is natural to model it using a Poisson distribution.

---

## 3. Dataset

We will use the **Bike Sharing Dataset** from the UCI Machine Learning Repository, which contains daily bike rental counts along with weather information.

Dataset source:

https://www.kaggle.com/datasets/sriramm2010/uci-bike-sharing-data

The dataset includes variables such as:

- `cnt` – total number of rented bikes (response variable)
- `temp` – normalized temperature
- `hum` – humidity
- `windspeed` – wind speed

Example rows of the dataset:

| date | temp | hum | windspeed | cnt |
|-----|-----|-----|-----|-----|
| 2011-01-01 | 0.34 | 0.80 | 0.16 | 985 |
| 2011-01-02 | 0.36 | 0.70 | 0.18 | 801 |
| 2011-01-03 | 0.20 | 0.44 | 0.25 | 1349 |

The variable **cnt** represents the number of bike rentals on each day and will be modeled as the response variable.

### Backup Dataset

As a backup option, we may use another public bike sharing dataset if needed, such as the Chicago Bike Sharing dataset available on Kaggle.

---

## 4. Exploratory Data Analysis

Before fitting Bayesian models, we will perform basic exploratory data analysis to understand the relationship between weather variables and bike rentals. This will include summary statistics and simple visualizations such as scatter plots between temperature and bike counts.

---

## 5. Bayesian Models

We will consider two Bayesian models.

### Model 1: Baseline Poisson Model

We assume that the number of daily bike rentals follows a Poisson distribution:

$$
y_i \sim \text{Poisson}(\lambda)
$$

where $y_i$ is the number of bike rentals on day $i$.

We place a Gamma prior on the rate parameter:

$$
\lambda \sim \text{Gamma}(a,b)
$$

This model assumes that bike demand is constant across days.
---

### Model 2: Bayesian Poisson Regression

$$
y_i \sim \text{Poisson}(\lambda_i)
$$

$$
\log(\lambda_i) = \beta_0 + \beta_1 temp_i
$$

$$
\beta_0 \sim N(0,10)
$$

$$
\beta_1 \sim N(0,10)
$$

This model allows the expected number of bike rentals to vary with temperature.

---

## 6. Posterior Computation

We will estimate the posterior distribution using two different methods:

1. **Laplace Approximation**

   We will approximate the posterior distribution around the MAP estimate using a Gaussian approximation.

2. **Importance Sampling**

   We will generate samples from a proposal distribution and compute importance weights to approximate posterior expectations.

Using two different inference methods allows us to compare their performance and accuracy.

---

## 7. Model Comparison

We will compare the models and inference methods using:

- Posterior mean estimates
- Credible intervals
- Predictive performance

In particular, we will examine whether including temperature improves the model compared with the baseline Poisson model.

---

## 8. Repository

GitHub repository for this project:

https://github.com/AliceYang0612/stat405-bayesian-project

The repository will contain the proposal, dataset, and code used in the Bayesian analysis.
