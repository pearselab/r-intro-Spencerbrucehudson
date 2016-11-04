# 1. replicate is an important function that allows you to quickly generate random numbers. Use it to create
# a dataset of 10 variables, each drawn from a Normal distribution with different means and variances. This
# can be achieved in one line.

dataset = replicate(10, rnorm(5, mean = (sample(seq(0,100,by = 1))), sd = (sample(seq(0,5,by = .1)))))

# 2. Make your own version of the summary function for continuous datasets (like the one you generated
# above). You don’t have to slavishly replicated summary.data.frame; write something you would find
# useful.

numsum <- function(dataset){
  numeric <- dataset[sapply(dataset, is.numeric)]
      m <- cat('Mean','\n',mean(dataset),'\n')
      s <- cat('Standard Deviation','\n', sd(dataset),'\n')
      return(cat(m,s))
}
      
summ(catdata)

# 3. Write a summary function to summarise datasets containing only categorical (...!is.numeric...) data.

catdata = read.csv('May_2016_lizards.csv')

catsum <- function(dataset){
  factor <- dataset[sapply(dataset, is.factor)]
  return(summary(factor))
}

catsum(catdata)

# 4. Finally, make a summary function capable of covering both kinds of data. Hint: if your function doesn’t
# call the functions above, you’re likely doing it wrong.

supersum <- function(dataset){
  n <- numsum()
  c <- catsum()
  return(paste(c,n))
}

supersum(catdata)


# 5. A molecular biologist you owe a favour approaches you with a problem. They have a DNA sequence
# (e.g., ‘ACGATATACGA’) that they need to group into aminos (groups of three) and translate into proteins
# (ignoring all complexities of translation and transcription). Write them a function that will take an
# arbitrary input sequence and an arbitrary amino lookup table, and output the translated sequence. Hint:
#   expand.grid will help you make a demo lookup table.


## Making the lookup table ###
nucleotide <- c('T','C','A','G')
table <- expand.grid(nucleotide, nucleotide, nucleotide)
table$codon <- paste(table$Var1, table$Var2, table$Var3, sep="")
table$amino <- table$codon
table$amino[table$amino==c('GCT')]<-'A'
table$amino[table$amino==c('GCC')]<-'A'
table$amino[table$amino==c('GCA')]<-'A'
table$amino[table$amino==c('GCG')]<-'A'

table$amino[table$amino==c("CGT")]<-'R'
table$amino[table$amino==c("CGC")]<-'R'
table$amino[table$amino==c('CGA')]<-'R'
table$amino[table$amino==c('CGG')]<-'R'
table$amino[table$amino==c('AGA')]<-'R'
table$amino[table$amino==c('AGG')]<-'R'

table$amino[table$amino==c('AAT')]<-'N'
table$amino[table$amino==c('AAC')]<-'N'
table$amino[table$amino==c('GAT')]<-'D'
table$amino[table$amino==c('GAC')]<-'D'
table$amino[table$amino==c('TGT')]<-'C'
table$amino[table$amino==c('TGC')]<-'C'
table$amino[table$amino==c('CAA')]<-'Q'
table$amino[table$amino==c('CAG')]<-'Q'
table$amino[table$amino==c('GAA')]<-'E'
table$amino[table$amino==c('GAG')]<-'E'
table$amino[table$amino==c('GGT')]<-'G'
table$amino[table$amino==c('GGC')]<-'G'
table$amino[table$amino==c('GGA')]<-'G'
table$amino[table$amino==c('GGG')]<-'G'

table$amino[table$amino==c('CAT')]<-'H'
table$amino[table$amino==c('CAC')]<-'H'

table$amino[table$amino==c('AAT')]<-'I'
table$amino[table$amino==c('ATC')]<-'I'
table$amino[table$amino==c('ATA')]<-'I'
table$amino[table$amino==c('ATT')]<-'I'

table$amino[table$amino==c('ATG')]<- "START"
table$amino[table$amino==c('TTA')]<-'L'
table$amino[table$amino==c('TTG')]<-'L'
table$amino[table$amino==c('CTT')]<-'L'
table$amino[table$amino==c('CTC')]<-'L'
table$amino[table$amino==c('CTA')]<-'L'
table$amino[table$amino==c('CTG')]<-'L'

table$amino[table$amino==c('AAA')]<-'K'
table$amino[table$amino==c('AAG')]<-'K'
table$amino[table$amino==c('ATG')]<-'M'
table$amino[table$amino==c('TTT')]<-'F'
table$amino[table$amino==c('TTC')]<-'F'

table$amino[table$amino==c('CCT')]<-'P'
table$amino[table$amino==c('CCA')]<-'P'
table$amino[table$amino==c('CCG')]<-'P'
table$amino[table$amino==c('CCC')]<-'P'

table$amino[table$amino==c('TCT')]<-'S'
table$amino[table$amino==c('TCC')]<-'S'
table$amino[table$amino==c('TCA')]<-'S'
table$amino[table$amino==c('TCG')]<-'S'

table$amino[table$amino==c('AGT')]<-'S'
table$amino[table$amino==c('AGC')]<-'S'

table$amino[table$amino==c('ACT')]<-'T'
table$amino[table$amino==c('ACC')]<-'T'
table$amino[table$amino==c('ACA')]<-'T'
table$amino[table$amino==c('ACG')]<-'T'

table$amino[table$amino==c('TGG')]<-'W'
table$amino[table$amino==c('TAT')]<-'Y'
table$amino[table$amino==c('TAC')]<-'Y'

table$amino[table$amino==c('GTT')]<-'V'
table$amino[table$amino==c('GTC')]<-'V'
table$amino[table$amino==c('GTA')]<-'V'
table$amino[table$amino==c('GTG')]<-'V'

table$amino[table$amino==c('TAA')]<-'STOP'
table$amino[table$amino==c('TGA')]<-'STOP'
table$amino[table$amino==c('TAG')]<-'STOP'

## Example Sequence
sequence <- 'ACGATATACGA'

translate <- function(sequence){
  a <- sapply(seq(from=1, to=nchar(sequence), by=3), function(i) substr(sequence, i, i+2))
  b <- data.frame(a=a)
  grep('')
  cat(a,sep='')
}


protein = translate()


# 6. The molecular biologist now asks if you would write a function that will take multiple sequences, translate
# them, and then flag where the sequences match-up (overlap).



# 7. One more thing: could you also write a summary-type function that would report percentage overlap
# across sequences?


# 8. The molecular biologist’s advisor has shouted at them for ignoring start-aminos and stop-aminos. Modify
# your function from (5) to cut off all bits of the sequences before (and including) the start amino, and then
# chop off everything after (and including) the stop amino. The advisor is certain you’ve re-used your code
# from (5) for (6), so this will help with that function too, right?


# 9. Given recent events, Professor Savitzky has decided to keep more thorough tabs on the people (graduate
#  students, post-docs, and faculty members) and resources (lab equipment, chemicals, and computers) in
# the Department of Biology. His friends in other departments would like something similar. He asks
# you to make a list with two slots: people and equipment that can store each of the above kinds of
# information for departments. Hint: you will probably want to make three classes: department (the list),
# person (with slots for name, title, and (optionally) advisor) and equipment (with slots for owner, type,
#  and kind). Make sure you write print and summary methods for departments.


# 10. Professor Savitzky needs to present information about the department to the provost, and asks you to write
# a function that will calculate how many pieces of each type of equipment every member of faculty owns.
# Write a separate function that calculates the people who work for each member of faculty (remember that
# people aren’t equipment).

