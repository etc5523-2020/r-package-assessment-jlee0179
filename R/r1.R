#' Generate the format for tag$style(HTML())
#' 
#' @param id The id for each individual `tag$style(HTML())`.
#' @param color The color of the output.
#'
#' @export
ic <- function(id, color){
  
  return(base::gsub("<.*?>", "", 
              htmltools::tags$style(HTML(paste0("#", id, "{color: ", color, ";}")))))
  
  
}