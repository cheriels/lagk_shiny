#******************************************************************
# Runs the simulation, beginning on date_start, defined in global.R
#******************************************************************
#
#******************************************************************
# Inputs - probably alot more things used should be inputs
#******************************************************************
# date_today = final day of the simulation
# ts0 = the list of dfs: potomac.ts.df, sen.ts.df, jrr.ts.df, ...
#   - where the time series begin on date_start and end yesterday
#******************************************************************
# Output
#******************************************************************
# ts - this may just be a list of the ts dfs, or may be reactive values
#    - the time series begin on date_start and end today
#--------------------------------------------------------------------------------
# Define the main sim function - simulates from date_start to date_today

sim_main_func <- function(date_today,
                          mos_0day,
                          mos_1day,
                          mos_9_day,
                          ts){
  sim_n <- as.numeric(as.POSIXct(date_today) - as.POSIXct(date_start),
                      units = "days")
#
  run_start <- Sys.time()
  #
    for (sim_i in 1:sim_n) { # start by adding the 2nd day
      date_sim <- date_start + lubridate::days(sim_i)
      # print(paste("date_sim is ", date_sim))
    ts <- simulation_func(date_sim,
                          mos_0day,
                          mos_1day,
                          mos_9day,
                          demands.daily.df,
                          potomac.daily.df,
                          sen, jrr, # these are the reservoir "objects"
                          ts)
  } # end of simulation loop
  #
  run_end <- Sys.time()
  runtime <- difftime(run_end, run_start, units = "mins")
  print(runtime)
  return(ts)
} # end of function
