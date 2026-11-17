//main sketch - runs the game
//connects all classes together
//Initalizes the game and runs the main draw loop including the GUI display
//handles keyboard and mouse input

GameManager game;
void setup(){
  size(800, 600);
  game = new GameManager();
}

void draw(){
  background(0);
  //update the game
  game.update();

  //display the GUI
  if (game.gameState.equals("menu")){
    drawMenu();
  }
  else if (game.gameState.equals("playing")){
    game.displayScore();
  }
  else if(game.gameState.equals("gameover")){
    drawGameOver();
  }
}

//display main menu
void drawMenu(){
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("PONG", width/2, 150);
  textSize(22);
  text("Press 1 for Easy", width/2, 300);
  text("Press 2 for Hard", width/2, 350);
}

//display game over screen

void drawGameOver(){
  fill(255);
  textAlign(CENTER);
  textSize(40);
  text("GAME OVER", width/2, 200);
  textSize(25);
  text("Player: " + game.playerScore, width/2, 300);
  text("Computer: " + game.computerScore, width/2, 340);
  textSize(20);
  text("Press R to Restart", width/2, 420);
  text("Press M for Menu", width/2, 460);
}

//handle keyboard input
void keyPressed(){
  if (game.gameState.equals("menu")){
    if (key == '1'){
      game.startGame("easy");
    }
    else if (key == '2'){
      game.startGame("hard");
    }
  }

  if (game.gameState.equals("gameover")){
    if (key == 'r' || key == 'R'){
      game.restartGame();
    }
    else if (key== 'm' || key == 'M'){
      game.returnToMenu();
    }
  }
}

//handle mouse input
void mousePressed() {
  if (game.gameState.equals("menu")){
    if (mouseY > 275 && mouseY < 325){
      game.startGame("easy");
    }
    else if (mouseY > 325 && mouseY < 375) {
      game.startGame("hard");
    }
  }
}
