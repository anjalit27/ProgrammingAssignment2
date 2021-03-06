## Put comments here that give an overall description of what your
## functions do

## This function creates a "matrix" object than can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) inv <<- solve
  getinverse <- function() inv
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
}


## This function computes the inverse of the matrix which is returned by makeCacheMatrix.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  if(!isnull(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
}

