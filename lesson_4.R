# 1. replicate is an important function that allows you to quickly generate random numbers. Use it to create
# a dataset of 10 variables, each drawn from a Normal distribution with different means and variances. This
# can be achieved in one line.

dataset = replicate(10, rnorm(5, mean = (sample(seq(0,100,by = 1))), sd = (sample(seq(0,5,by = .1)))))

# 2. Make your own version of the summary function for continuous datasets (like the one you generated
# above). You don’t have to slavishly replicated summary.data.frame; write something you would find
# useful.

summ <- function(dataset){
      m <- cat('Mean','\n',mean(dataset),'\n')
      s <- cat('Standard Deviation','\n', sd(dataset),'\n')
      return(cat(m,s))
}
      
summ(dataset)

# 3. Write a summary function to summarise datasets containing only categorical (...!is.numeric...) data.

summ <- function(dataset){
  l <- cat('Mean','\n',mean(dataset),'\n')
  s <- cat('Standard Deviation','\n', sd(dataset),'\n')
  return(cat(m,s))
}

summ(dataset)

# 4. Finally, make a summary function capable of covering both kinds of data. Hint: if your function doesn’t
# call the functions above, you’re likely doing it wrong.



# 5. A molecular biologist you owe a favour approaches you with a problem. They have a DNA sequence
# (e.g., ‘ACGATATACGA’) that they need to group into codons (groups of three) and translate into proteins
# (ignoring all complexities of translation and transcription). Write them a function that will take an
# arbitrary input sequence and an arbitrary codon lookup table, and output the translated sequence. Hint:
#   expand.grid will help you make a demo lookup table.




# 6. The molecular biologist now asks if you would write a function that will take multiple sequences, translate
# them, and then flag where the sequences match-up (overlap).



# 7. One more thing: could you also write a summary-type function that would report percentage overlap
# across sequences?


# 8. The molecular biologist’s advisor has shouted at them for ignoring start-codons and stop-codons. Modify
# your function from (5) to cut off all bits of the sequences before (and including) the start codon, and then
# chop off everything after (and including) the stop codon. The advisor is certain you’ve re-used your code
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

