class OrbSwitch extends GameObject{
  //public static boolean switchState = false;
 
  public OrbSwitch(int x, int y, Physics p){
    super(x, y, p);
    this.objectWidth = 14;
    this.objectHeight = 14;
    addCollider(new Collider(x+8, y+8, objectWidth, objectHeight));
  }
  
  void display(){
   image(orbSprite, xCord, yCord, 32, 32);
   update();
  }
  
  void update(){
     if(colliders.get(0).collidedObject  !=  null) {
       switchState = true;
       System.out.println("David is a loser");
     }
     
  }
  
} 
