class Room{
//private boolean active = true; //State of the room. true = time still counting down. False = room complete, time frozen. 
private float timer = 10;
private int roomType;
private Physics p;
private Room[] rooms;
private boolean doorsOpen;

// Map generation variables
  private int mapsize;
  private boolean[][] north, east, south, west, visited;
  private int wallSize;

private int[][] ezRoomLayout = {
      {1,1,1,1,1,1,1,2,1,1,1,1,1,1,1}, 
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1}, 
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,1,1,1,0,1,1,1,0,0,0,0,1},
      {1,0,0,0,0,1,0,1,0,1,0,0,0,0,1},
      {1,0,0,1,1,1,0,1,1,1,0,0,0,0,1},
      {1,0,0,0,0,1,0,1,0,1,0,0,0,0,1},
      {2,0,0,1,1,1,0,1,1,1,0,0,0,0,2},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,0,0,0,0,0,0,0,0,0,0,0,0,0,1},
      {1,1,1,1,1,1,1,2,1,1,1,1,1,1,1} };


private GameObject[][] roomLayout;




//------------------------------------------------------------------------------------------------
public Room(Physics p){ //default constructor is blank room
  roomType = 0; //default room type is green.
  this.p = p;
  //roomLayout = convert2DArrayToObjects(ezRoomLayout);
  mapsize = 9;
  wallSize = 32;
  roomLayout = createMaze();
  rooms = new Room[4];
  doorsOpen = false;
}
//------------------------------------------------------------------------------------------------
public Room(int rT, GameObject[][] rL, Physics p){
  roomType = rT;
  roomLayout = rL;
  this.p = p;
  rooms = new Room[4];
  doorsOpen = false;
  wallSize = 32;
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
  
  for(int i = 0; i < roomLayout.length; i++){
   for(int j = 0; j < roomLayout[i].length; j++){
    if(roomLayout[i][j] != null){
      roomLayout[i][j].display();
     }
    }
  }
  
  if(roomLayout[roomLayout.length - 1][roomLayout[0].length - 1].colliders.get(0).collidedObject != null) {
    randomSeed((int)random(100));
    roomLayout = createMaze();
    bobby.x = 32;
    bobby.y = 32;
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
         if(thingy[j][i] == 2) {
           GameObject object = new Door(32*i, 32*j, p);
           temp2DArray[j][i] = object;
         }
       }
     }
   }
   return temp2DArray;
 }
 
 private GameObject[][] createMaze() {
    initMaze();
    generateMaze();
    int size = 2 * mapsize + 2;
    boolean[][] actualMaze = new boolean[size][size];

    for (int y = 0; y < size; y++) {
      for (int x = 0; x < size; x++) {
        actualMaze[x][y] = true;
      }
    }
    actualMaze = produceMaze(actualMaze);
    return addObjects(actualMaze, size);
  }

  private void initMaze() {
    // initialize border cells as already visited
    visited = new boolean[mapsize][mapsize];
    for (int x = 0; x < mapsize; x++) {
      visited[x][0] = true;
      visited[x][mapsize - 1] = true;
    }
    for (int y = 0; y < mapsize; y++) {
      visited[0][y] = true;
      visited[mapsize - 1][y] = true;
    }

    // initialze all walls as present
    north = new boolean[mapsize][mapsize];
    east = new boolean[mapsize][mapsize];
    south = new boolean[mapsize][mapsize];
    west = new boolean[mapsize][mapsize];

    for (int y = 0; y < mapsize; y++) {
      for (int x = 0; x < mapsize; x++) {
        north[x][y] = true;
        east[x][y] = true;
        south[x][y] = true;
        west[x][y] = true;
      }
    }
  }

  private void generateMaze(int x, int y) {
    visited[x][y] = true;

    // while there is an unvisited neighbor
    while (!visited[x][y + 1] || !visited[x + 1][y] || !visited[x][y - 1] || !visited[x - 1][y]) {

      // pick random neighbor (could use Knuth's trick instead)
      while (true) {
        double r = random(4);
        if (r == 0 && !visited[x][y + 1]) {
          north[x][y] = false;
          south[x][y + 1] = false;
          generateMaze(x, y + 1);
          break;
        } else if (r == 1 && !visited[x + 1][y]) {
          east[x][y] = false;
          west[x + 1][y] = false;
          generateMaze(x + 1, y);
          break;
        } else if (r == 2 && !visited[x][y - 1]) {
          south[x][y] = false;
          north[x][y - 1] = false;
          generateMaze(x, y - 1);
          break;
        } else if (r == 3 && !visited[x - 1][y]) {
          west[x][y] = false;
          east[x - 1][y] = false;
          generateMaze(x - 1, y);
          break;
        }
      }
    }
  }

  // generate the maze starting from lower left
  private void generateMaze() {
    generateMaze(1, 1);
  }

  private boolean[][] produceMaze(boolean[][] actualMaze) {
    // North
    for (int y = 0; y < mapsize; y++) {
      for (int x = 0; x < mapsize; x++) {
        boolean isWall = north[x][y];
        int nX = 2 * (x + 1);
        int nY = 2 * (y + 1) + 1;
        actualMaze[nX][nY] = isWall;
      }
    }

    // South
    for (int y = 0; y < mapsize; y++) {
      for (int x = 0; x < mapsize; x++) {
        boolean isWall = south[x][y];
        int nX = 2 * (x + 1);
        int nY = 2 * (y + 1) - 1;
        actualMaze[nX][nY] = isWall;
      }
    }

    // West
    for (int y = 0; y < mapsize; y++) {
      for (int x = 0; x < mapsize; x++) {
        boolean isWall = west[x][y];
        int nX = 2 * (x + 1) - 1;
        int nY = 2 * (y + 1);
        actualMaze[nX][nY] = isWall;
      }
    }

    // East
    for (int y = 0; y < mapsize; y++) {
      for (int x = 0; x < mapsize; x++) {
        boolean isWall = east[x][y];
        int nX = 2 * (x + 1) + 1;
        int nY = 2 * (y + 1);
        actualMaze[nX][nY] = isWall;
      }
    }

    boolean[][] empties = new boolean[mapsize][mapsize];

    // Actual Empties
    for (int y = 0; y < mapsize; y++) {
      for (int x = 0; x < mapsize; x++) {
        boolean isWall = empties[x][y];
        int nX = 2 * (x + 1);
        int nY = 2 * (y + 1);
        actualMaze[nX][nY] = isWall;
      }
    }
    return actualMaze;
  }

  private GameObject[][] addObjects(boolean[][] actualMaze, int size) {
    GameObject[][] temp2DArray = new GameObject[size][size];
    for (int y = 3; y < size - 2; y++) {
      for (int x = 3; x < size - 2; x++) {
        if (actualMaze[x][y]) {
          int nX = (x - 3) * wallSize;
          int nY = (y - 3) * wallSize;
          GameObject object = new WallObject(nX, nY, p);
          temp2DArray[x][y] = object;
        }
      }
    }
    temp2DArray[temp2DArray.length - 1][temp2DArray[0].length - 1] = new OrbSwitch((temp2DArray.length - 7) * 32, (temp2DArray[0].length - 7) * 32, p);
    return temp2DArray;
  }
 
 
 
}
