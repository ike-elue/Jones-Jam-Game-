class WallObject extends GameObject{
  
  public WallObject(int x, int y, Physics p){
    super(x, y, p);
    addCollider(new Collider(x, y, objectWidth, objectHeight));
  }
  
  public void display(){
    image(sprite, xCord, yCord, objectHeight, objectWidth);
  }
  
  
  
}
