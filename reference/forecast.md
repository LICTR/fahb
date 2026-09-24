# Generate probabilistic forecasts of trial recruitment

Generate probabilistic forecasts of trial recruitment

## Usage

``` r
forecast(problem, n_sims = 10^4, overwrite = FALSE, data_sum = FALSE)
```

## Arguments

- problem:

  an object of class `fahb_problem`.

- n_sims:

  number of replicates to use in the simulation.

- overwrite:

  boolean indicating if we want to overwrite any simulation data
  currently held (defaults to FALSE).

- data_sum:

  boolean indicating if we want to return all the information needed to
  run a Bayesian analysis of the recruitment data (defaults to FALSE).

## Value

an object of class `fahb_problem`.

## Examples

``` r
problem <- fahb_problem()
problem <- forecast(problem, n_sims = 10^3)
```
