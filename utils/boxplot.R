
boxplot_test <- function(irace_results, rpd = TRUE, filename = NULL) {
  suppressMessages(require("ggplot2"))

  # verify that test this in irace_results
  if (!("testing" %in% names(irace_results))) {
    return("irace_results does not contain the testing data")
  }

  
  data <- as.data.frame(irace_results$testing$experiments)
  if (rpd == TRUE) {
    data <- 100 * (data - apply(data, 1, min)) / apply(data, 1, min)
  }


  data <- reshape(data, direction="long", varying=colnames(data), idvar="instance", v.names="performance", times=colnames(data), timevar="id")
  rownames(data) <- NULL


  best_conf <- sample("none", size = dim(data)[1], replace = TRUE)
  data <- cbind(data, best_conf)
  data$best_conf[data$id == irace_results$allElites[[length(irace_results$allElites)]][1]] <- "best" 
  

  data$id <- as.factor(data$id)
  data$instance <- as.factor(data$instance)
   print(data)

  # the box plot is created
  p <- ggplot(data, aes(x = id, y = performance, fill = best_conf)) +
      scale_color_hue(h = c(220, 270))


  p <- p +
    geom_boxplot() +
    geom_jitter(size=3, alpha=0.2, width=0.2) +
    theme(legend.position = "none") +
    labs(x = "ID", y = "Performance") +
    ggtitle("Testing performance") +
    theme(axis.text.x=element_text(size=rel(1.3)), axis.text.y=element_text(size=rel(1.3)), plot.title = element_text(hjust = 0.5))


  # If the value in file_name is added the pdf file is created
  if (!is.null(filename)) {
    ggsave(filename, plot = p)
    # If you do not add the value of filename, the plot is displayed
  } else {
    p
    return(p)
  }
}



boxplot_train <- function(irace_results, rpd = TRUE, filename = NULL) {
  suppressMessages(require("ggplot2"))

  elite_id <- irace_results$allElites[[length(irace_results$allElites)]]
  data <- as.data.frame(irace_results$experiments[,elite_id])

  if (rpd == TRUE) {
    data <- 100 * (data - apply(data, 1, min)) / apply(data, 1, min)
  }


  data <- reshape(data, direction="long", varying=colnames(data), idvar="instance", v.names="performance", times=colnames(data), timevar="id")
  rownames(data) <- NULL



  best_conf <- sample("none", size = dim(data)[1], replace = TRUE)
  data <- cbind(data, best_conf)
  data$best_conf[data$id == irace_results$allElites[[length(irace_results$allElites)]][1]] <- "best" 
  

  data$id <- as.factor(data$id)
  data$instance <- as.factor(data$instance)
   print(data)

  # the box plot is created
  p <- ggplot(data, aes(x = id, y = performance, fill = best_conf)) +
      scale_color_hue(h = c(220, 270))


  p <- p +
    geom_boxplot() +
    geom_jitter(size=3, alpha=0.2, width=0.2) +
    theme(legend.position = "none") +
    labs(x = "ID", y = "Performance") +
    ggtitle("Training performance") +
    theme(axis.text.x=element_text(size=rel(1.3)), axis.text.y=element_text(size=rel(1.3)), plot.title = element_text(hjust = 0.5))


  # If the value in file_name is added the pdf file is created
  if (!is.null(filename)) {
    ggsave(filename, plot = p)
    # If you do not add the value of filename, the plot is displayed
  } else {
    p
    return(p)
  }
}
