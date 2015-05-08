pearson <- function( v1, v2 ){
    sum1 = sum(v1)
    sum2 = sum(v2)
    sSq1 = sum(v1*v1)
    sSq2 = sum(v2*v2)
    pSum = sum(v1*v2)
    
    num = pSum - (sum1*sum2 / length(v1))
    den = sqrt((sSq1 - sum1^2/length(v1)) * (sSq2 - sum2^2/length(v2)))
    if (den == 0){ return(0.0) }
    return(1.0-num/den)
}