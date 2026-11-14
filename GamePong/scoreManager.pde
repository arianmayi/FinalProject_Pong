/*
-Keeps track of player and AI scores
-Awards points when a player misses the ball
-Displays the current score middle of screen (top of screen in the middle)
-Determines the winner when the score limit is reached (ideally a lower score threshold so the games arent too long)
*/

class ScoreManager 
{
  int playerScore;
  int aiScore;
  int winningScore;

  // constructor: starts a new match at 0-0
  ScoreManager() 
  {
    playerScore = 0;
    aiScore = 0;
    winningScore = 5;
  }

  // called when the AI misses the ball
  void pointForPlayer() 
  {
    if (!isGameOver()) 
    {
      playerScore++;
    }
  }

  // called when the player misses the ball
  void pointForAI() 
  {
    if (!isGameOver()) 
    {
      aiScore++;
    }
  }

  // displays the score at the top center
  void display() 
  {
    pushStyle();
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(32);
    text(playerScore + " - " + aiScore,
         width / 2.0, 45);
    popStyle();
  }

  // checks if either side reached 5 points
  boolean isGameOver() 
  {
    return playerScore >= winningScore ||
           aiScore >= winningScore;
  }

  // returns the winner of the match
  String getWinner() 
  {
    if (playerScore >= winningScore) 
    {
      return "Player Wins!";
    }
    if (aiScore >= winningScore) 
    {
      return "AI Wins!";
    }
    return "";
  }

  // resets the scores for a new game
  void reset() 
  {
    playerScore = 0;
    aiScore = 0;
  }

  // returns the player's current score
  int getPlayerScore() 
  {
    return playerScore;
  }

  // returns the AI's current score
  int getAIScore() 
  {
    return aiScore;
  }
}