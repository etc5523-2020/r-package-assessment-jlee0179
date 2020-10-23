#' @export
launch_app <- function() {
  appDir <- system.file("app", package = "covideu")
  if (appDir == "") {
    stop("Could not find app directory. Try re-installing `covideu`.", call. = FALSE)
  }
  
  shiny::runApp(appDir, display.mode = "normal")
}