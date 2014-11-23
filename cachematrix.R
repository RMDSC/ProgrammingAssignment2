## My function inverts the matrix that I created using the dimensions I specified and uses the cached dimension to invert the matrix.
## Function allow for quick commands to be processed in a clean and efficient manner in R.

## Creates the function that will cache the dims of the matrix
        
makeCacheMatrix <- function(x = matrix()) {     
        m<-NULL
        set<-function(y){
                x<<-y
                m<<-NULL
        }
        get<-function() x
        setmatrix<-function(solve) m<<- solve
        getmatrix<-function() m
        list(set=set, get=get,
             setmatrix=setmatrix,
             getmatrix=getmatrix)
}


## This function returns the inverse of the matrix.

cacheSolve <- function(x = matrix(), ...) {
        m<-x$getmatrix()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        matrix<-x$get()
        m<-solve(matrix, ...)
        x$setmatrix(m)
        m
}
