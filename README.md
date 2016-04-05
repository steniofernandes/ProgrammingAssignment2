### Introduction

This second programming assignment is about writing an R
function that is able to cache potentially time-consuming computations.

### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly. The assignment is to write a pair of functions that cache the 
inverse of a matrix.

The following functions were developed:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated, then
    `cacheSolve` should retrieve the inverse from the cache.

The inverse of a square matrix is done using the `solve`
function in R. It should be assumed that the matrix supplied is always
invertible.

Specific tasks:

1.  Fork the GitHub repository containing the stub R files at
    [https://github.com/rdpeng/ProgrammingAssignment2](https://github.com/rdpeng/ProgrammingAssignment2)
2.  Clone your forked GitHub repository to your computer so that you can
    edit the files locally on your own machine.
3.  Edit the R file contained in the git repository and place your
    solution in that file.
4.  Commit the completed R file into my git repository and push my
    git branch to the GitHub repository under your account.
5.  Submit to Coursera the URL to your GitHub repository that contains
    the completed R code for the assignment.

## Tasks Completion

### Steps
####1 - Fork  - <b>Done</b>
####2 - Clone - <b>Done</b>
####3 - New code - <b>Done</b> - Also, new Readme file created (this)  
####4 - Commit - <b>Done</b>
####5 - Submit URL - <b>Done</b>

## Code

<i> ## Following the provided examples (makeVector and cachemean)</i>

<i> ## Function makeCacheMatrix </i>
<i> ## It defines four functions and uses scope rules to cache data </i>

makeCacheMatrix <- function(x = matrix()) {

<i>  ## functions definitions: set, get, setinverse, and getinverse </i>
  
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  get <- function() x

  setinverse <- function(solve) inv <<- solve
  
  getinverse <- function() inv
  
<i>  ## creating functions list to return </i>

  list(set = set, 
  
       get = get, 
       
       setinverse = setinverse, 
       
       getinverse = getinverse
       
  )
  
} <i> # end of makeCacheMatrix </i>

<i> ## Function cacheSolve </i>

<i> ## This function returns the inverse of matrix x  </i>

<i> ## It first tests if cache exists in memory </i>

<i> ## If cache data is not found, it calculate and returns the matrix inverse </i>

cacheSolve <- function(x, ...) {
  
<i>  # Tests if cache exists </i>

  invertedM <- x$getinverse()
  
  if(!is.null(invertedM)) {
  
    cat("Cache found! Inverse fetched from memory...\n")
    
    return(invertedM)
    
  }
  
 <i> # If cache not found, get the matrix, then calculate and return its inverse </i>
 
  cat("Cache not found! Calculating inverse...\n")
  
  M <- x$get()
  
  invertedM <- solve(M)
  
  x$setinverse(invertedM)
  
  invertedM
  
  
} <i> # end of cacheSolve </i>
