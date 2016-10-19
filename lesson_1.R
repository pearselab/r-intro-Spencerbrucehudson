################################################
## Exercises ###################################
################################################

## Load example data set, and subset it into a couple objects for examples below
geno = read.csv('genotypes.csv')
geno1 = subset(geno, select =c(AA))
geno2 = subset(geno, select =c(aa))
geno3 = subset(geno, select =c(Aa))

# c or cat - concatenate
# concatenate a string of 100 numbers (1-100)
c(1:100)
# concatenate two vectors containing concatenated numbers
c(c(1:100),c(101:200))
# make this concatenation into an object
numbers = c(c(1:100),c(101:200))

# cbind - combine a sequence of vector, matrix, or DF by columns; recombine original dataset into a new object
g = cbind(geno1, geno2, geno3)
## Specify columns from original object to combine into a new object
ge = cbind(geno$AA, geno$Aa)

# col - provides a matrix containing column numbers
col(geno)
# extract an off-diagonal of a matrix
geno
x = geno[row(geno) == col(geno) +1]
x
# row - provides a matrix containing row numbers
row(geno)
# extract the diagonal of a matrix
y <- geno[row(geno) == col(geno)]
y

# cut - divides a particular range of a vector into intervals, potentially factors
cut(geno$Aa, breaks = 2)

# diff - takes difference of a prior value from subsequent value, and the lag between values can be adjusted
diff(geno$AA, 1)

# dim - output the dimensions of the object, as well as set those dimensions
dim(geno)

# rownames - call names of rows for a df or matrix-like object
rownames(geno)

# colnames - call names of columns for a df or matrix-like object
colnames(geno)

# names - call or set the names of an object
names(geno)

# expand.grid - makes a df containing all possible combinations of the vectors/factors included
ex = expand.grid(geno$AA, geno$Aa)

# eigen - calculates eigenvalues/eigenvectors of a matrix containing an even number of rows/columns
x = matrix(data=rnorm(4), nrow=2, ncol=2)
eigen(x)


# %*% - multiples 2 matrices, granted they are conformable
x = matrix(data=rnorm(4), nrow=2, ncol=2)
y = matrix(data=rnorm(4), nrow=2, ncol=2)

x %*% y


lower.tri, upper.tri, diag (try ?"%*%", not ?%*%, as this is an operator, and document
the function, not the maths 
gl 
identical
image
library
length
jitter
                                        ls; what does rm(list=ls()) do?
                                        mean, median, max, min
                                        paste
                                        read.csv, read.table, write.csv, write.table

################################################
## Bonus exercises #############################
################################################

bonus.text <- "It was the best of times, it was the worst of times, it was the age of
wisdom, it was the age of foolishness, it was the epoch of belief, it
was the epoch of incredulity, it it was the season of Light, it was the
season of Darkness, it was the spring of hope, it was the winter of
despair, we had everything before us, we had nothing before us, we
were all going direct to Heaven, we were all going direct the other
way- in short, the period was so far like the present period, that
some of its noiosiest authorities insisted on its being received, for
good or for evil, in the superlative degree of comparison only."
