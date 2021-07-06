do_scatter <- function(irace_results, config1, config2, rpd=TRUE, testing=FALSE, fileout=NULL) {
    require("ggplot2")

    if (!testing)
       data <- as.data.frame(irace_results$experiments[,as.character(c(config1, config2))])
    else
       data <- as.data.frame(irace_results$testing$experiments[,as.character(c(config1, config2))])
    if (rpd == TRUE) {
      data <- 100 * (data - apply(data, 1, min)) / apply(data, 1, min)
    }

    allnames <- colnames(data)
    colnames(data) <- c("config1", "config2")

    
    p <- ggplot(data, aes(x=config1, y=config2)) + geom_point() + geom_abline(intercept = 0, slope = 1)
    p <- p + xlab(allnames[1]) + ylab(allnames[2])

 
    if (is.null(fileout)) {
       p
    } else {
       ggsave(filename=fileout, plot=p)
    }
}