myfunc <- function() {
	x <- rnorm(100)
	mean(x)
}

myfun2 <- function(x) {
	x + rnorm(length(x))
}