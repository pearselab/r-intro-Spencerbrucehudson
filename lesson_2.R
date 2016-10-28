
## 1. Write a loop that prints out the numbers from 20 to 10
for(i in 20:10){
  print(i)
}
## 2. Write a loop that print out only the numbers from 20 to 10 that are even
num = 1:20
num = num[num%%2==0]
for(i in num){
  print(i)
}
## OR
num = 1:20
for(i in num){
  if(i%%2==0) print(i)
}
## 3. Write a function that calculates whether a number is a prime number (hint: what does 2 %% 3 give you?)

prime <- function(x){
  if (x == 2) {
    TRUE
  } else if (any(x %% 2:(x-1) == 0)) {
    FALSE
  } else { 
    TRUE
    }
}

## 4. Write a loop that prints out the numbers from 1 to 20, printing “Good: NUMBER” if the number is
## divisible by five and “Job: NUMBER” if then number is prime, and nothing otherwise.

num = 1:20
for(i in num){
  if(i%%5==0)  
    print(paste(i,'Good: NUMBER'))
 else if (i == 2) 
  print(paste(i,'Job: NUMBER'))
 else if (any(i %% 2:(i-1) == 0 )) 
  print(paste(i,'Nothing'))
 else  
  print(paste(i,'Job: NUMBER'))
}

# 5. A biologist is modelling population growth using a Gompertz curve, which is defined as y(t) = a.e−b.e−c.t
# where y is population size, t is time, a and b are parameters, and e is the exponential function. Write
# them a function that calculates population size at any time for any values of its parameters.

gz <- function(t, a, b, c){
  y <- (a*exp(-b*exp(-c*t)))
    return(y)
}
gz(15, 100, 1, 1) 


# 6. The biologist likes your function so much they want you to write another function that plots the progress
# of the population over a given length of time. Write it for them.

gz <- function(t, a, b, c){
  y <- (a*exp(-b*exp(-c*t)))
  p <- plot(y~t, xlab = 'Time (Years)', ylab= 'Population Size', type='l')
 return(paste(y,t))
}
gz(1:15, 100, 1, 1)


# 7. The biologist has fallen in love with your plotting function, but want to colour y values above a as blue,
# and y values above b as red. Change your function to allow that.

gz <- function(t, a, b, c){
  y <- (a*exp(-b*exp(-c*t)))
  p <- plot(y~t, xlab = 'Time (Years)', ylab= 'Population Size', type='l', col= ifelse(y > a, 'blue','red'))
  return(paste(y,t))
}
gz(1:15, 10, .4, .5)


# 8. You are beginning to suspect the biologist is taking advantage of you. Modify your function to plot in
# purple any y value that’s above a and b. Hint: try putting 3==3 & 2==2 and 3==4 | 2==2 into an if
# statement and see what you get. Using this construction may make this simpler.

# 9. Write a function that draws boxes of a specified width and height that look like this (height 3, width 5):
#   *****
#   * *
#   *****
#   10. Modify your box function to put text centred inside the box, like this:
#   *************
#   * *
#   * some text *
#   * *
#   *************
#   11. Modify your box function to build boxes of arbitrary text, taking dimensions specified in terms of
# dimensions, not the text. For example, box("wdp", 3, 9, "hey") might produce:
#   wdpwdpwdp
# w hey w
# wdpwdpwdp