//Declare variables
float ballX, ballY, ballWidth, ballHeight, speedX, speedY;
float playerOneX, playerOneY, paddleOneWidth, paddleOneHeight, paddleOneRadii, paddleOneSpeed;
float playerTwoX, playerTwoY, paddleTwoWidth, paddleTwoHeight, paddleTwoRadii, paddleTwoSpeed;
float playbtnX, playbtnY, playbtnWidth, playbtnHeight;
float restartX, restartY, restartW, restartH;

int scoreL = 0; 
int scoreR = 0;
int playerOneScore = 0;
int playerTwoScore = 0;
int play = 0;
int restart = 0;

boolean playerOneUp, playerOneDown, playerTwoUp, playerTwoDown; //Need it to be able to have two players
boolean gameStart;
boolean reStart;
boolean playerOneWins = false, 
        playerTwoWins = false;


PImage img,imagBtn,imgBoard, imagRestart;
PFont font;


//Initialize variable
void setup(){
  size(1280,720);
  
  frameRate(100);
  
  font = createFont("Kanit-Regular.ttf", 30);
  
  //ball
  ballX = width/2 - 50;
  ballY = height/2 +150;
  ballWidth = 100;
  ballHeight = 100;
  speedX = 0;
  speedY = 0;
  
  textSize(20);
 
 //play button size
  playbtnWidth = 100;
  playbtnHeight = 100;
  
  //reStar button size
  restartW = 75;
  restartH = 75;
  

  
  //player 1
  paddleOneWidth = 30;
  paddleOneHeight = 200;
  paddleOneRadii = 18;//round corners
  paddleOneSpeed = 5;
  
  //player 1 position
  playerOneX = 50;
  playerOneY = height/2 - paddleOneHeight/2;//placing it in the middle of the screen
  
 //player 2
  paddleTwoWidth = 30;
  paddleTwoHeight = 200;
  paddleTwoRadii = 18;//round corners
  paddleTwoSpeed = 5;
  
  //player 2 position
  playerTwoX = width -80;
  playerTwoY = height/2 - paddleTwoHeight/2;//placing it in the middle of the screen
  
  //ball image, button image, scoreboard image
  img = loadImage("ball.png");
  imagBtn = loadImage("btn.png");
  imgBoard = loadImage("scoreboard.png");
  imagRestart = loadImage("restart.png");
  
 
 
}

//Use variable
void draw(){
  
  background (10,80,100);
  drawLine();
  drawRec();
  drawCircle();
  drawCircle2();
  drawText();
  drawBall();
  moveBall();
  bounceBall();
  drawPaddles();
  movePaddles();
  stopPaddles();
  contactPaddles();
  scores();
  drawBall();
  if(!gameStart){
      playBtn();}
  if(!reStart){
      Restart();}
  gameOver();
 
 
}
  
void drawRec(){
  noFill();
  stroke(255);
  rect(100,50,1080,620); 
}

// White field frame
void drawLine(){
  stroke(126);
  noFill();
  line(640, 50, width/2, 670);
}

// big circle in middle of the field 
void drawCircle(){
  stroke(255);
  noFill();
  ellipse(640,360,450,450);
}

// small circle in middle of the field 
void drawCircle2(){
  stroke(255);
  strokeWeight(5);
  fill(10,80,100);
  ellipse(640,360,150,150);
  
}

//text in the middle of the screen
void drawText(){
  textSize(32);
  fill(0);   // Fill color black
  text("PONG", width/2-47, height/2);
  fill(126); // Fill color gray
  text("GA", width/2-47, height/2+27);
  fill(255); // Fill color white
  text("ME", width/2-3, height/2+27);
  
}


void drawBall(){
 
  image (img, ballX, ballY, ballWidth, ballHeight); 
  
}

void moveBall(){
  ballX = ballX + speedX;
  ballY = ballY + speedY;
}


void bounceBall(){
 
   if (ballX > width - ballWidth) {

    speedX = - speedX;
    scoreL = scoreL + 1;    
    } else if (ballX < 0 ){
     speedX = - speedX;
     scoreR = scoreR + 1; 
    }
   
    if( ballY > height - ballHeight || ballY < 0) {   
    speedY = - speedY;  
    }
 
}


// player 1 and 2
void drawPaddles(){
  fill(255);
  stroke(255);
  rect(playerOneX, playerOneY, paddleOneWidth, paddleOneHeight, paddleOneRadii);
  rect(playerTwoX, playerTwoY, paddleTwoWidth, paddleTwoHeight, paddleTwoRadii);
  
}


