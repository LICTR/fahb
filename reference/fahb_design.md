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
#>     FPR        FNR         n_p         m_p        r_p
#> 1   0.0 0.70136986 15.65462797  0.79403182  7.1697612
#> 11  0.1 0.43287671  7.50367253  3.78104835  6.7147615
#> 21  0.2 0.26575342  6.75536422 -0.99016001  5.4750295
#> 41  0.4 0.14520548  4.53280414 -0.06192836  4.9265413
#> 51  0.5 0.09589041  1.54121220  0.57977055  4.7222628
#> 71  0.7 0.06027397  1.95616019 -0.91050608  3.9050106
#> 81  0.8 0.03287671  1.89202908 -0.53216299  2.9884386
#> 91  0.9 0.02739726  1.46731731 -0.52554311  2.2233790
#> 101 1.0 0.00000000  0.08002808 -0.68312345 -0.9550206
#> 
#> Bayesian approximation
#> 
#>     FPR        FNR      T_p
#> 1   0.0 1.00000000 1.531126
#> 11  0.1 0.44931507 3.077121
#> 21  0.2 0.29863014 3.307251
#> 41  0.4 0.12602740 3.693749
#> 51  0.5 0.10136986 3.740955
#> 71  0.7 0.05479452 3.959283
#> 81  0.8 0.03287671 4.030092
#> 91  0.9 0.01369863 4.183511
#> 101 1.0 0.00000000 4.387087
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
