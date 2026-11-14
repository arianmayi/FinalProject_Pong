/*
-represents a paddle in the pong game (real player's paddle)
-Handles vertical movement and drawing the paddle
-prevents the paddle from moving outside the screen (vertically - paddle should only be able to go up and down)
-Used by both the player and computer opponent (the AI paddle class will use this class)
*/

class Paddle{
 
  float x; // x pos
  float y; //y pos
  float paddle_width; // size of player paddle
  float paddle_Height; // height of paddle
  float speed; // how fast paddle moves vertically
  
  //constructor
  Paddle(float x, float y, float speed){
   this.x = x;
   this.y = y;
   this.speed = speed;
   
   //width & height
   paddle_width = 15;
   paddle_Height = 90;
  }
  
  //moves paddle vertically
  void move(float direction){
   y += direction * speed; 
   
   //keeps the paddle from leaving the screen
   y = constrain(y, 0, height - paddle_Height);
  }
  
  // draws paddle
  void display(){
   noStroke();
   fill(0, 200, 255);
   rect(x, y, paddle_width, paddle_Height, 4);
  }
  
  
  
}
