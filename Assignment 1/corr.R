corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  corre <- data.frame()
  id = 1:332
  for(fileid in id)
  {
    curr_dat <- read.csv(paste(directory,sprintf("/%03d.csv",fileid),sep=""), header = TRUE, sep = ",")
    nobs <- sum(complete.cases(curr_dat))
    if (nobs > threshold)
    {
      corre <- rbind(corre,cor(curr_dat$nitrate, curr_dat$sulfate, use="complete.obs"))
    }
  }
  corre <- unlist(corre[!sapply(corre, is.null)])
  return(corre)
}