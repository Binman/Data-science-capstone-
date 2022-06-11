library(tidyverse)
library(tidytext)
library(here)
library(widyr)

## data load
blogs <- read_tsv(here('final/en_US/en_US.blogs.txt'), 
                  col_names = FALSE, col_types = 'c')
news <- read_tsv(here('final/en_US/en_US.news.txt'), 
                 col_names = FALSE, col_types = 'c')
twitter <- read_tsv(here('final/en_US/en_US.twitter.txt'), 
                    col_names = FALSE, col_types = 'c')

## combine all lines and rename
corpus <-rbind(blogs, news, twitter)
colnames(corpus) <- 'text'

## sample 50,000 lines for further analysis
set.seed(1234)
corpus_sample <- sample(corpus$text, 50000, replace = FALSE) %>% 
  as_tibble()

## apply N-grams (n=2) for prediction
corpus_bigrams <- corpus_sample %>% 
  unnest_tokens(bigram, value, token = 'ngrams', n = 2) %>% 
  separate(bigram, c('word1', 'word2'), sep = ' ') 
  
## sort word combination and remove NA
corpus_counts <- corpus_bigrams %>% 
  count(word1, word2, sort=TRUE) %>% 
  drop_na()

## model test
input <- 'english'
output <- corpus_counts %>% filter(word1 == input) %>% .[1,2] %>% as_vector()



