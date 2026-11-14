/*
-Controls the computer opponent paddle
-trakcs the balls vertical position
-moves the paddle towards the ball to block shots
-adjudjts movement (tracking speed) based on difficulty - easy mode = slow tracking, hard mode = quicker tracking
*/

class AI_Paddle extends Paddle{
  
  //inherit paddle class
  AI_Paddle(float x, float y, float speed){
   super(x, y, speed); 
    
  }
  
}
