dexter = list(length=60, weight=40, breed='mongrel')
class(dexter) <- 'dog'


# 
# print.dog = function(x, ...)
#   cat("Woof! I can't actually talk!")
# 
# askdog = function(x, ...)
#   UseMethod("askdog")
# 
# askdog.default = function(x, ...)
#   cat("Woof! A number!")
# 
# askdog.numeric = function(x, ...)
#   cat("Woof! A number!")
# 
# askdog.dog = function(x, ...)
#   cat("Woof! A dog!")

# new.dog <- function(weight, breed){
#   output <- list(weight=weight, breed=breed)
#   class(output) <- "dog"
#   return(output)
# }


# 1. Implement a cat class, complete with race and print methods.
noodles <- list(length=45, weight=10, breed="tabby")
class(noodles) <- "cat"
class(noodles)
noodles

sawyer <- list(length=51, weight=15, breed="tabby")
class(sawyer) <- "cat"
class(sawyer)
sawyer

race <- function(first, second){
  if(!inherits(first, "cat") | !inherits(second, "cat"))
    stop("You haven’t given me two cats!")
  if(first$length > second$length){
    print("First cat won!")
    return(first)
  }
  print("Second cat won!")
  return(second)
}

race(noodles, sawyer)

# 2. Implement a point class that holds x and y information for a point in space.



# 3. Write a distance method that calculates the distance between two points in space.
# 4. Implement a line class that takes two point objects and makes a line between them.


