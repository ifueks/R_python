
employees = 1:400
gender= sample(c("male", "female"), size = 400, replace = TRUE)# Generate 400 gender values
salary = sample(c(7500:30000), size = 400, replace = TRUE)# Generate 400 salary values
employee_level = (character(400)) # Initialize with 400 empty strings
tryCatch({ #Exception handling
  for (i in 1:400){  # Loop through each employee
    #conditional statment to determine employee level
    if (salary[i] >= 10000 && salary[i] <= 20000)#if (between(salary[i], 10000, 20000))
    {
      employee_level[i] = "A1"
    }
    else if (salary[i] >= 7500 && salary[i] <= 30000 && gender[i] == "female")
    {
      employee_level[i] = "A5-F"
    }
    else employee_level[i] = "undefined"
  }
  # Combine employee details into a single data frame.Create a data frame with the employee details
  worker_detail= data.frame(
    employees= employees,
    gender = gender,
    salary = salary,
    employee_level = employee_level)
  
}, error = function(e) {
  cat("Error at iteration", i, ":", conditionMessage(e), "\n")
  employee_level[i] = "error"
})   
cat("Execution completed,\n")



# Print the first few records to verify
head(worker_detail)

