import java.awt.Rectangle;

class Collider{
  private int xCord;
  private int yCord;
  private int collideWidth;
  private int collideHeight;
  public boolean isCollided;
  public Rectangle collidedObject;
  Rectangle collisionBox;
  
  public Collider(int x, int y, int w, int h)
  {
    xCord = x;
    yCord = y;
    collideWidth = w;
    collideHeight = h;
    isCollided = false;
    collidedObject = null;
    collisionBox = new Rectangle(x, y, w, h);
  }
  
  public void display() {
    rect(xCord, yCord, collideWidth, collideHeight);
  }
  
  public Rectangle getBox(){
    return collisionBox;
  }
  
  public void setX(int x){
    xCord = x;  
  }
  
  public void setY(int y){
    yCord = y;
  }
  
  public void setHeight(int h){
    collideHeight = h;
  }
  
  public void setWidth(int w){
    collideWidth = w;
  }
  
  public int getX(){
   return xCord; 
  }
  
  public int getY(){
   return yCord; 
  }
  
  public int getHeight(){
   return collideHeight; 
  }
  
  public int getWidth(){
   return collideWidth; 
  }
  
  
  public void update(int x, int y){
    xCord = x;
    yCord = y;
    collisionBox.setRect(xCord, yCord, collideWidth, collideHeight);
}

  public boolean getCollision(Rectangle r)
  {
    if (collisionBox.intersects(r)){
           System.out.println("Intersected");
           return collisionBox.intersects(r);
    }
    else
    {
           return false; 
    }
} //<>//
}
