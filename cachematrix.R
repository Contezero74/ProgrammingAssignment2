## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

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


## Write a short comment describing this function

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
