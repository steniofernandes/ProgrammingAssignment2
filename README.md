## Introduction

This second programming assignment is about writing an R
function that is able to cache potentially time-consuming computations.

### Assignment: Caching the Inverse of a Matrix

Matrix inversion is usually a costly computation and there may be some
benefit to caching the inverse of a matrix rather than computing it
repeatedly. The assignment is to write a pair of functions that cache the 
inverse of a matrix.

###The following functions were developed:

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated, then
    `cacheSolve` should retrieve the inverse from the cache.

The inverse of a square matrix is done using the `solve`
function in R. It should be assumed that the matrix supplied is always
invertible.

###Specific tasks:

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
####1 - Fork  - **Done**
####2 - Clone - **Done**
####3 - New code - **Done** - *Also, new Readme file was created (this)*  
####4 - Commit - **Done**
####5 - Submit URL - **Done**

## R Code
```{r}
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

```
## Execution (example)

<pre class=r style="box-sizing:border-box;overflow:auto;font-family:monospace;font-size:13px;display:block;padding:9.5px;margin:0px 0px 10px;line-height:1.42857;color:rgb(51, 51, 51);word-break:break-all;word-wrap:break-word;border:1px solid rgb(204, 204, 204);border-radius:4px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;widows:1;word-spacing:0px;background-color:rgb(245, 245, 245);"><code class=r style="box-sizing:border-box;font-family:monospace;font-size:inherit;padding:0px;color:inherit;border-radius:0px;white-space:pre-wrap;background-color:transparent;"><span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">x</span> <span class=operator style="box-sizing:border-box;color:rgb(104, 118, 135);">&lt;-</span> <span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">matrix</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">(</span><span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">rnorm</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">(</span><span class=number style="box-sizing:border-box;color:rgb(0, 153, 153);">25</span>,<span class=number style="box-sizing:border-box;color:rgb(0, 153, 153);">3</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">)</span>, <span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">nrow</span> <span class=operator style="box-sizing:border-box;color:rgb(104, 118, 135);">=</span> <span class=number style="box-sizing:border-box;color:rgb(0, 153, 153);">5</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">)</span>
<span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">cx</span> <span class=operator style="box-sizing:border-box;color:rgb(104, 118, 135);">&lt;-</span> <span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">makeCacheMatrix</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">(</span><span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">x</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">)</span>
<span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">cacheSolve</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">(</span><span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">cx</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">)</span></code></pre><pre style="box-sizing:border-box;overflow:auto;font-family:monospace;font-size:13px;display:block;padding:9.5px;margin:0px 0px 10px;line-height:1.42857;color:rgb(51, 51, 51);word-break:break-all;word-wrap:break-word;border:1px solid rgb(204, 204, 204);border-radius:4px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;widows:1;word-spacing:0px;background-color:white;"><code style="box-sizing:border-box;font-family:monospace;font-size:inherit;padding:0px;color:inherit;border-radius:0px;white-space:pre-wrap;background-color:transparent;">## Cache not found! Calculating inverse...</code></pre><pre style="box-sizing:border-box;overflow:auto;font-family:monospace;font-size:13px;display:block;padding:9.5px;margin:0px 0px 10px;line-height:1.42857;color:rgb(51, 51, 51);word-break:break-all;word-wrap:break-word;border:1px solid rgb(204, 204, 204);border-radius:4px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;widows:1;word-spacing:0px;background-color:white;"><code style="box-sizing:border-box;font-family:monospace;font-size:inherit;padding:0px;color:inherit;border-radius:0px;white-space:pre-wrap;background-color:transparent;">##           [,1]      [,2]      [,3]       [,4]       [,5]
## [1,]  1.558695  2.453920 -1.428934  -2.095689  0.4610002
## [2,] -2.178205 -3.302608  2.078142   3.515491 -1.1585498
## [3,] -2.965667 -4.057525  2.853786   3.715735 -1.0226829
## [4,] -3.704581 -4.977545  2.950744   5.195148 -1.1364158
## [5,]  7.623896 10.217652 -6.565686 -10.685902  3.0612797</code></pre><pre class=r style="box-sizing:border-box;overflow:auto;font-family:monospace;font-size:13px;display:block;padding:9.5px;margin:0px 0px 10px;line-height:1.42857;color:rgb(51, 51, 51);word-break:break-all;word-wrap:break-word;border:1px solid rgb(204, 204, 204);border-radius:4px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;widows:1;word-spacing:0px;background-color:rgb(245, 245, 245);"><code class=r style="box-sizing:border-box;font-family:monospace;font-size:inherit;padding:0px;color:inherit;border-radius:0px;white-space:pre-wrap;background-color:transparent;"><span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">cacheSolve</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">(</span><span class=identifier style="box-sizing:border-box;color:rgb(0, 0, 0);">cx</span><span class=paren style="box-sizing:border-box;color:rgb(104, 118, 135);">)</span></code></pre><pre style="box-sizing:border-box;overflow:auto;font-family:monospace;font-size:13px;display:block;padding:9.5px;margin:0px 0px 10px;line-height:1.42857;color:rgb(51, 51, 51);word-break:break-all;word-wrap:break-word;border:1px solid rgb(204, 204, 204);border-radius:4px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;widows:1;word-spacing:0px;background-color:white;"><code style="box-sizing:border-box;font-family:monospace;font-size:inherit;padding:0px;color:inherit;border-radius:0px;white-space:pre-wrap;background-color:transparent;">## Cache found! Inverse fetched from memory...</code></pre><pre style="box-sizing:border-box;overflow:auto;font-family:monospace;font-size:13px;display:block;padding:9.5px;margin:0px 0px 10px;line-height:1.42857;color:rgb(51, 51, 51);word-break:break-all;word-wrap:break-word;border:1px solid rgb(204, 204, 204);border-radius:4px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;widows:1;word-spacing:0px;background-color:white;"><code style="box-sizing:border-box;font-family:monospace;font-size:inherit;padding:0px;color:inherit;border-radius:0px;white-space:pre-wrap;background-color:transparent;">##           [,1]      [,2]      [,3]       [,4]       [,5]
## [1,]  1.558695  2.453920 -1.428934  -2.095689  0.4610002
## [2,] -2.178205 -3.302608  2.078142   3.515491 -1.1585498
## [3,] -2.965667 -4.057525  2.853786   3.715735 -1.0226829
## [4,] -3.704581 -4.977545  2.950744   5.195148 -1.1364158
## [5,]  7.623896 10.217652 -6.565686 -10.685902  3.0612797</code></pre>