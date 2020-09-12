library(matrixStats)
library(TSP)
library(Rcpp)
library(tidyverse)
library(magrittr)
#x <- runif(n = 1000, min = 0, max=100)
#y <- runif(n = 1000, min = 0, max=100)

path <- c(1)

nodes <- as.matrix(read_TSPLIB('data/ch71009.tsp'))
subNodes <- nodes[sample(1:nrow(nodes),5000, replace = FALSE),]
dMatrix <- as.matrix(dist(nodes[sample(1:nrow(nodes),5000, replace = FALSE),]))
hist(dMatrix, 200)
plot(colMeans2(dMatrix), colSds(dMatrix))

NN <- function(dVector, k=100){
  sort(dVector)[2:(k+1)]
}

NNFilter <-function(dVecotr, k=100){
  order(dVecotr) <= 101 & dVecotr != 0
}

mu <- colMeans2(dMatrix)
# mu * dMatrix OR t(mu) * dMAtrix ???
p <- 1/apply(dMatrix, 2,function(x) x * mu)
diag(p) <- 0


path <- c(277)

while(length(path < 5000)){
  pp <- colSums2(p[-path,-path])
  path <- c(path, (1:5000)[-path][which.max(pp)[1]])
}

path

cbind(nodes , k$cluster) %>%
  set_colnames(c('x','y','k')) %>%
  as_tibble() %>%
  ggplot()
  
