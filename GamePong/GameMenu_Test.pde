GameMenu menu;
boolean gameStarted = false;

void setup() 
{
  size(800, 600);
  menu = new GameMenu();
}

void draw() 
{
  if (!gameStarted) 
  {
    menu.display();
  } else {
    background(12, 17, 34);
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Gameplay placeholder - " +
      (menu.getDifficulty() == 0 ? "Easy" : "Hard"),
      width/2, height/2);

    textSize(17);
    text("Press M to return to menu",
      width/2, height/2 + 50);
  }
}

void mousePressed() 
{
  if (!gameStarted &&
      menu.handleMouseClick(mouseX, mouseY)){
    gameStarted = true;
  }
}

void keyPressed() {
  if (key == 'm' || key == 'M') 
  {
    gameStarted = false;
    menu.reset();
  }
}
