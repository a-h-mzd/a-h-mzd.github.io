rotateNintyDegrees <- function(data, turns = 1L, clockWise = FALSE){
  if(!is.matrix(data)) stop('input data must be matrix');
  if(!is.integer(turns)) stop('turns count must be integer');
  if(!is.logical(clockWise)) stop('clockWise must be logical');
  if((turns%%4) == 0L) return(data);
  
  if(clockWise) turns = -turns;

  rotate <- function(turns){
    result <- data
    for (t in 1:turns) {
      c = c()
      for (i in 1:nrow(result)){
        for (j in ncol(result):1){
          c = rbind(c,result[i,j])
        }
      }
      result <- matrix(c, nrow = ncol(result), ncol = nrow(result))
    }
    return(result)
  }

  return(rotate(turns%%4));
}

getData <- function(){
  x <- c();
  for (i in 1:100) for (j in 0:99) x = rbind(x,i+j);
  m = matrix(x,ncol = 100,nrow = 100,byrow = TRUE);
  return(m);
}

paint <- function(data){
  if(!is.matrix(data)) stop('input data must be matrix');
  image(data, col = heat.colors(n = 100));
}
