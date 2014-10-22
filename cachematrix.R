## These functions allow for 1) the creation of a cached matrix object
## which is a list of functions and values describing a matrix and 
## 2) the quick access of the solved (inverted) matrix if it is already 
## commited to memory and solves and caches the solved matrix if not

## This first function accepts a matrix object and returns a CacheMatrix
## object, which is a list of functions and values.

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        # Set/Reset the matrix, and also reset the solve to NULL, since 
        # it likely changes
        x <<- y
        s <<- NULL
    }
    get <- function(){
        # return matrix
        x
    }
    setsolve <- function(solved){
        # caching a solved matrix
        s <<- solved
    }
    getsolve <- function(){
        # returning the cached solved matrix
        s
    }
    # This will return the list when the CacheMatrix object is first created
    list(set = set, get = get, setsolve = setsolve,
         getsolve = getsolve)
}

## x should be a cachedMatrix list, and this function will either
## return the cached "solve" for the matrix if it already exists,
## or it will solve the matrix, store it in the cache matrix
## object, and return the solved matrix

cacheSolve <- function(x, ...) {
    # Check if solved matrix is in cache
    s <- x$getsolve()
    if(!is.null(s)) {
    #    message("Getting cached matrix") # Uncomment for notification
    #                                     # of cache access
        return(s)  #case of cached solve exists, return and exit function
    }
    # If solve is not found in cache, return the solved matrix 
    # after solving & setting in cache
    matr <- x$get()
    s <- solve(matr, ...)
    x$setsolve(m)
    return(s)    
}
