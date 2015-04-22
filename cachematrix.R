## Matrix inversion is usually a costly operation and there may be some
## benefit to caching the inverse of a matrix rather than computing it
## every time.
## The following two functions 'makeCacheMatrix' and 'cacheSolve' permit to
## define a special 'matrix' that can cache the inverse matrix in order to
## reduce the time cost of evaluating it repeatedly.


## This function computes the inverse of the special 'matrix' returned by
## the 'makeCacheMatrix' function depicted above.
## If the inverse matrix has already been calculated, this function should
## retrieve the inverse from the cache.
## 
## inputs:
## - x: a special 'matrix' created by the 'makeCacheMatrix' function
## - ...: all the extra arguments are passed to the R 'solve' function
## 
## outputs:
## the inverse matrix of the input special 'matrix'
makeCacheMatrix <- function(x = matrix()) {
    inversematrix <- NULL
    set <- function(y) {
        x <<- y
        inversematrix <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) inversematrix <<- inverse
    getinverse <- function() inversematrix
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## This function computes the inverse of the special 'matrix' returned by
## the 'makeCacheMatrix' function depicted above.
## If the inverse matrix has already been calculated, then this function should
## retrieve the inverse from the cache.
## 
## inputs:
## - x: a special 'matrix' created by the 'makeCacheMatrix' function
## - ...: all the extra arguments are passed to the R solve function
## 
## outputs:
## the inverse matrix of the input special 'matrix'
cacheSolve <- function(x, ...) {
    inverse <- x$getinverse()
    
    if( !is.null(inverse) ) {
        message("getting cached data")
        
        return(inverse)
    }
    
    original <- x$get()
    inverse <- solve(original, ...)
    x$setinverse(inverse)
    
    inverse
}
