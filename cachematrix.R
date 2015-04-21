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
        ## Return a matrix that is the inverse of 'x'
}
