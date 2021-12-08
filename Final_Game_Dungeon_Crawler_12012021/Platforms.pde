class Platform {
int x;
int y;

int w; //the width
int h; //the height
color aColor; //the color

int topBound; //the top boundary of the platform
int bottomBound; //the bottom boundary of the platform
int leftBound; //the left bound of the platform
int rightBound; //the right bound of the platform 
  
Platform(int tempX, int tempY, int tempW, int tempH, int aColor){
  
  x = tempX;
  y = tempY;

  w = tempW; //the width
  h = tempH; //the height
  aColor = color(193, 154, 107);
}

Platform(){
  x = int(random(50, width - w/2));
  y = int(random(300, 500));
  w = int(random(200, 300)); //the width
  h = 25; //the height
  aColor = color(193, 154, 107);;
  
}
void render(){
  fill(aColor);
    rect(x, y, w, h);
    
  }
  
void resetBoundaries(){
    topBound = y - w/2;
    bottomBound = y + w/2;
    leftBound = x - w/2;
    rightBound = x + w/2;
  
}

void isLandedOn(){
  if(topBound >= player.topBound){
    if(player.isFalling == true){
      player.isFalling = false;
    }
  }
  
}
  
  
  
}
