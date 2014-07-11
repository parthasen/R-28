complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files

        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        total <- data.frame()
        for(fileid in id)
        {
                curr_dat <- read.csv(paste(directory,sprintf("/%03d.csv",fileid),sep=""), header = TRUE, sep = ",")
                #filename
                sum_cases <- sum(complete.cases(curr_dat))
                total <- rbind(total,c(fileid,sum_cases))
                ##polldat <-
        }
        colnames(total) <- c("id","nobs")
        return(total)
}