cppFunction('
            NumericMatrix cppDist(NumericMatrix nodes){
            int N = nodes.nrow();
            NumericMatrix dMatrix(N,N);
            
            for(int i=0; i < N; i++){
              for(int j=0 ; j < N; j++){
                dMatrix(i,j) = sqrt(
                pow(nodes(i,0) - nodes(j,0), 2) + pow(nodes(i,1) - nodes(j,1), 2)
                );
              }
            }
            return dMatrix;
            }
            ')


nodes <- as.matrix(read_TSPLIB('data/dj38.tsp'))
dMatrix <- as.matrix(dist(nodes))

path <- c(1)
for(i in 1:nrow(nodes)){
  new <- which.min(dMatrix[1:,i])
  path <- c(path, )  
}
