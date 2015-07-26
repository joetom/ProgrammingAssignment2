## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## takes a matrix and sets a list containing setOrigMatrix, getOrigMatrix,
## getInvMatrix(), setInvMatrix() elements

makeCacheMatrix <- function(x = matrix()) {
  
  invMatrix <- NULL
  
  setOrigMatrix <- function(y){
    x <<- y
    invMatrix <<- NULL
  }
  
  getOrigMatrix <- function() x
  
  setInvMatrix <- function(someMatrix){
    invMatrix <<- someMatrix
  }
  
  getInvMatrix <- function() invMatrix
  
  list(setOrigMatrix = setOrigMatrix, getOrigMatrix = getOrigMatrix
       ,setInvMatrix = setInvMatrix, getInvMatrix = getInvMatrix )

}


## Write a short comment describing this function
## takes special matrix (list) as input and compute the inverse if not computed 
## else return the cached result


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  invMatrix <- x$getInvMatrix()
  
  if(!is.null(invMatrix) ){
    message("getting cached inverse matrix")
    return(invMatrix)
  }
  
  data <- x$getOrigMatrix()
  invMatrix <- solve(data)
  x$setInvMatrix(invMatrix)
  
  invMatrix
    
}
