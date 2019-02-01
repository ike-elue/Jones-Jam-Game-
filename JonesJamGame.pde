//global variable stuff
public int greenRoom = 0;
public int redRoom = 1;
public int purpleRoom = 2;
public int framerate = 60;
Physics p = new Physics();
Room coolRoom = new Room(p);
Color bobbyColor = new Color(37,38,39);
Player bobby = new Player(240.0,240.0, 30.0,30.0, 3, bobbyColor);

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

void draw(){
  coolRoom.run();
}
