//global variable stuff
public int greenRoom = 0;
public int redRoom = 1;
public int purpleRoom = 2;
public float framerate = 60;
Physics p = new Physics();
Room coolRoom = new Room(p);
Color bobbyColor = new Color(37,38,39);
Player bobby = new Player(32,32,30,30, 8, bobbyColor, p);

PImage backgroundGreen1;
PImage backgroundGreen2;
PImage backgroundGreen3;
PImage backgroundGreen4;
PImage backgroundGreen5;
PImage backgroundGreen6;
PImage backgroundGreen7;
PImage backgroundGreen8;
PImage backgroundGreen9;
PImage backgroundGreen10;

PImage backgroundRed;
PImage backgroundPurple;
PImage sprite;


void setup(){  
  backgroundGreen1 = loadImage("backgroundGreen1.png");
  backgroundGreen2 = loadImage("backgroundGreen2.png");
  backgroundGreen3 = loadImage("backgroundGreen3.png");
  backgroundGreen4 = loadImage("backgroundGreen4.png");
  backgroundGreen5 = loadImage("backgroundGreen5.png");
  backgroundGreen6 = loadImage("backgroundGreen6.png");
  backgroundGreen7 = loadImage("backgroundGreen7.png");
  backgroundGreen8 = loadImage("backgroundGreen8.png");
  backgroundGreen9 = loadImage("backgroundGreen9.png");
  backgroundGreen10 = loadImage("backgroundGreen10.png");

  
   sprite = loadImage("wallTile_Red.png");
  //backgroundRed = loadImage("backgroundRed.png");
  //backgroundPurple = loadImage("backgroundPurple.png");
  
  size(480,480);
  frameRate(framerate);
  
}

 public void keyPressed() {
    if(key == 'w') {
      bobby.y -= bobby.speed;
      bobby.up = true;
      
      
    }
    if(key == 's') {
      bobby.y += bobby.speed;
      bobby.down = true;
    }
    if(key == 'd') {
      bobby.x += bobby.speed;
      bobby.right = true;
    }
    if(key == 'a') {
      bobby.x -= bobby.speed;
      bobby.left = true;
    }
  }

void draw(){
  
  coolRoom.run();
  bobby.display();
  //p.update();
}
