class WallObject extends GameObject{
  
  public WallObject(int x, int y, Physics p){
    super(x, y, p);
    update();
  }
  
  public void update()
  {
    Collider c = new Collider(this.xCord , this.yCord, this.objectWidth, this.objectHeight);
    addCollider(c);
  }
  
  
  public void display(){
    image(sprite, xCord, yCord, objectHeight, objectWidth);
  }
  
  
  
}
