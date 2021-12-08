// class

class Sword {

  // vars for bullets

  int swordX;
  int swordY;
  int swordD;

  color swordC;

  // hitbox vars
  int topBound;
  int bottomBound;
  int leftBound;
  int rightBound;

  
  
  
  boolean isDead = false;


  // constructor function
  Sword (int tempX, int tempY, int tempD, color tempC) {
    swordX = tempX;
    swordY = tempY;
    swordD = tempD;
    swordC = tempC;
    
    topBound = swordY - swordD/2;
    bottomBound = swordY +swordD/2;
    leftBound = swordX - swordD/2;
    rightBound = swordX + swordD/2;
  }

  void render() {
    fill(swordC);
    circle(swordX, swordY, swordD);
   
  }
  
}
