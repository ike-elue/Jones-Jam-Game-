class collider extends component{
  private int xCord;
  private int yCord;
  private int collideWidth;
  private int collideHeight;
  private Rectangle collisionBox;
  
  public collider(int x, int y, int w, int h)
  {
    xCord = x;
    yCord = y;
    collideWidth = w;
    collideHeight = h;
    isCollided = false;
    collisionBox
  }
  
  public int getX(){
    return xCord;
  }
  
 
  
}
