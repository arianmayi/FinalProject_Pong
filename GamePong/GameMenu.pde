/*
-Displays the main menu and game buttons
-Allows players to start or quit the game
-Provides easy/hard difficulty
-Handles mouse clicks for menu selection ONLY
-GameMenu - Pong main menu and difficulty selection.
 */

class GameMenu 
{
  // 0 = main menu, 1 = difficulty selection.
  int menuScreen = 0;
  // 0 = Easy, 1 = Hard.
  int difficulty = 0;

  // button dimensions and positions are calculated relative to the window
  float buttonWidth = 160;
  float buttonHeight = 48;
  float buttonGap = 18;

  // constructor: creates the menu with its init main screen
  GameMenu() 
  {
    menuScreen = 0;
  }

  // display(): draws the appropriate menu screen every frame
  void display() 
  {
    background(12, 17, 34);
    drawBorder();
    if (menuScreen == 0) 
    {
      drawMainMenu();
    } else 
    {
      drawDifficultyMenu();
    }
  }

  // drawBorder(): draws the arcade-inspired border and center decoration
  void drawBorder() 
  {
    noFill();
    stroke(135, 122, 220);
    strokeWeight(3);
    rect(18, 18, width - 36, height - 36, 12);
    noStroke();
  }

  // drawMainMenu(): displays the game title and Start/Quit buttons.
  void drawMainMenu() 
  {
    fill(245);
    textAlign(CENTER, CENTER);
    textSize(64);
    text("PONG", width / 2.0, height * 0.24);

    // decorative paddles and ball to match the group's design mockup
    rectMode(CENTER);
    fill(60, 180, 255);
    rect(width * 0.28, height * 0.39, 9, 50);
    fill(255, 80, 105);
    rect(width * 0.72, height * 0.39, 9, 50);
    fill(255);
    ellipse(width / 2.0, height * 0.39, 12, 12);
    rectMode(CORNER);

    drawButton("Start", height * 0.59, color(39, 172, 88));
    drawButton("Quit", height * 0.59 + buttonHeight + buttonGap,
      color(102, 70, 163));
  }

  // drawDifficultyMenu(): displays easy, hard, and back buttons
  void drawDifficultyMenu() 
  {
    fill(245);
    textAlign(CENTER, CENTER);
    textSize(38);
    text("Select Difficulty", width / 2.0, height * 0.29);

    drawButton("Easy", height * 0.44, color(39, 172, 88));
    drawButton("Hard", height * 0.44 + buttonHeight + buttonGap,
      color(205, 68, 84));
    drawButton("Back", height * 0.44 + 2 * (buttonHeight + buttonGap),
      color(102, 70, 163));
  }

  // drawButton(): draws one centered button and highlights it on hover
  void drawButton(String label, float y, int buttonColor) 
  {
    float x = (width - buttonWidth) / 2.0;
    boolean hovering = isInsideButton(mouseX, mouseY, y);
    stroke(hovering ? color(255) : color(155, 147, 213));
    strokeWeight(hovering ? 3 : 1.5);
    fill(buttonColor);
    rect(x, y, buttonWidth, buttonHeight, 8);
    noStroke();
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(23);
    text(label, width / 2.0, y + buttonHeight / 2.0);
  }

  // isInsideButton(): checks whether a mouse position is inside a button
  boolean isInsideButton(float mx, float my, float y) 
  {
    float x = (width - buttonWidth) / 2.0;
    return mx >= x && mx <= x + buttonWidth &&
      my >= y && my <= y + buttonHeight;
  }

  // handleMouseClick(): processes a click and returns true only when the
  // player chooses a difficulty and is ready to enter gameplay
  boolean handleMouseClick(float mx, float my) 
  {
    if (menuScreen == 0) 
    {
      if (isInsideButton(mx, my, height * 0.59)) 
      {
        menuScreen = 1;
      } else if (isInsideButton(mx, my,
        height * 0.59 + buttonHeight + buttonGap)) 
        {
        exit();
      }
    } else 
    {
      float firstY = height * 0.44;
      if (isInsideButton(mx, my, firstY)) 
      {
        difficulty = 0;
        return true;
      } else if (isInsideButton(mx, my, firstY + buttonHeight + buttonGap)) {
        difficulty = 1;
        return true;
      } else if (isInsideButton(mx, my,
        firstY + 2 * (buttonHeight + buttonGap))) 
        {
        menuScreen = 0;
      }
    }
    return false;
  }

  // getDifficulty(): returns 0 for easy or 1 for hard
  int getDifficulty() 
  {
    return difficulty;
  }

  // reset(): returns to the main menu, e.g., after a finished game
  void reset() 
  {
    menuScreen = 0;
  }
}