# Console-based R Calculator
# This version works without GUI requirements

cat("=== Simple R Calculator ===\n")
cat("Enter mathematical expressions (e.g., 2+3, 5*7, sqrt(16))\n")
cat("Type 'quit' or 'exit' to close the calculator\n")
cat("Type 'clear' to clear the screen\n\n")

# Function to evaluate expression safely
calculate <- function(expr) {
  result <- tryCatch({
    eval(parse(text = expr))
  }, error = function(e) {
    paste("Error:", e$message)
  })
  return(result)
}

# Main calculator loop
while(TRUE) {
  # Get user input
  cat("Calculator> ")
  input <- readline()
  
  # Check for exit commands
  if(tolower(input) %in% c("quit", "exit", "q")) {
    cat("Goodbye!\n")
    break
  }
  
  # Check for clear command
  if(tolower(input) == "clear") {
    cat("\014")  # Clear console
    cat("=== Simple R Calculator ===\n")
    next
  }
  
  # Skip empty input
  if(input == "") {
    next
  }
  
  # Calculate and display result
  result <- calculate(input)
  cat("Result:", result, "\n\n")
}
