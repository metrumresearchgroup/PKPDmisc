# a better new rmd template
# @param file file name and (optionally) path to subdirectory
# @param title Title of rmd document
# @param author Author of document
# @param date Date
# @param template template file to use for file creation
# @examples
# \dontrun{
# new_rmd("Report.Rmd")
# new_rmd("templates/Report.Rmd", "Example Report", "Devin")
# }
#
new_rmd <- function(file, 
                    title = NULL, 
                    author = NULL, 
                    date = format(Sys.time(), "%b %d, %Y"),
                    template = "basic.Rmd") {
  if(!has_ext(template, ".Rmd")) template <- paste0(template, ".Rmd")
  if(!has_ext(file, ".Rmd", match_case=F)) file <- paste0(file, ".Rmd")
  # TODO: check if directory for file path actually exists
  
  file_path <- system.file("rmarkdown/templates/basic/skeleton.Rmd")
  
  template <- readChar(file_path, nchars=file.info(file_path)$size)
  
  if(!is.null(title)) template <- gsub("TITLE", title, template)
  if(!is.null(author)) template <- gsub("AUTHOR", author, template)
  template <- gsub("DATE", date, template)
  
  writeChar(template, con = file)
}

#new_rmd("tests/test.rmd") #example failing test if tests/ folder doesn't exist

#' a better new rmd template for reports
#' @param report file name and (optionally) path to subdirectory
#' @examples
#' \dontrun{
#' new_report("lab-notebook/Report.Rmd")
#' new_report("Report.Rmd")
#' }
#' @export
new_report <- function(report) {
  if(!requireNamespace("rmarkdown", quietly = TRUE)) {
    stop("Please install the rmarkdown package to use new_report()")
  }
  
  rmarkdown::draft(report, "basic", package = "PKPDmisc")
}