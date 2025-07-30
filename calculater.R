# Load tcltk package
library(tcltk)

# Create the main window
win <- tktoplevel()
tkwm.title(win, "Simple R Calculator")

# Create an input field where user types the expression
input_var <- tclVar("")
input_entry <- tkentry(win, textvariable = input_var, width = 30, font = "Arial 14")
tkgrid(input_entry, padx = 10, pady = 10)

# Create a result display label
result_var <- tclVar("Result will appear here")
result_label <- tklabel(win, textvariable = result_var, font = "Arial 14", foreground = "blue")
tkgrid(result_label, padx = 10, pady = 10)

# Define function to evaluate expression
calculate <- function() {
  expr <- tclvalue(input_var)
  result <- tryCatch(eval(parse(text = expr)), error = function(e) "Invalid expression")
  tclvalue(result_var) <- as.character(result)
}

# Add Calculate button
calc_button <- tkbutton(win, text = "Calculate", command = calculate, width = 15)
tkgrid(calc_button, padx = 10, pady = 10)

# Add Clear button
clear_button <- tkbutton(win, text = "Clear", width = 15, command = function() {
  tclvalue(input_var) <- ""
  tclvalue(result_var) <- "Result will appear here"
})
tkgrid(clear_button, padx = 10, pady = 5)
library(tcltk)

