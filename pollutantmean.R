pollutantmean <- function(directory, pollutant, id = 1:332) {
	## 'directory' is a character vector of length 1 indicating
	## the location of the CSV files

	##'pollutant' is a character vector of length 1 indicating
	## the name of the pollutant for which we will calcuate the
	## mean; either "sulfate" or "nitrate".

	## 'id' is an integer vector indicating the monitor ID numbers
	## to be used.

	## Return the mean of the pollutant across all monitors list
	## in the 'id' vector (ignoring NA values)
	## NOTE: do not round the result!

	file_names <- dir()
	myy <- do.call(rbind,lapply(file_names,read.csv,header=TRUE))
	
	myy2 <- subset(myy, ID %in% id & !is.na(pollutant), pollutant)
	
	mean(myy2$pollutant)

}
