class Room{
private int roomX = 0;
private int roomY = 0;



private int roomWidth;
private int roomHeight;

private GameObject[][] roomLayout;




public Room(){ //default constructor is blank room
  roomWidth = 15;
  roomHeight = 15;
  roomLayout = new GameObject[roomWidth][roomHeight]; //creates blank room (0)
  
  //objects = new ArrayList<GameObject>(roomWidth);
  //objects2 = new ArrayList<ArrayList>(roomHeight);
}

public Room(int[][] rL){
  roomLayout = rL;
}

void run(){
  for(int i = 0; i < roomWidth; i++){
   for(int j = 0; j < roomHeight; j++){
    if(roomLayout[i][j] != null){
      roomLayout[i][j].display();
     }
    }
  }
  
 }
 
 
 
 
 
}
