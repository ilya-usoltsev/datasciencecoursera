## This two functions do the following: first FUN creates list of functions, which can be called
## by the second FUN.

## The first function will take your matrix, save it and return a list of four functions,
## which will be used by the second function later.

makeCacheMatrix <- function(x = matrix()) {
        im <- NULL  #im stands for inversed matrix
        set <- function(y) { #they had the set function in template, although it was not used
                x <<- y   #we can set a new matrix here if we want
                im <<- NULL #once we have a new materix, im must be NULL
        }
        get <- function() x #we use this function to call the matrix 'x'.
        setinverse <- function(inverse) im <<- inverse #here we set im value after calculating it in casheSolve 
        getinverse <- function() im #we call im to check if we already have it
        list(set = set, get = get, #finally we return a list with functions introduced in the function makeCasheMatrix
             setinverse = setinverse,
             getinverse = getinverse)
}


## This function will check if we already calculated the inversed matrix and retract it from
## the makeCacheMatrix if we did. If not, then it will calculate it by itself and store in
## the makeCacheMatrix by calling a setinverse function.

cacheSolve <- function(x, ...) {
        im <- x$getinverse() #here we call getinverse function from makeCacheMatrix
        if(!is.null(im)) { #if im is not NULL, we take it 
                message("getting cached data")
                return(im)
        }
        data <- x$get() #if im is NuLL, we retrackt its value from makeCacheMatrix function
        im <- solve(data, ...) #we caclulate inversed fuction
        x$setinverse(im) #we 'save' by calling a setinverse function in makeCacheMatrix
        im # and we return it!
}

## you actually can test this functions in R, to make sure they work.
## first make a matrix: x<-matrix(1:4,2,2)
## place it in function 1 and assign the result to k: k<-(makeCacheMatrix(x))
## Now use the second function: cacheSolve(k)
## you get the inversed matrix
## run in again: cacheSolve(k)
## and it will take it from cache
## to make sure that you get the right answer use %*% to multiply the initial and inversed matrices

