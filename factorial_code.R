#ASSIGNMENT:
# write a function that computes the factorial of an integer greater than or equal to 0. 
# Recall that the factorial of a number n is n * (n-1) * (n - 2) * … * 1. The factorial of 0 is defined to be 1

# Factorial_loop: a version that computes the factorial of an integer using looping (such as a for loop)

my_fact1 <- function(x){
	fact <- 1
	if(x ==  0) {
		print(fact)
		}
	else {
		for(n in 1:x)
		fact <- fact * n
		print(fact)
		}
}

my_fact1(6)

# Factorial_reduce: a version that computes the factorial using the reduce() function in the purrr package. 
#  Alternatively, you can use the Reduce() function in the base package.

library(purrr)

my_fact2 <- function(x){
	fact <- 1
	if(x ==  0) {
		print(fact)
		}
	else {
		reduce(1:x, function(x, y) {
		x*y
		})
		}
}
my_fact2(6)



# Factorial_func: a version that uses recursion to compute the factorial.

my_fact3 <- function(x){
	fact <- 1
	if(x ==  0) {
		1
		}
	else {
		x * my_fact3(x-1)
		}
}
my_fact3(6)



# Factorial_mem: a version that uses memoization to compute the factorial.

#create a vector we populate with memoization
factors <- c(1, rep(NA, 24))

my_fact4 <- function(x){
	if(!is.na(factors[x])) {
		factors[x]
		}
	else {
		factors[x-1] <<- my_fact3(x-1)
		x * factors[x-1]
		}
}
my_fact4(6)


# compare the methods
library(microbenchmark)

my_fact_perf <- microbenchmark(my_fact1(6),my_fact2(6),my_fact3(6),my_fact4(6))
my_fact_perf

my_fact_perf <- microbenchmark(my_fact1(15),my_fact2(15),my_fact3(15),my_fact4(15))
my_fact_perf

my_fact_perf <- microbenchmark(my_fact1(27),my_fact2(27),my_fact3(27),my_fact4(27))
my_fact_perf

