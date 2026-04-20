
data {
  int<lower=1> N;
  array[N] int<lower=0> y;
  int<lower=1> K;
  matrix[N, K] X;
}
parameters {
  vector[K] beta;
}
model {
  beta ~ normal(0, 2.5);
  y ~ poisson_log(X * beta);
}
generated quantities {
  vector[N] log_lik;
  array[N] int y_rep;

  for (n in 1:N) {
    log_lik[n] = poisson_log_lpmf(y[n] | X[n] * beta);
    y_rep[n] = poisson_log_rng(X[n] * beta);
  }
}

