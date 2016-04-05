## Following the provided examples (makeVector and cachemean) 

## Function makeCacheMatrix
## It defines four functions and uses scope rules to cache data

makeCacheMatrix <- function(x = matrix()) {
  ## functions definitions: set, get, setinverse, and getinverse 
  
  # Set
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Get
  get <- function() x
  
  # setinverse
  setinverse <- function(solve) inv <<- solve
  
  # getinverse
  getinverse <- function() inv
  
  ## creating functions list to return
  list(set = set, 
       get = get, 
       setinverse = setinverse, 
       getinverse = getinverse
  )
} # end of makeCacheMatrix

## Function cacheSolve
#### This function returns the inverse of matrix x 
#### It first tests if cache exists in memory
#### If cache data is not found, it calculate and returns the matrix inverse

cacheSolve <- function(x, ...) {
  
  # Tests if cache exists 
  invertedM <- x$getinverse()
  if(!is.null(invertedM)) {
    cat("Cache found! Inverse fetched from memory...\n")
    return(invertedM)
  }
  
  # If cache not found, get the matrix, then calculate and return its inverse
  cat("Cache not found! Calculating inverse...\n")
  M <- x$get()
  invertedM <- solve(M)
  x$setinverse(invertedM)
  invertedM
  
} # end of cacheSolve
