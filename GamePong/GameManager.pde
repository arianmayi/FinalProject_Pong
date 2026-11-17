/*
-Manages the overal state of the pong game
Handles transitions between menu, gameplay, and gameover
-Coordinates the ball, paddles and scoring system
-Handles restarting the game after a match ends
*/
class GameManager{
  String gameState;
  String difficulty;
  int playerScore;
  int computerScore;
  int winningScore;

  GameManager(){
    gameState = "menu";
    difficulty = "easy";
    playerScore = 0;
    computerScore = 0;
    winningScore = 5;
  }

  //starts a new game and resets the scores
  void startGame(String level){
    difficulty = level;
    playerScore = 0;
    computerScore = 0;
    gameState = "playing";
  }

  //updates the game while playing
  void update(){
    if (gameState.equals("playing")){
      checkWinner();
    }
  }

  //adds a point to player
  void playerScores(){
    playerScore++;
    checkWinner();
  }

  //adds a point to computer
  void computerScores(){
    computerScore++;
    checkWinner();
  }

  //checks if someone has won
  void checkWinner(){
    if (playerScore >= winningScore || computerScore >= winningScore){
      gameState = "gameover";
    }
  }

  //restart game
  void restartGame(){
    startGame(difficulty);
  }

  //return to main menu
  void returnToMenu(){
    gameState = "menu";
  }

  //displays the current score
  void displayScore(){
    fill(255);
    textAlign(CENTER);
    textSize(30);
    text(playerScore, width / 4, 50);
    text(computerScore, width * 3 / 4, 50);
  }
}
