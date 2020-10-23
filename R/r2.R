#' Draw the plot of daily cases and deaths numbers for locations. 
#' 
#' @param data The dataset, here we are using "owid_eu_long".
#' @param x "location" as the x-axis of this graph.
#' @param y "count" as the y-axis of this graph, representing numbers of daily cases and deaths.
#' @param fill "type_new"
#' 
#' @export
draw_plot <- function(data, x, y, fill){
  ggplot2::ggplot(data, aes(x = {{x}}, y = {{y}}, fill = {{fill}})) +
    geom_col(stat = "identity", position = "dodge") +
    xlab("Location") +
    ylab("Number of confirmed deaths and cases") +
    guides(fill=guide_legend(title="Type")) +
    theme(panel.background = element_rect(fill = "transparent", color = NA),
          plot.background = element_rect(fill = "transparent", color = NA),
          axis.text = element_text(color = "white"),
          axis.title.x = element_text(colour = "#D0D3D4"),
          axis.title.y = element_text(colour = "#D0D3D4"),
          legend.background = element_rect(fill=alpha('white', 0.2)))
}