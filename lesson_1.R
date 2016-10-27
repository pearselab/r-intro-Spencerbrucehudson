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

# lower.tri - Returns a matrix of logicals the same size of a 
# given matrix with entries TRUE in the lower triangle.
x = matrix(data=rnorm(5), nrow=5, ncol=5)
lower.tri(x)

# upper.tri - Returns a matrix of logicals the same size of a 
# given matrix with entries TRUE in the lower triangle.
upper.tri(geno)

# diag - Either extract/replace/construct matrix diagonal
x = matrix(data=rnorm(5), nrow=5, ncol=5)
y = diag(x)

# gl - Can create labeled factors by specifying numbers of levels and replications
gl(2, 8, labels = c("Control", "Treat"))

# identical - Tests if 2 objects demonstrate exact equality
x = matrix(data=rnorm(5), nrow=5, ncol=5) 
y = matrix(data=rnorm(5), nrow=5, ncol=5)
## Expected to be FALSE, since both are matrices with random numbers
identical(x,y, num.eq = TRUE, single.NA = TRUE, attrib.as.set = TRUE,
          ignore.bytecode = TRUE, ignore.environment = FALSE)

x = matrix(data=rnorm(5), nrow=5, ncol=5)
x = y 
## Expected to be TRUE since x = y
identical(x,y, num.eq = TRUE, single.NA = TRUE, attrib.as.set = TRUE,
          ignore.bytecode = TRUE, ignore.environment = FALSE)

# image - Creates crazy grids of colored/gray-scale rectangles that correspond to a matrix. 
## In other words, can display 3-d or spatial data 
image(x) # I made a national flag of an unknown country
image(y) # Rival country flag

# library - synonomous with require; loads/attaches additional packages
library(ggplot2) ## Loading an awesome plot package

# length - Retrieves the length of a particular vector,list, factor or particular object depending on desired output
length(geno$AA) # Length of my AA vector

# jitter - Adds a bit of noise to numerical values within a given vector
jitter(geno$AA) # Why in the world would we use this? I have no clue

# ls - Returns vector names of objects in the form of character strings; synonomous with objects
ls(geno)
objects(geno)

# rm(list=ls()) - removes specified loaded objects, but removes all by default
rm(list=ls()) # where did all my objects go!?!     

# mean - Calculates an arithmetic average, if an object is provided, a vector must be specified
## This will create a mean of all observations (rows) within that vector (column)
mean(geno$AA)

# median - Calculates the sample median for a data set
## ## This will create a median for all observations (rows) within that vector (column)
median(geno$AA)

# max & min - Returns maxima and minima for samples in a data set
max(geno$AA)  
min(geno$AA)

# paste - Concatenate vector ouputs as character strings
paste(geno$AA, 'Dominant Homozygous Frequency')
                             
# read.csv - Reads in a table and formats it as a data frame; pertains to .csv files
geno = read.csv('genotypes.csv')

# read.table - Reads in a table and formats it as a data frame
table = read.table('example.txt')

# write.csv - prints out object as data frame and saves it as a .csv file
write.csv(geno, file = 'genotypes.csv')

# write.table - prints out object as data frame and saves it as desired file format
write.table(geno, file='genotypes.txt', quote=F, sep=' ', row.names=F, col.names=T)

################################################
## Bonus exercises #############################
################################################

my.first.abstract = 'Bright plumage coloration is seemingly favored by females of avian species with regards to sexual selection. This particular secondary sexual characteristic has been previously tested and supported to be an honest signal of individual quality among passerines with pigment-based coloration (i.e. yellows and reds). In contrast structural plumage coloration (i.e. blues) exhibited by birds such as Indigo Buntings (Passerina cyanea) have received minimal research on relationships between plumage color intensity and aspects of physical quality physiological function. Using free-living Indigo Buntings as a study species, we compared UV and blue color intensity to innate immune responses, antioxidant capacity, stress physiology, reproductive physiology, and parasitism. UV or blue coloration of the tail feathers was not correlated with any of the physiological metrics. The overall percentage of blue feathers on individual birds was positively correlated with testosterone levels and body condition, while negatively correlated with heterophil to lymphocyte ratio. Birds with less blue coloration were more likely to harbor parasites. Our results indicate the overall blueness of male Indigo Buntings is associated with better body condition and lower stress.'
