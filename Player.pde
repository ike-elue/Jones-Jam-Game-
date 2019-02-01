class Player {

  public int x, y;
  private int w, h;
  public int speed;
  private Color c;
  private boolean alive;
  private Collider collider;
  
  public boolean left, right, down, up;
  
  public Player(int x, int y, int w, int h, int speed, Color c, Physics p) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.c = c;
    collider = new Collider(x, y, w, h);
    p.addCollider(collider);
    left = false;
    right = false;
    down = false;
    up = false;
  }
  
  public void display() {
    collider.update(x, y);
    updateCollider();
    fill(c.r, c.g, c.b);
    rect(x, y, w, h);
    
    left = false;
    right = false;
    down = false;
    up = false;
  }
  
  public void updateCollider() {
    if(collider.collidedObject != null) {
      if(left)
        x = clamp(x, collider.collidedObject.getX() + collider.collidedObject.getWidth(), 480);
      if(right)
        x = clamp(x, 0, collider.collidedObject.getX());
      if(down)
        y  = clamp(y, collider.collidedObject.getY() + collider.collidedObject.getHeight(), 480);
      if(up)
        y = clamp(y, 0, collider.collidedObject.getY());
    }
  }
  
  public int clamp(int var, int minVar, int maxVar) {
    if(var < minVar)
      return minVar;
    if(var > maxVar)
      return maxVar;
    return var;
  }
  
  public int clamp(int var, double minVar, double maxVar) {
    if(var < minVar)
      return (int) minVar;
    if(var > maxVar)
      return(int) maxVar;
    return var;
  }
  
  public boolean isAlive() {
    return alive;
  }
  
  public void setAlive(boolean alive) {
    this.alive = alive;
  }
  
}
