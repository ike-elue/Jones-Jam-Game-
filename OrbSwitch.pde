class OrbSwitch extends GameObject{
 
 
  
  public OrbSwitch(int x, int y, Physics p){
    super(x, y, p);
    addCollider(new Collider(x, y, objectWidth, objectHeight));
  }
  
  void display(){
   image(orbSprite, xCord, yCord, objectHeight, objectWidth);
  }
  
} 
