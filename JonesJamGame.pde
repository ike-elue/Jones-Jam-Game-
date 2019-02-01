//global variable stuff
public int greenRoom = 0;
public int redRoom = 1;
public int purpleRoom = 2;
public int framerate = 60;
Physics p = new Physics();
Room coolRoom = new Room(p);
Color bobbyColor = new Color(37,38,39);
Player bobby = new Player(290,290,30,30,3, bobbyColor, p);

PImage backgroundGreen;
PImage backgroundRed;
PImage backgroundPurple;
PImage sprite;


void setup(){  
  backgroundGreen = loadImage("backgroundGreen.png");
   sprite = loadImage("wallTile_Red.png");
  //backgroundRed = loadImage("backgroundRed.png");
  //backgroundPurple = loadImage("backgroundPurple.png");
  
  size(480,480);
  frameRate(framerate);
  
}

 public void keyPressed() {
    if(key == 'W') {
      bobby.y -= bobby.speed;
      bobby.up = true;
    }
    if(key == 'S') {
      bobby.y += bobby.speed;
      bobby.down = true;
    }
    if(key == 'D') {
      bobby.x += bobby.speed;
      bobby.right = true;
    }
    if(key == 'A') {
      bobby.x -= bobby.speed;
      bobby.left = true;
    }
  }

void draw(){
  coolRoom.run();
  bobby.display();
}
