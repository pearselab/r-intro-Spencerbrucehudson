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

point <- function(x, y){
  output <- list(x=x, y=y)
  class(output) <- 'Point'
  return(output)
}

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

# 4. Implement a line class that takes two point objects and makes a line between them.
a<- list(x=39.7391, y=100.5398)
class(a) <- 'Line'
b <- list(x=41.7, y=113)
class(b) <- 'Line'

line <- function(x, y){
  output <- list(x=x, y=y)
  class(output) <- 'Line'
  return(output)
}

# 6. Write plot methods for point and line objects.
lineplot <- function(point1, point2){
  if(!inherits(point1, "Line") | !inherits(point2, "Line"))
    stop("You haven’t given me two sets of points!")
plot(x = c(point1$x, point2$x), y= c(point1$y, point2$y), type='b', xlab ='X', ylab='Y')
  
}
lineplot(a, b)

# 5. Implement a polygon class that stores a polygon from point objects. Hint: a polygon is really just a
# load of lines.

polygon <- function(x, y){
  output <- list(x=x, y=y)
  class(output) <- 'Polygon'
  return(output)
}

# 7. Write a plot method for a polygon. Hint: if this isn’t trivial, you’re doing something wrong.

test1 <- polygon(2,4)
test2 <- polygon(4,3)
test3 <- polygon(8,2)
test4 <- polygon(8,3)
test5 <- polygon(9,2)

polygonplot <- function(test1, test2, test3, test4, test5){
  if(!inherits(test1, "Polygon") | !inherits(test2, "Polygon") | !inherits(test3, "Polygon") | !inherits(test4, "Polygon") | !inherits(test5, "Polygon"))
    stop("This will never make a polygon!")
  plot(x = c(test1$x, test2$x, test3$x, test4$x, test5$x, test1$x), y= c(test1$y, test2$y, test3$y, test4$y, test5$y, test1$y), type='b', xlab ='X', ylab='Y')
  
}
polygonplot(test1, test2, test3, test4, test5)

# 8. Create a canvas object that the add function can add point, line, circle, and polygon objects to.
# Write plot and print methods for this class.

add <- function(point,line,circle,polygon){
  if(!inherits(point, "Point") | !inherits(line, "Line") | !inherits(circle, "Circle") | !inherits(polygon, "Polygon"))
    stop("What in the heck did you give me?!")
  canvas <- list(point, line, circle, polygon)
  return(canvas)
}

a = point(x = 1, y = 2)
b = line(x = 3, y = 5)
c = circle(r = 1, x = 2, y = 3)
d = polygon(x = 4, y = 7)

canvas = add(a,b,c,d)

# 9. Implement a circle object that takes a point and a radius and stores a circle. Don’t make a circle out
# of lines!

circle <- function(r, x, y){
  output <- list(r=r, x=x, y=y)
  class(output) <- 'Circle'
  return(output)
}

c = circle(1,2,3)

# circumference of a circle = 2*pi*r

circleplot <- function(r,x,y){
  radius <- r
  theta <- seq(0, 2 * pi, length = 100)
  plot(c(-5, 5), c(-5, 5), type = "n")
lines(x = radius * cos(theta)+x, y = radius * sin(theta)+y, type='l')
}

# 10. Write area generic methods for circle and polygon objects.


# 11. Add support for circle objects to your canvas.


# 12. Add a summary method for canvas that calculates the height and width of the canvas, the fraction of the
# canvas covered in filled-in polygons and circles (if appropriate), and average distance between any points
# on the canvas (if appropriate).




# 13. Add optional colour support for your objects.

