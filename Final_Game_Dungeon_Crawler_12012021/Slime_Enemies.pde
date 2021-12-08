// Class
class Enemies {

  // enemies var
  int enemyX;
  int enemyY;
  int enemyW;
  color enemyC;

  // player speed
  int enemySpeed;


  // hitboxes
  int topBound;
  int bottomBound;
  int rightBound;
  int leftBound;

  boolean isPressed = false;
  boolean isDead = false;


  int enemylife;
  
  PImage pic;

  // constructor function
  Enemies(int tempX, int tempY, int tempW, color tempC) {
    enemyX = tempX;
    enemyY = tempY;
    enemyW = tempW;
    enemyC = tempC;

    enemySpeed = 1;


    topBound = enemyY - enemyW/2;
    bottomBound = enemyY +enemyW/2;
    leftBound = enemyX - enemyW/2;
    rightBound = enemyX + enemyW/2;
    
  }


  // render player
  void render() {
    fill(enemyC);
    circle(enemyX, enemyY, enemyW);
  }

  //void isHit(Sword sword) {
  //  if (sword.topBound > topBound) {
  //    if (sword.bottomBound < bottomBound) {
  //      if (sword.rightBound < rightBound) {
  //        if (sword.leftBound > leftBound) {
  //          isDead = true;
  //        }
  //      }
  //    }
  //  }
  //}
    
  


  // Following player
  void move(Player aPlayer) {
    topBound = enemyY - enemyW/2;
    bottomBound = enemyY +enemyW/2;
    leftBound = enemyX - enemyW/2;
    rightBound = enemyX + enemyW/2;

    if (aPlayer.playerX < enemyX) {
      enemyX = enemyX - enemySpeed;
    }

    if (aPlayer.playerX > enemyX) {
      enemyX = enemyX + enemySpeed;
    }
  }
}
