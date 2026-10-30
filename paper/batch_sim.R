#setwd("C:/Users/meddwilb/OneDrive - University of Leeds/Documents/Research/Projects/fahb/R")
library(brms)
library(fahb)

input_arg <- as.numeric(commandArgs(TRUE))

task_id <- input_arg[1]; N <- input_arg[2]
#task_id <- 1; N <- 10

#scenarios <- matrix(c(1,1,20,0.5,300,1.75,0.3,10,0.4,10,1,
#                      1,2,20,0.5,300,1.75,0.3,10,0.4,10,1,
#                      2,1,20,1,300,1.75,0.3,10,0.4,10,1,
#                      2,2,20,1,300,1.75,0.3,10,0.4,10,1), nrow=4, byrow = TRUE)
#saveRDS(scenarios, "scenarios.rds")

scenarios <- read.csv("scenarios.csv")
sce <- as.numeric(scenarios[task_id,])

scenario_id <- sce[1]; part <- sce[2]

m <- sce[3]; t <- sce[4]; N <- sce[5]
mu_hp <- sce[6]; nu <- sce[7]
rho <- sce[8]; pi <- sce[9]
delta <- sce[10]; epsilon <- sce[11]
t <- t*sce[12]

problem <- fahb_problem(N = N, m = m, t = t, rel_thr = 1.2, 
                        so_hps = c(delta, epsilon), 
                        mean_rr_hps = c(mu, nu), 
                        sd_rr_hps = c(rho, pi))

problem <- forecast(problem, data_sum = TRUE)

ts <- problem$sims[1,5:(4+m)]
ns <- problem$sims[1,(5+m):(4+2*m)]
ns <- as.numeric(ns[ts != 0])
ts <- as.numeric(ts[ts != 0])

int_data <- data.frame(y = ns, c = 1:length(ns), t = ts)

stanvars <- stanvar(mu_hp, name='mu_hp') + stanvar(nu, name='nu') + stanvar(rho, name='rho') + stanvar(pi, name='pi')

bprior <- c(prior(normal(mu_hp, nu), class = "Intercept"),
            prior(gamma(rho, pi), class = "sd"))

bayes_model <- brm(y | rate(t) ~ 1 + (1 | c), data = int_data, family = poisson(),
                   prior = bprior, 
                   stanvars = stanvars,
                   chains = 0, silent = 2)


res <- NULL
for(i in 1:N){
  problem <- forecast(problem, n_sims = 1, overwrite = TRUE, data_sum = TRUE)
  
  ts <- problem$sims[1,5:(4+m)]
  ns <- problem$sims[1,(5+m):(4+2*m)]
  ns <- as.numeric(ns[ts != 0])
  ts <- as.numeric(ts[ts != 0])
  
  analysis <- fahb_analysis(n_pilot = ns,
                            t_pilot = ts,
                            problem = problem,
                            bayes_model = bayes_model)

  rec_time <- problem$sims$rec_T
  
  res <- rbind(res, c(rec_time,  analysis$PC_stats, analysis$Bayes_stats))
}

write.csv(res, file = paste0("./results/res_", scenario_id, "_", part, ".csv"), row.names = FALSE)