void movePaddles(){
  if (playerOneUp ==  true){ //short form to write this is if (playerOneUp){
    playerOneY -= paddleOneSpeed;
  }
    
  if (playerOneDown ==true){
    playerOneY += paddleOneSpeed;
  }   
  
   if (playerTwoUp ==true){ 
    playerTwoY -= paddleTwoSpeed;
  }
    
  if (playerTwoDown ==true){
    playerTwoY += paddleTwoSpeed;
  }   
}


void stopPaddles(){
  // Left paddle stop when reach top of screen
  if (playerOneY  < 0){
    playerOneY = playerOneY + paddleOneSpeed;
  }
  
  // Left paddle stop when reach bottom of screen
   if (playerOneY + paddleOneHeight > height){
     playerOneY  = playerOneY - paddleOneSpeed;
  }
  
  // Right paddle stop when reach top of screen
  if (playerTwoY  < 0){
     playerTwoY = playerTwoY + paddleTwoSpeed;
  }
  
  // Right paddle stop when reach bottom of screen
   if (playerTwoY + paddleTwoHeight > height){
     playerTwoY  = playerTwoY - paddleTwoSpeed;
  }

}


void contactPaddles(){
  if
  (ballX  < playerOneX + paddleOneWidth 
  && ballY < playerOneY + paddleOneHeight 
  && ballY + ballHeight > playerOneY){
    speedX = -speedX;
  }
  
   if
  (ballX  + ballWidth > playerTwoX 
  && ballY < playerTwoY + paddleTwoHeight 
  && ballY + ballHeight > playerTwoY){
    speedX = -speedX;
  }
  }
  
  
  
void scores(){
 image (imgBoard, width/2 - 100, 1, 200, 175);
  fill(10,80,100);
  text(scoreL, 580, 100);
  text(scoreR, width - 599, 100);
  
} 

void playBtn(){
  image (imagBtn, width/2 - 50, height/2 - 48, playbtnWidth , playbtnHeight); 
  
  if(mouseButton == LEFT 
    && mouseX > width/2  - playbtnWidth 
    && mouseX < width/2  + playbtnWidth 
    && mouseY > height/2 - playbtnHeight
    && mouseY < height/2 + playbtnHeight){
       speedX = 5;
       speedY = 5;
       gameStart = true;
    
     }
  
}

//size(1280,720);
//restart button
void Restart(){
  fill(255);
  textSize(15);
  text("Restart", width -70, height - 30, 75 , 75);
  image (imagRestart, 1200, 625, restartW , restartH);
  if(mouseButton == LEFT 
    && mouseX > width - 80
    && mouseX < width + restartW 
    && mouseY > height - restartH
    && mouseY < height - 5 ){
   
    speedX = 0;
    speedY = 0;
    ballX = width/2 + 250;
    ballY = height/2; 
    
    } else{

    } 
    
  
 }
  

//end of game ball, paddles stops
void gameOver(){

  if(scoreL == 2){
      playerOneWins = true;
  }
  if(scoreR == 2){
    playerTwoWins = true;
  }
  if(playerOneWins){
    fill(255);
    textFont(font);
    textSize(30);
    text("Player One Wins!", width/2 - 450, height/2 - 220); 
    playerOneScore = 0;
    playerTwoScore = 0;
    paddleOneSpeed = 0;
    paddleTwoSpeed = 0;
    speedX = 0;
    speedY = 0;
    ballX = width/2 + 250;
    ballY = height/2;
 
  }
  
  if(playerTwoWins){
    fill(255);
    textFont(font);
    textSize(30);
    text("Player Two Wins!", width/2 + 250, height/2 - 220); 
    playerOneScore = 0;
    playerTwoScore = 0;
    paddleOneSpeed = 0;
    paddleTwoSpeed = 0;
    speedX = 0;
    speedY = 0;
    ballX = width/2 + 250;
    ballY = height/2;

   
   
  }

}



//players control
void keyPressed(){
  if(key == 'w' || key == 'W'){
     playerOneUp = true;
  }
  if(key == 's' || key == 'S'){
    playerOneDown = true;
  }
  if(key == 'o' || key == 'O'){
    playerTwoUp = true;
  }
  if(key == 'l' || key == 'L'){
    playerTwoDown = true;
  }
}
 

void keyReleased(){
  if(key == 'w' || key == 'w'){
    playerOneUp = false;
  }
  
  if(key == 's' || key == 's'){
    playerOneDown = false;
  }
  
  if(key == 'o' || key == 'o'){
    playerTwoUp = false;
  }
  
  if(key == 'l' || key == 'l'){
    playerTwoDown = false;
  }
}




  
  
 
