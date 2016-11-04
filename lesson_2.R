
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

gz <- function(t, a, b, c){
  y <- (a*exp(-b*exp(-c*t)))
  p <- plot(y~t, xlab = 'Time (Years)', ylab= 'Population Size', type='l', col= ifelse(y > a & y > b, 'purple','red'))
  return(paste(y,t))
}
gz(1:15, 10, .4, .5)

# 9. Write a function that draws boxes of a specified width and height that look like this (height 3, width 5):
#   *****
#   *   *
#   *****

box1 <- function(y, x){
  w1 <- (rep("*", x))
  cat(w1, '\n', sep='')
  cnt <- 0
  repeat{
  cat('*',(rep('',x-3)),'*','\n')
  cnt <- cnt+1
  if(cnt > y-3){
    break
  }
}
  w2 <- (rep('*',x))
  cat(w2, sep='')
}
box1(3,5)

#   10. Modify your box function to put text centered inside the box, like this:
#   *************
#   *           *
#   * some text *
#   *           *
#   *************

box2 <- function(y, x, z){
  z <- z
  a <- nchar(z)
  f <- round(((x-a-4))/2, digits = 0)
  w1 <- (rep("*", x))
  cat(w1, '\n', sep='')
  cnt <- 0
  repeat{
    cat('*',(rep('',x-3)),'*','\n')
    cnt <- cnt+1
    if(cnt > y-3){
      break
    }
  }
  cat('*',rep('', f), z, rep('', f), "*",'\n')
    cnt <- 0
  repeat{
    cat('*',(rep('',x-3)),'*','\n')
    cnt <- cnt+1
    if(cnt > y-3){
      break
    }
  }
  w2 <- (rep('*',x))
  cat(w2, sep='')
}
box2(3,15,'some text')


#   11. Modify your box function to build boxes of arbitrary text, taking dimensions specified in terms of
# dimensions, not the text. For example, box("t", 3, 9, "hey") might produce:

box3 <- function(t, y, x, z){
  z <- z
  a <- nchar(z)
  f <- round(((x-1-(a/2))/2), digits = 0)
  w1 <- (rep(t, x))
  cat(w1, '\n', sep='')
  cnt <- 0
  repeat{
    cat(t,(rep(' ',x)),t,'\n')
    cnt <- cnt+1
    if(cnt > y-3){
      break
    }
  }
  cat(t,rep(' ', (x/2)-3), z, rep(' ', (x/2)-2), t,'\n')
  cnt <- 0
  repeat{
    cat(t,(rep(' ',x)),t,'\n')
    cnt <- cnt+1
    if(cnt > y-3){
      break
    }
  }
  w2 <- (rep(t,x))
  cat(w2, sep='')
}
box3('wdp',3,8,'some text')

# 12. In ecology, hurdle models are often used to model the abundance of species found on surveys. They
# first model the probability that a species will be present at a site (drawn, for example, from a Bernoulli
# distribution) and then model the abundance for any species that is present (drawn, for example, from
# probability of presence (p) and that its abundance is drawn from a Poisson with a given λ. Hint: there is
# no Bernoulli distribution in R, but the Bernoulli is a special case of what distribution?...

# bernoulli, binomial, same thing right?
# p = probability for binomial
# n = # of random values to output
# lam = Given parameter for Poisson distribution
hurdle <- function(p, n, lam){
  if(rbinom(1, 1, p) == 1){ # species presence based on binomial with given probability of success
    ran <- rpois(n, lam) # number of sites and rate parameter
    return(paste(ran))
  }else{
    return(0)
  }
}

# (presence probability, # sites, poisson lambda)
hurdle(1, 5, 10)

## Reworked for problem 13

hurdle1 <- function(sitenum){
  r <- matrix(nrow = sitenum, ncol = 1)
  for(i in 1:sitenum){
    if(rbinom(1, 1, sample(seq(from = 0, to = 1, by = .001), size = 1, replace = TRUE)) == 1){ # species presence based on binomial with given probability of success
      abun <- rpois(1, sample(seq(from = 0, to = 10, by = .1), size = 1, replace = TRUE)) # number of sites and rate parameter
    }else{
      abun <- 0
    }
    r[i,] <- abun
  }
  return(r)
}
# (presence probability, # sites, poisson lambda)
hurdle1(5)

