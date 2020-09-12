N <- nrow(subNodes)
#x <- rnorm(N, 50, 10)
#y <- rnorm(N, 50, 10)
S <- 1:N
in_out <- combn(S, 2)
#nodes <- as.matrix(data.frame(x,y))
#dMatrix <- as.matrix(dist(nodes))

m <- sapply(S, function(city){
  io <- in_out[,in_out[1,] != city & in_out[2,] != city]
  as.matrix(data.frame(i = io[1,], j = city, k = io[2,], cost = dMatrix[io[1,],city]+dMatrix[city, io[2,]]))
}, simplify = 'array')

gc()
ls()


sqrt((35683.33-22173.89)^2 + (11828.3 - 110422.8)^2)
