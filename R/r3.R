select1country <- function() {
  selectInput(inputId = "locationn", "Please select one EU country",
            choices = c("Austria", "Italy", "Belgium",
                        "Latvia", "Bulgaria", "Lithuania",
                        "Croatia",	"Luxembourg", "Cyprus",
                        "Malta", "Czechia",	"Netherlands", 
                        "Denmark",	"Poland", "Estonia",
                        "Portugal", "Finland",	"Romania",
                        "France",	"Slovakia", "Germany",	
                        "Slovenia", "Greece",	"Spain", 
                        "Hungary",	"Sweden", "Ireland"))
}