# 13. An ecologist really likes your hurdle function (will you never learn?). Write them a function that simulates
# lots of species (each with their own p and λ) across n sites. Return the results in a matrix where each
# species is a column, and each site a row (this is the standard used for ecology data in R).

# 
hurdle2 <- function(sitenum, spnum){
  r <- matrix(nrow=sitenum, ncol=spnum)
  for(i in 1:spnum){
   r[,i] <- hurdle1(sitenum)
    }
  return(r)
    }

hurdle2(10, 7)

# 14. Professor Savitzky approaches you with a delicate problem. A member of faculty became disoriented
# during fieldwork, and is now believed to be randomly wandering somewhere in the desert surrounding
# Logan. He is modelling their progress through time in five minute intervals, assuming they cover a
# random, Normally-distributed distance in latitude and longitude in each interval. Could you simulate this
# process 100 times and plot it for him?

# t = number of 5 min intervals

# average walking speed = 3.1 mph
# if 3.1 mph then .0833 miles per 5 min on average, so half that per x and y direction

progress <- function(t){
  datalist=list()
  for(i in 1:t){
    lat <- (mean(abs(rnorm(100, mean = 0.0415, sd = .001)))) 
    lon <- (mean(abs(rnorm(100, mean = 0.0415, sd = .001)))) 
    dis <- (sqrt(lat)+sqrt(lon))/2
    dat <- data.frame(dis=dis)
    dat$time <- i*5
    datalist[[i]] <- dat
  }
big_data = do.call(rbind,datalist)
big_data$dis2 = cumsum(big_data$dis)
plot(big_data$dis2 ~ big_data$time, xlab='Time (Min)', ylab='Distance Traveled (Miles)',type='b')
print(big_data)
}

progress(5)

 
# 15. Professor Savitzky is deeply concerned to realise that the member of faculty was, in fact, at the top of
# a steep mountain in the fog. Approximately 5 miles away, in all directions, from the faculty member’s
# starting point is a deadly cliff! He asks if you could run your simulation to see how long, on average,
# until the faculty member plummets to their doom.

progress2 <- function(t){
  datalist=list()
  for(i in 1:t){
    lat <- (mean(abs(rnorm(100, mean = 0.0833, sd = .005)))) 
    lon <- (mean(abs(rnorm(100, mean = 0.0833, sd = .005)))) 
    dis <- (sqrt(lat)+sqrt(lon))/2
    dat <- data.frame(dis=dis)
    dat$time <- i*5
    datalist[[i]] <- dat
  }
  big_data = do.call(rbind,datalist)
  big_data$dis2 = cumsum(big_data$dis)
  plot(big_data$dis2 ~ big_data$time, xlab='Time (Min)', ylab='Distance Traveled (Miles)',type='b')
  print(big_data)
  print(paste('The faculty member will be doomed at', big_data$time[which(big_data$dis2>=5)], 'minutes'))
  
}

progress2(20)
# 16. Sadly, by the time you have completed your simulations the faculty member has perished. Professor
# Savitzky is keen to ensure this will never happen again, and so has suggested each faculty member
# be attached, via rubber band, to a pole at the centre of the site whenever conducting fieldwork 3. He
# assures you that you can model this by assuming that the faculty member, at each time-step, moves α×
# distance-from-pole latitudinally and longitudinally (in addition to the rate of movement you’ve already
# simulated) each time-step. Simulate this, and see how strong the rubber band (α) must be to keep the
# faculty member safe for at least a day.
# 



# 17. (If you finish early: Most, if not all, faculty members are not as young as they once were. See what effect
# the faculty member tiring (and eventually sitting down and giving up) would have on their likelihood of
# survival. What would happen if a faculty member panicked and walked faster through time?
#                                                                                                                                                   the Poisson distribution). Write a function that simulates the abundance of a species at n sites given a
