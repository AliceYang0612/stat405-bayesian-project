
data {
  int<lower=1> N;
  array[N] int<lower=0> y;
  int<lower=1> K;
  matrix[N, K] X;
}
parameters {
  vector[K] beta;
  real log_phi;
}
transformed parameters {
  real<lower=0> phi;
  phi = exp(log_phi);
}
model {
  beta ~ normal(0, 2.5);
  log_phi ~ normal(0, 1);
  y ~ neg_binomial_2_log(X * beta, phi);
}
generated quantities {
  vector[N] log_lik;
  array[N] int y_rep;
  for (n in 1:N) {
    log_lik[n] = neg_binomial_2_log_lpmf(y[n] | X[n] * beta, phi);
    y_rep[n] = neg_binomial_2_log_rng(X[n] * beta, phi);
  }
}

