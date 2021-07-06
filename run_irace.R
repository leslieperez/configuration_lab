library("irace")


parameters <- readParameters("parameters.txt")
scenario <- readScenario("scenario.txt")
irace(scenario=scenario, parameters=parameters)

testing.main(logFile="irace.Rdata")
