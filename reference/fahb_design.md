# Build a `fahb` design object

Given a `fahb_problem` object, find efficient progression decision
rules. These can include rules of the standard "progression criteria
form", or rules based on a Bayesian analysis of the pilot trial data, or
both.

## Usage

``` r
fahb_design(problem, quietly = TRUE)
```

## Arguments

- problem:

  an object of class `fahb_problem`.

- quietly:

  if this argument is set to FASLE then information about which steps
  have been completed will be printed to the console. Defaults to TRUE.

## Value

an object of class `fahb_design`.

## Examples

``` r
problem <- forecast(fahb_problem(), n_sims = 500)
fahb_design(problem)
#> Standard progression criteria
#> 
#>     FPR        FNR        n_p        m_p        r_p
#> 1   0.0 0.75136612 16.5718179 -0.7188527  2.5717556
#> 11  0.1 0.47540984  8.0929902  3.6381965  7.4008006
#> 21  0.2 0.32786885  4.0976819  3.6985548  6.7257364
#> 41  0.4 0.13114754  4.3495200 -0.6113237  4.3941422
#> 51  0.5 0.10382514  4.3736747  1.1281402  3.4903359
#> 71  0.7 0.06557377  1.0960816  1.9807448  3.4903215
#> 81  0.8 0.03825137 -0.7636241  2.2718037  2.6976564
#> 91  0.9 0.02732240 -0.6714465 -0.5702680  1.4073819
#> 101 1.0 0.00000000  0.2523961  1.6023456 -0.8998733
#> 
#> Bayesian approximation
#> 
#>     FPR        FNR      T_p
#> 1   0.0 1.00000000 1.610074
#> 11  0.1 0.51092896 3.035218
#> 21  0.2 0.34699454 3.256845
#> 41  0.4 0.15027322 3.579466
#> 51  0.5 0.10655738 3.728152
#> 71  0.7 0.06284153 3.882449
#> 81  0.8 0.05191257 3.980638
#> 91  0.9 0.01912568 4.132130
#> 101 1.0 0.00273224 4.353757
#> 
#> FPR - False Positive Rate
#> FNR - False Negative Rate
#> 
#> n_p, m_p, r_p - Probabilistic thresholds for standard
#>                 progression criteria on the number recruited,
#>                 number of sites opened, and the recruitment rate
#>                 (participants per site per year) respectively
#> 
#> T_p - Bayesian decision rule threshold for the posterior predictive
#>       expected time until full recruitment
```
