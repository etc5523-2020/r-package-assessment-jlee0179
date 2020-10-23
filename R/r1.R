ic <- function(id, color){
  
  return(gsub("<.*?>", "", 
              tags$style(HTML(paste0("#", id, "{color: ", color, ";}")))))
  
  
}
