# Build a `fahb` analysis object

Given a `fahb_problem` object calculate summary statistics which can
inform progression decisions. These include both standard progression
criteria statistics, and the expectation of the posterior predictive
distribution of the time until the trial recruits.

## Usage

``` r
fahb_analysis(n_pilot, t_pilot, problem, site_t = NULL, bayes_model = NULL)
```

## Arguments

- n_pilot:

  integer vector of numbers recruited at each open site.

- t_pilot:

  numeric vector of time (in years) each site has been open.

- problem:

  object of class `fahb_problem`.

- site_t:

  In the case of an external pilot, the time taken for all pilot sites
  to open.

- bayes_model:

  optional object of class `brmsfit` which will be used in the Bayesian
  analysis via `brms::update()` to avoid compiling a new model.

## Value

An object of class `fahb_analysis`.

## Examples

``` r
## Example illustrating a full analysis workflow
## (Not run on CRAN due to Bayesian model fitting)

# \donttest{
problem <- fahb_problem()
problem <- forecast(problem)

## Pilot trial data
n_pilot <- c(3, 5, 2)
t_pilot <- c(0.5, 0.6, 0.4)

analysis <- fahb_analysis(
  n_pilot = n_pilot,
  t_pilot = t_pilot,
  problem = problem
)
#> Error in if (t_pilot != 0) {    n_p <- sum(n_pilot)    m_p <- length(n_pilot)    r_p <- n_p/sum(t_pilot)} else {    n_p <- 0    m_p <- 0    r_p <- 0    t_pilot <- 1e-09}: the condition has length > 1

print(analysis)
#> Error: object 'analysis' not found
plot(analysis)
#> Error: object 'analysis' not found
# }
```
