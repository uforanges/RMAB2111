#Define an R function that removes NA values from a vector
removeNA <- function(vector) {
  cleaned <- vector[!is.na(vector)]
  return(cleaned)
  }

#Define an R function that computes the factorial of given an integer argument. The output should be a vector of length 1.
factorial <- function(input) {
  fac = 1	
  if(input < 0) {
  print("Pls input positive numbers")
  } else if(input == 0) {
  return(1)
  } else {
  for(i in 1:input) {
  fac = fac * i
  }
  return(fac)
  }
  }

#Define an R function that sorts a given vector in decreasing order. The output should be a vector of the same length. It should accept both numeric or character vectors.
descorder <- function(tosort) {
  sorted <- sort(tosort, decreasing = TRUE)
  return(sorted)
  }

#Create a function that accepts a vector and and integer n and returns nth highest number
nthLargest <- function(vector, n){
    vector[rev(order(vector))][n]
}

#Create a function isPrime(n) that accepts an integer and outputs a Boolean value (TRUE or FALSE) depending whether the integer is a prime number or not.
isPrime <- function(num) {
   flag = 0
  if(num > 1) {
	flag = 1
	for(i in 2:(num-1)) {
		if ((num %% i) == 0) {
		flag = 0
		break
		}
	}
  } 
  if(num == 2)    flag = 1
  if(flag == 1) {
	print(TRUE)
	} else {
	print(FALSE)
	}
  }