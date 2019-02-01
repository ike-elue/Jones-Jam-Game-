class Player {

  private float x, y;
  private float w, h;
  private float speed;
  private Color c;
  private boolean alive;
  private Collider collider;
  
  private boolean left, right, down, up;
  
  public Player(float x, float y, float w, float h, float speed, Color c, Physics p) {
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
    move();
    collider.update(x, y);
    updateCollider();
    fill(c.r, c.g, c.b);
    rect(x, y, w, h);
    
    left = false;
    right = false;
    down = false;
    up = false;
  }
  
  public void move() {
    if(key == 'W' && keyPressed == true) {
      y -= speed;
      up = true;
    }
    if(key == 'S' && keyPressed == true) {
      y += speed;
      down = true;
    }
    if(key == 'D' && keyPressed == true) {
      x += speed;
      right = true;
    }
    if(key == 'A' && keyPressed == true) {
      x -= speed;
      left = true;
    }
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
  
  public float clamp(float var, float minVar, float maxVar) {
    if(var < minVar)
      return minVar;
    if(var > maxVar)
      return maxVar;
    return var;
  }
  
  public boolean isAlive() {
    return alive;
  }
  
  public void setAlive(boolean alive) {
    this.alive = alive;
  }
  
}
