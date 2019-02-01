class KeyObject extends GameObject{
  
  public KeyObject(int x, int y, Physics p){
    super(x, y, p);
  }
  
  public void display(){
    image(sprite, xCord, yCord, objectHeight, objectWidth);
  }
  
  
  
}
