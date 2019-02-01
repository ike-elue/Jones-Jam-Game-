class WallObject extends GameObject{
  private int xCord;
  private int yCord;
  private int objectWidth;
  private int objectHeight;
  private Physics p;
  private ArrayList<Collider> colliders;
  
  PImage sprite;
  sprite = load('WallTile_Red.png')
  
  public WallObject(int x, int y, Physics p){
    super(x, y, p);
    objectWidth = 32;
    objectHeight = 32
  }
  
  public void display(){
    image(sprite, xCord, yCord, objectHeight, objectWidth);
  }
  
  
}
