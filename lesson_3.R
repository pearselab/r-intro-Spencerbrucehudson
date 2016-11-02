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
class(noodles) <- c("cat")
class(noodles)
noodles

sawyer <- list(length=51, weight=15, breed="tabby")
class(sawyer) <- c("cat", "mammal")
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
wilmington <- list(lat=39.7391, lon=75.5398, name='Wilmington')
class(wilmington) <- 'Point'
logan <- list(lat=41.7, lon=111.8, name='Logan')
class(logan) <- 'Point'

# 3. Write a distance method that calculates the distance between two points in space.
deg2rad <- function(deg) {(deg*pi)/(180)}

  distance <- function(loc1, loc2){
    if(!inherits(loc1, "Point") | !inherits(loc2, "Point"))
      stop("You haven’t given me two points!")
    R = 3961 # miles
    lat1 = deg2rad(loc1$lat)
    lat2 = deg2rad(loc2$lat)
    lon1 = deg2rad(loc1$lon)
    lon2 = deg2rad(loc2$lon)
    dlon = lon2 - lon1
    dlat = lat2 - lat2
    # dlon = deg2rad(loc2$lon - loc1$lon)
    # dlat = deg2rad(loc2$lat - loc1$lat)
    a = (sin(dlat/2))^2 + cos(lat1) * cos(lat2) * (sin(dlon/2))^2 
    c = 2 * atan2(sqrt(a), sqrt(1-a) ) 
    d = R * c 
      print(paste('The distance between', loc1$name, 'and', loc2$name, 'is approximately', round(d,digits=0), 'miles.'))
    }
distance(wilmington, logan)
  
4. Implement a line class that takes two point objects and makes a line between them.


