class Player {

// initializing vars
int playerX;
int playerY;
int playerW;
int playerH;

color fillColor;

int runSpeed;
int jumpSpeed;
int fallSpeed;

int topBound;
int bottomBound;
int leftBound;
int rightBound;

boolean isMovingLeft;    //when it is true, the player will move to the left
boolean isMovingRight;   //when it is true, the player will move to the right
boolean isJumping;      //when it is true, the player will be rising from a jump
boolean isFalling;      //when it is true, the player will be falling

int jumpHeight;     //the amount of distance the player moves up when the player jumps
int peakY;          //the y value the player will have when it reaches the top of its jump

int lives;

Player() {
  
  
  fillColor = color(250, 0);
  playerX = 100;
  playerY = 650;
  playerW = 50;
  playerH = 120;
  
  isMovingRight = false;
  isMovingLeft = false;
  isJumping = false;
  isFalling = false;

  runSpeed = 10;
  jumpSpeed = 10;
  fallSpeed = 10;
  peakY = 650;
  
  lives = 3;
  
  topBound = playerY - playerW/2;
  bottomBound = playerY + playerW/2;
  leftBound = playerX - playerW/2;
  rightBound = playerX + playerW/2;


}

void render(){
  rectMode(CENTER);
    fill(fillColor);
    rect(playerX, playerY, playerW, playerH);
}

void resetBoundaries(){
    topBound = playerY - playerW/2;
    bottomBound = playerY + playerW/2;
    leftBound = playerX - playerW/2;
    rightBound = playerX + playerW/2;
}

void move() {

    if (isFalling == true) {
      playerY = playerY + fallSpeed;
    }
    if (isJumping == true && playerY >= peakY) {
      playerY = playerY - jumpSpeed;
    }

    if (isMovingLeft == true && playerX >= 0) {
      playerX = playerX - runSpeed;
    }
    if (isMovingRight == true && playerX + playerW <= width) {
      playerX = playerX + runSpeed;
    }  
  
  
  }


void jump(){
   if(isJumping == true && isFalling == false){
    playerY = playerY - jumpSpeed; 
           println("isJumping");
   }

}

void reachedTopOfJump(){
 if(playerY >= peakY && isJumping == true){
  isJumping = false;
  isFalling = true;
 }
}

void landed(){
  if(playerY >= 650){
    isFalling = false;
  }
  
}

void collision(Enemies aEnemy) {
    if (leftBound  <  aEnemy.rightBound) {
      if (rightBound > aEnemy.leftBound) {
        if (topBound < aEnemy.bottomBound) {
          if (bottomBound > aEnemy.topBound) {

            lives = lives - 1;
           
          }
        }
      }
    }
    if (lives <= 0){
      state = 4;
  }
}

}
