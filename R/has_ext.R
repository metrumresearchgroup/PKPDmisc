#' check for if the passed name has a file extension
#' @param name string name to check for extension
#' @param ext string of extension to check
#' @param match_case logical whether to match the case when checking extension.
#'    defaults to TRUE
#' @details
#' This is not a particularly robust checker, but serves its purpose
#' @examples
#' has_ext("test.rmd", ".rmd") #TRUE
#' has_ext("test.Rmd", ".rmd", match_case=FALSE) #TRUE
#' has_ext("testrmd", ".rmd") #FALSE
#' @export
has_ext <- function(name, ext, match_case=TRUE) {
  ext <- gsub("\\.", "", ext)
  grepl(pattern = paste0("\\.", ext, "$"),
        x = name, 
        ignore.case = as.logical(abs(match_case-1)),
        perl=T) 
}

