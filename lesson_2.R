3. Write a function that calculates whether a number is a prime number (hint: what does 2 %% 3 give you?)
4. Write a loop that prints out the numbers from 1 to 20, printing “Good: NUMBER” if the number is
divisible by five and “Job: NUMBER” if then number is prime, and nothing otherwise.

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
