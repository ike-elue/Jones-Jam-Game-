class Room{
private int roomX = 0;
private int roomY = 0;
private boolean active = true; //State of the room. true = time still counting down. False = room complete, time frozen. 
private float timer = 10;
private int roomType;
private int roomWidth;
private int roomHeight;
public static Physics p;


private int[][] ezRoomLayout = {
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}, 
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1}, 
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1} };


private GameObject[][] roomLayout;





public Room(){ //default constructor is blank room
  roomType = 0; //default room type is green.
  roomWidth = 15;
  roomHeight = 15;
  roomLayout = convert2DArrayToObjects(ezRoomLayout);
  
  
  //new GameObject[roomWidth][roomHeight]; //creates blank room (0)
  
  //objects = new ArrayList<GameObject>(roomWidth);
  //objects2 = new ArrayList<ArrayList>(roomHeight);
}

public Room(int rT, GameObject[][] rL){
  roomType = rT;
  roomLayout = rL;
}

void run(){ 
  if (timer <= 0){   //Checks if time reaches zero. Kills player
     bobby.setAlive(false);
  }
  
  timer -= 10/framerate; //Counts down in a way so that no matter the framerate 10 in-game seconds = 10 real seconds
  
  if(roomType == greenRoom){
    image(backgroundGreen, 0, 0, 480,480);
  }
  else if (roomType == redRoom){
    image(backgroundRed, 0, 0, 480,480);
  }
  else{
    image(backgroundPurple, 0, 0, 480,480);
  }
  
  
  for(int i = 0; i < roomWidth; i++){
   for(int j = 0; j < roomHeight; j++){
    if(roomLayout[i][j] != null){
      roomLayout[i][j].display();
     }
    }
  }
  
 }
 
 public GameObject[][] convert2DArrayToObjects(int[][] thingy){
   GameObject[][] temp2DArray;
   for (int i = 0; i < 15; i++){
     for (int j = 0; j < 15; j++){
       if(thingy[i][j] != 0){
         if(thingy[i][j] == 1){
           GameObject object = new GameObject(32*i, 32*j, p);
           temp2DArray[i][j] = object;
         }
       }
     }
   }
   return temp2DArray;
 }
 
 
 
}
