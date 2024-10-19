## chat-bot to order pizza

# Create Menu
  
pizza_menu <- c("Hawaiian Pizza", "PepperRoni Pizza", "Carbonara Pizza")
pizza_price <- c(250, 250, 320)
pizza_menu_tibble <- tibble(pizza_id = 1:length(pizza_menu), pizza_menu, pizza_price)

  
# Create Drink
  
drink_menu <- c("Water", "Coke")
drink_price <- c(15, 20)
drink_menu_tibble <- tibble(drink_menu, drink_price)

  
# Create function to order with the customer
  
pizza_order <- function() {
  print("Welcome to pizza world!")
  print("Please Login to order")
  username <- readline("Username: ")
  password <- readline("Password: ")
  print(paste("Hello! ", username))
  print("Today! The Recommended menu...")
  print(pizza_menu_tibble)

  repeat {  # Loop start
    pizza_user <- readline("What would you like?: ")

    if (pizza_user %in% pizza_menu) {
      break  # Exit loop if valid pizza selection
    } else {
      print("Sorry, we don't have this menu.") 
      print("Please choose from the available options: ")
      print(pizza_menu_tibble)  # Display menu
    }
  }  # Loop ends


  qty_pizza_user <- readline("How many to order?: ")
  qty_pizza_user <- as.numeric(qty_pizza_user) # Convert input to a number


  print(drink_menu_tibble)

  repeat {  # Loop start
    drink_user <- readline("Would you like to drink something?: ")

    if (drink_user %in% drink_menu) {
      break 
    } else {
      print("Sorry, we don't have this on the menu.") 
      print("Please choose from the available options: ")
      print(drink_menu_tibble)
    }
  }  # Loop ends


  qty_drink_user <- readline("How many to order?: ")
  qty_drink_user <- as.numeric(qty_drink_user) # Convert input to a number


  cat("Here are your order!", username,"\n")
  cat(" ",qty_pizza_user ,pizza_user,"\n")
  cat(" ",qty_drink_user ,drink_user,"\n")
  pizza_price_user <- pizza_menu_tibble[pizza_menu_tibble$pizza_menu == pizza_user, "pizza_price"]
  drink_price_user <- drink_menu_tibble[drink_menu_tibble$drink_menu == drink_user, "drink_price"]
  total_cost <- (qty_pizza_user * pizza_price_user) + (qty_drink_user * drink_price_user)

  print(paste0("Total cost is ", total_cost, " Baht"))
  print("Thank you! Hope your enjoy with our pizza.")
}

  
# Call function
pizza_order()
