// By, Nathan Rusk
// Modified version of Happy Bird by Gaspar Coding
// Inspired by the original Flappy Bird

PImage background, pterodactyl, vines, longneck, startScreen;
int game, score, highscore, x, y, vertical, wallx[] = new int[2], wally[] =new int[2];
void setup() {
   background =loadImage("https://github.com/nrusk/Project-Images/blob/main/Game%20Assets/background.png?raw=true");
   pterodactyl =loadImage("https://github.com/nrusk/Project-Images/blob/main/Game%20Assets/pterodactyl.png?raw=true");
   vines =loadImage("https://github.com/nrusk/Project-Images/blob/main/Game%20Assets/vines.png?raw=true");
   longneck =loadImage("https://github.com/nrusk/Project-Images/blob/main/Game%20Assets/longneck.png?raw=true");
   startScreen=loadImage("https://github.com/nrusk/Project-Images/blob/main/Game%20Assets/startScreen.png?raw=true");
   game = 1; score = 0; highscore = 0; x = -200; vertical = 0; 
  size(600,800);
  fill(0,0,0);
  textSize(20);  
}
void draw() { 
  if(game == 0) {
    imageMode(CORNER);
    image(background, x, 0);
    image(background, x+background.width, 0);
    x -= 5;
    vertical += 1;
    y += vertical;
    if(x == -1800) x = 0;
    for(int i = 0 ; i < 2; i++) {
      imageMode(CENTER);
      image(vines, wallx[i], wally[i] - (vines.height/2+100));
      image(longneck, wallx[i], wally[i] + (longneck.height/2+100));
      if(wallx[i] < 0) {
        wally[i] = (int)random(200,height-200);
        wallx[i] = width;
      }
      if(wallx[i] == width/2) highscore = max(++score, highscore);
      if(y>height||y<0||(abs(width/2-wallx[i])<25 && abs(y-wally[i])>100)) game=1;
      wallx[i] -= 6;
    }
    image(pterodactyl, width/2, y);
    text("Score: "+score, 10, 20);
  }
  else {
    imageMode(CENTER);
    image(startScreen, width/2,height/2);
    text("High Score: "+highscore, 95, 130);
  }
}
void mousePressed() {
  vertical = -15;
  if(game==1) {
    wallx[0] = 600;
    wally[0] = y = height/2;
    wallx[1] = 900;
    wally[1] = 600;
    x = game = score = 0;
  }
}
