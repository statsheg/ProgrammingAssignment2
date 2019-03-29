## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

> #This Function makeCasheMatrix gets a matrix as an input, set the value of the matrix, get the value of the matrix, 
> #set the inverse Matrix and get the inverse Matrix. The matrix object #can cashe its own object.
> #<<- operator is used to assign a value to an object in an environment that is different from the current environment
> #take the matrix as an input
> 
> makeCasheMatrix<-function(x=matrix()) {
+ invMat<-NULL
+ 
+ #set the value of the Matrix
+ 
+ setMat<-function(y) {
+ x<<-y
+ invMat<-NULL
+ }
+ getMat<-function()x   #get the value of the Matrix
+ setInv<-function(inverse) invMat<<-inverse   #set the value of the invertible matrix
+ getInv<-function() invMat   #get the value of the invertible matrix
+ list(setMat=setMat,getMat=getMat,
+ setInv=setInv,getInv=getInv)
+ }
> 
> ##The function cacheSolve takes the output of the previous matrix makeCacheMatrix(matrix) as an input 
> #and checks inverse matrix from makeCacheMatrix(matrix) has any value in it or not.
> #In case inverse matrix from makeCacheMatrix((matrix) is empty, it gets the original matrix data from 
> #and set the invertible  matrix by using the solve function.
> #In case inverse matrix from makeCacheMatrix((matrix) has some value in it (always works
> #after running the code 1st time), it returns a message  "Getting Cached Invertible Matrix" 
> #and the cached object
> 
> 
> ##Write a short comment describing this function
> 
> casheSolve<-function(x,...){
+ 
+ #get the value of the invertible matrix from the makeCacheMatrix function
+ 
+ invMat<-x$getInv()
+ if(!is.null(invMat)){   #if inverse matrix is not NULL
+ message("Getting Cashed Invertible Matrix")   #Type message: Getting Cached Invertible Matrix
+ return(invMat)   #return the invertible matrix
+ }
+ 
+ #if value of the invertible matrix is NULL then
+ 
+ MatrixData<-x$getMat()
+ invMat<-solve(MatrixData,...)
+ x$setInv(invMat)
+ return(invMat)
+ ##Return a matrix that is the inverse of 'x'
+ }
> 
> ##Testing##
> 
> ##Test 1 [2x2 Matrix] 
> 
> #Test1
> 
> TestMat<-matrix(5:8,2,2)
> TestMat
     [,1] [,2]
[1,]    5    7
[2,]    6    8
> CasheMat<-makeCasheMatrix(TestMat)
> CasheMat$getMat()
     [,1] [,2]
[1,]    5    7
[2,]    6    8
> CasheMat$getInv()
NULL
> casheSolve(CasheMat)
     [,1] [,2]
[1,]   -4  3.5
[2,]    3 -2.5
> casheSolve(CasheMat)
Getting Cashed Invertible Matrix
     [,1] [,2]
[1,]   -4  3.5
[2,]    3 -2.5
> 
> ##Test 2 [3*3 Matrix] 
> #matrix(2:10,3,3) is not possible because det(A)=0
> 
> #Test2
> 
> TestMat<-matrix(2:10,3,3)
> TestMat
     [,1] [,2] [,3]
[1,]    2    5    8
[2,]    3    6    9
[3,]    4    7   10
> CasheMat<-makeCasheMatrix(TestMat)
> CasheMat$getMat()
     [,1] [,2] [,3]
[1,]    2    5    8
[2,]    3    6    9
[3,]    4    7   10
> CasheMat$getInv()
NULL
> casheSolve(CasheMat)
Error in solve.default(MatrixData, ...) : 
  Lapack routine dgesv: system is exactly singular: U[3,3] = 0
> casheSolve(CasheMat)
Error in solve.default(MatrixData, ...) : 
  Lapack routine dgesv: system is exactly singular: U[3,3] = 0
> 
> ##Test 3 [4*4 Matrix]
> 
> #Test3
> 
> TestMat<-matrix(c(5,6,7,8,9,8,2,1,3,4,0,1,2,7,4,0),4,4)
> TestMat
     [,1] [,2] [,3] [,4]
[1,]    5    9    3    2
[2,]    6    8    4    7
[3,]    7    2    0    4
[4,]    8    1    1    0
> CasheMat<-makeCasheMatrix(TestMat)
> CasheMat$getMat()
     [,1] [,2] [,3] [,4]
[1,]    5    9    3    2
[2,]    6    8    4    7
[3,]    7    2    0    4
[4,]    8    1    1    0
> CasheMat$getInv()
NULL
> casheSolve(CasheMat)
             [,1]        [,2]        [,3]       [,4]
[1,]  0.002777778 -0.02777778  0.04722222  0.1027778
[2,]  0.212500000 -0.12500000  0.11250000 -0.1375000
[3,] -0.234722222  0.34722222 -0.49027778  0.3152778
[4,] -0.111111111  0.11111111  0.11111111 -0.1111111
> casheSolve(CasheMat)
Getting Cashed Invertible Matrix
             [,1]        [,2]        [,3]       [,4]
[1,]  0.002777778 -0.02777778  0.04722222  0.1027778
[2,]  0.212500000 -0.12500000  0.11250000 -0.1375000
[3,] -0.234722222  0.34722222 -0.49027778  0.3152778
[4,] -0.111111111  0.11111111  0.11111111 -0.1111111
> 
