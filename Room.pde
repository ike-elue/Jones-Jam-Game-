class Room{
//private boolean active = true; //State of the room. true = time still counting down. False = room complete, time frozen. 
private float timer = 10;
private int roomType;
private Physics p;


private int[][] ezRoomLayout = {
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}, 
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1}, 
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,1,1,1,0,1,1,1,0,0,0,0,1},
      {1,0,0,0,0,1,0,1,0,1,0,0,0,0,1},
      {1,0,0,1,1,1,0,1,1,1,0,0,0,0,1},
      {1,0,0,0,0,1,0,1,0,1,0,0,0,0,1},
      {1,0,0,1,1,1,0,1,1,1,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1} };


private GameObject[][] roomLayout;




//------------------------------------------------------------------------------------------------
public Room(Physics p){ //default constructor is blank room
  roomType = 0; //default room type is green.
  this.p = p;
  roomLayout = convert2DArrayToObjects(ezRoomLayout);
}
//------------------------------------------------------------------------------------------------
public Room(int rT, GameObject[][] rL, Physics p){
  roomType = rT;
  roomLayout = rL;
  this.p = p;
}
//------------------------------------------------------------------------------------------------
void run(){ 
//  if (timer <= 0){   //Checks if time reaches zero. Kills player
//     bobby.setAlive(false);
//  }
  
  timer -= 1/framerate; //Counts down in a way so that no matter the framerate 10 in-game seconds = 10 real seconds
 // System.out.println(timer);
  if(roomType == 0){
    if(timer > 9){
      image(backgroundGreen1, 0, 0, 480,480);
    }
    else if(timer > 8){
      image(backgroundGreen2, 0, 0, 480,480);
    }
    else if(timer > 7){
      image(backgroundGreen3, 0, 0, 480,480);
    }
    else if(timer > 6){
      image(backgroundGreen4, 0, 0, 480,480);
    }
    else if(timer > 5){
      image(backgroundGreen5, 0, 0, 480,480);
    }
    else if(timer > 4){
      image(backgroundGreen6, 0, 0, 480,480);
    }
    else if(timer > 3){
      image(backgroundGreen7, 0, 0, 480,480);
    }
    else if(timer > 2){
      image(backgroundGreen8, 0, 0, 480,480);
    }
    else if(timer > 1){
      image(backgroundGreen9, 0, 0, 480,480);
    }
    else{
      image(backgroundGreen10, 0, 0, 480, 480);
    }
   }
  
  for(int i = 0; i < 15; i++){
   for(int j = 0; j < 15; j++){
    if(roomLayout[i][j] != null){
      roomLayout[i][j].display();
     }
    }
  }
  
 }
//------------------------------------------------------------------------------------------------
 public GameObject[][] convert2DArrayToObjects(int[][] thingy){
   GameObject[][] temp2DArray = new GameObject[15][15];
   for (int i = 0; i < 15; i++){
     for (int j = 0; j < 15; j++){
       if(thingy[j][i] != 0){
         if(thingy[j][i] == 1){
           GameObject object = new WallObject(32*i, 32*j, p);
           temp2DArray[j][i] = object;
         }
       }
     }
   }
   return temp2DArray;
 }
 
 
 
}
