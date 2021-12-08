// className variableName
Player player;
Enemies enemies;
Sword sword;

//Array variables
//make the animation
Animation attackAnimation;

Animation slimeAnimation;

ArrayList<Platform> platformList;

// makes the array have 10 slots
PImage[] attackImages = new PImage[10];
PImage[] slimeImages = new PImage[6];

//enemy slime array variables
ArrayList<Enemies> enemyList;
ArrayList<Sword> swordList;


int state;

//Platform platform;

boolean isMovingLeft = false;
boolean isMovingRight = false;


// castle image background
PImage startImg;
PImage castleImg;
PImage castle2Img;
PImage idleImg;
PImage gameoverImg;

import processing.sound.*;

//declaring my sound var
SoundFile backgroundMusic;
SoundFile attackSound;
SoundFile jumpSound;

void setup(){
  size(1500, 800);
  
  // initialize the image
  castleImg = loadImage("Castle_Background.jpg");
  castle2Img = loadImage("Castle_Background2.jpg");
  startImg = loadImage("Start_Screen.png");
  gameoverImg = loadImage("Game_Over.png");
  // resizing my image
  castleImg.resize(1500, 800);
  castle2Img.resize(1500, 800);
  startImg.resize(1500, 800);
  gameoverImg.resize(1500, 800);
  
  idleImg = loadImage("Idle.png");
  idleImg.resize(100, 100);
  
  //background music values
  backgroundMusic = new SoundFile(this, "Background_music.mp3");
  backgroundMusic.amp(0.5);
  //attack sound values
  attackSound = new SoundFile(this, "Attack_sound.mp3");
  attackSound.amp(1.0);
  //jump sound values
  jumpSound = new SoundFile(this, "Jump_sound.mp3");
  jumpSound.amp(1.0);
  
  // initialize my array list
  platformList = new ArrayList<Platform>();
  
  // fill the array with images from the data folder
  for (int i = 0; i < attackImages.length; i++){
  attackImages[i] = loadImage("Attack"+i+".png");
  }
  // the first number is the frame rate and the second is the scale
   attackAnimation = new Animation(attackImages, 0.3, 7.0);
   
 // fill the array with images from the data folder
  for (int i = 0; i < slimeImages.length; i++){
  slimeImages[i] = loadImage("slime"+i+".png");
  }
  // the first number is the frame rate and the second is the scale
   slimeAnimation = new Animation(slimeImages, 0.3, 7.0);

  player = new Player();
  //enemies
  enemies = new Enemies (500, 690, 50, color(250, 0));
  Enemies e1 = new Enemies (300, 690, 50, color(250, 0));
  Enemies e2 = new Enemies (600, 690, 50, color(250, 0));
  Enemies e3 = new Enemies (700, 690, 50, color(250, 0));
  Enemies e4 = new Enemies (400, 690, 50, color(250, 0));

  enemyList = new ArrayList<Enemies>();
  if (enemyList.size() <= 4) {
    enemyList.add(e1);
    enemyList.add(e2);
    enemyList.add(e3);
    enemyList.add(e4);
    enemyList.add((enemies));
  } 
  
    swordList = new ArrayList<Sword>();

  
}

void draw(){
  
    switch(state) {
  case 0:
    background (startImg);
    textSize(70);
    text("Press SPACE To Start", width/2 - 300, height/2 + 90);
    break;

case 1:
    background (castleImg);
    textSize(50);
    fill(250);
    text("Kill all slimes to move to next room ", width/2 - 430, 780);
  
  if(backgroundMusic.isPlaying() == false){
  backgroundMusic.play();
  }
  
  player.render();
  player.move(); 
  player.jump();
  player.reachedTopOfJump();
  player.landed();
  player.resetBoundaries();
  // my enhanced for loop to go through my entire array list
  for(Platform aPlatform : platformList){
   aPlatform.render();
   aPlatform.isLandedOn();
  
  }
  if(platformList.size() <=3){
    platformList.add(new Platform());
  }
  
  attackAnimation.display(player.playerX + 30, player.playerY - 15);

  for (Enemies anEnemy : enemyList) {
    if (!anEnemy.isDead) {
      anEnemy.render();
      anEnemy.move(player);
      player.collision(anEnemy);
      //anEnemy.isHit(sword);
    }
  }
  slimeAnimation.display(enemies.enemyX, enemies.enemyY - 50);
  slimeAnimation.isAnimating = true;

for (Sword sword : swordList) {
    sword.render();
  }
  
  for (int i = enemyList.size()-1; i>=0; i--) {
    if (enemyList.get(i).isDead == true) {
      enemyList.remove(i);
    }
  }
 break;
  
  //case 2:
  //background (castle2Img);
  ////player.render();
  //player.move();
  //attackAnimation.display(player.playerX, player.playerY);

  //for (Enemies anEnemy : enemyList) {
  //  if (!anEnemy.isDead) {
  //    anEnemy.render();
  //    anEnemy.move(player);
  //    player.collision(anEnemy);
  //    for (Bullet aBullet : bulletList) {
  //      anEnemy.isHit(aSword);
  //    }
  //  }
  //}

  //for (Bullet aBullet : bulletList) {
  //  aBullet.render();
  //  aBullet.move();
  //  //aBullet.isHit(anEnemy);
  //}

  //for (int i = enemyList.size()-1; i>=0; i--) {
  //  if (enemyList.get(i).isDead == true) {
  //    enemyList.remove(i);
  //  }
  //}
  
  //break;

//case 3:
////player.render();
//  player.move();
//  attackAnimation.display(player.playerX, player.playerY);

//  for (Enemies anEnemy : enemyList) {
//    if (!anEnemy.isDead) {
//      anEnemy.render();
//      anEnemy.move(player);
//      player.collision(anEnemy);
//      for (Bullet aBullet : bulletList) {
//        anEnemy.isHit(aBullet);
//      }
//    }
//  }

//  for (Bullet aBullet : bulletList) {
//    aBullet.render();
//    aBullet.move();
//    //aBullet.isHit(anEnemy);
//  }

//  for (int i = enemyList.size()-1; i>=0; i--) {
//    if (enemyList.get(i).isDead == true) {
//      enemyList.remove(i);
//    }
//  }
//break;

case 4:
background(gameoverImg);
   textSize(70);
   fill(250);
   text("Press SPACE To Restart", width/2 - 320, height/2 + 90);

}

}

void keyPressed(){
  if(key == ' '){
    setup();
   state = 1; 
  }
  
  if (key == 'a') {
      player.isMovingLeft = true;
  }
  
  if (key == 'd') {
      player.isMovingRight = true;
  }
  
  if (key == 'w') {
     player.isJumping = true;
     if(player.isFalling == false){
     jumpSound.play();
     }
  }
  
  
}

void keyReleased(){
  if (key == 'a') {
      player.isMovingLeft = false;
  }
  
  if (key == 'd') {
      player.isMovingRight = false;
  }
  
  if (key == 'w') {
      player.isJumping = false;
      player.isFalling = true;
  }
  
}

void mousePressed(){
  attackAnimation.isAnimating = true;
  swordList.add(new Sword(player.playerX, player.playerY, 10, color(255)));
  attackSound.play();
  enemies.isPressed = true;

  
}
  
