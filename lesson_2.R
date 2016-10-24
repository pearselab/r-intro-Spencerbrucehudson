
value <- 20
while(value >= 10){
  value <- value - 1
}
print("Finished!")


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
    print('Good: NUMBER')
 else if (i == 2) 
  print('Job: NUMBER')
 else if (any(i %% 2:(i-1) == 0 )) 
  print('Nothing Otherwise')
 else  
  print('Job: NUMBER')
}



