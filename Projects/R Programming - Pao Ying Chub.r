# Create Function
play_game <- function() {
  game <- 0
  computer_score <- 0
  user_score <- 0
  hands = c("hammer", "scissor", "paper")


  user_ans <- readline("Are you ready to play game! (yes/no): ")
  if (user_ans == "yes") {
    print("Let start!")

    while (game < 10){
      print(paste0("Round: ", game + 1))

      repeat {
        user <-  readline("Your turn, Please input hand (hammer/scissor/paper): ")
        computer <- sample(hands, 1)
        if (user %in% hands) {
          break
        } else {
          print("Please input hand again")
        }
      }

      if (computer == "hammer" & user == "scissor"){
        computer_score <- computer_score + 1
        print(paste0("computer is ", computer))
        print("Computer got one point!")
        cat("\n")
      } else if (computer == "scissor" & user == "paper"){
        computer_score <- computer_score + 1
        print(paste0("computer is ", computer))
        print("Computer got one point!")
        cat("\n")
      } else if (computer == "paper" & user == "hammer"){
        computer_score <- computer_score + 1
        print(paste0("computer is ", computer))
        print("Computer got one point!")
        cat("\n")
      } else if (computer == "paper" & user == "hammer"){
        computer_score <- computer_score + 1
        print(paste0("computer is ", computer))
        print("Computer got one point!")
        cat("\n")
      } else if (computer == user ) {
        print(paste0("computer is ", computer))
        print("It's a draw.")
        cat("\n")
      } else {
        user_score <- user_score + 1
        print(paste0("computer is ", computer))
        print("You got one point!")
        cat("\n")
      }
      game <- game + 1
    }
    cat("computer score is ", computer_score," points.", "\n",
        "Your score is ", user_score," points.","\n")
    cat("\n")
    if (computer_score > user_score) {
      print("You lost this game!")
    } else if (computer_score < user_score) {
      print("You win this game!")
    } else {
      print("It's a draw.")
    }
  } else {
    print("No problem, i will be waiting for you.")
  }
}

# Start Game!
play_game()
