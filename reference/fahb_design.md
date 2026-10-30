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
#>     FPR        FNR        n_p         m_p        r_p
#> 1   0.0 0.78453039  7.1439088  2.57348337 12.2128022
#> 11  0.1 0.40883978  7.2181097  2.58717181  7.3055163
#> 21  0.2 0.26795580  7.2170406 -0.92301073  5.7760484
#> 41  0.4 0.13259669  2.6922434 -0.74206009  5.1234367
#> 51  0.5 0.09392265  2.2493850  1.15726574  4.4512983
#> 71  0.7 0.04419890  2.2494435 -0.08311336  2.8940580
#> 81  0.8 0.03314917  0.3625014  0.24623444  2.5529181
#> 91  0.9 0.02762431  1.2362646  1.22532351  1.5618347
#> 101 1.0 0.00000000 -0.6625606 -0.49164387 -0.4500218
#> 
#> Bayesian approximation
#> 
#>     FPR        FNR      T_p
#> 1   0.0 1.00000000 1.447124
#> 11  0.1 0.45580110 3.036904
#> 21  0.2 0.30662983 3.273010
#> 41  0.4 0.15193370 3.521708
#> 51  0.5 0.10497238 3.694853
#> 71  0.7 0.06077348 3.912070
#> 81  0.8 0.03591160 4.078918
#> 91  0.9 0.01381215 4.173361
#> 101 1.0 0.00000000 4.431503
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
