class Player {

  float camX, camY;
  private float x, y;
  private float w, h;
  private float speed;
  private Color c;
  
  public Player(float x, float y, float w, float h, float speed, Color c) {
    this.camX = 0;
    this.camY = 0;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.c = c;
  }
  
  public void display() {
    move();
    fill(c.r, c.g, c.b);
    rect(x, y, w, h);
  }
  
  public void move() {
    x += speed;
    y += speed;
  }
  
}
