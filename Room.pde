class Room{
private int roomX = 0;
private int roomY = 0;


private int roomType;
private int roomWidth;
private int roomHeight;

private GameObject[][] roomLayout;




public Room(){ //default constructor is blank room
  roomType = 0; //default room type is green.
  roomWidth = 15;
  roomHeight = 15;
  roomLayout = new GameObject[roomWidth][roomHeight]; //creates blank room (0)
  
  //objects = new ArrayList<GameObject>(roomWidth);
  //objects2 = new ArrayList<ArrayList>(roomHeight);
}

public Room(int rT; GameObject[][] rL){
  roomType = rt;
  roomLayout = rL;
}

void run(){
  if(roomType == greenRoom){
    image(backgroundGreen, roomX, roomY, 480,480);
  }
  else if (roomType == redRoom){
    image(backgroundRed, roomX, roomY, 480,480);
  }
  else{
    image(backgroundPurple, roomX, roomY, 480,480);
  }
  
  
  for(int i = 0; i < roomWidth; i++){
   for(int j = 0; j < roomHeight; j++){
    if(roomLayout[i][j] != null){
      roomLayout[i][j].display();
     }
    }
  }
  
 }
 
 
 
 
 
}
