## Overall this function gives you the inverse of any matrix(given that det(matrix) \neq 0). Since this involves significant number of calculation which also depends(increase polynomially) on the dimensionality of the matrix, it is important to save the calculation for one task, in case you need that in other places. 
## This can done using 2 functions below. first one cache the calculation and second one generate it.

## Function below cache the matrix, and its inverse. 

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y){
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinv <- function(solve) inv <<- solve
  getinv <- function() inv
  list(set=set,get=get,setinv = setinv, getinv = getinv)
}


## Function below calulate the inverse of matrix if it is not already obtained through the function above.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  inv <- x$getinv()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinv(inv)
  inv
}
