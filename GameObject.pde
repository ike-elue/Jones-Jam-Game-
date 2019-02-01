abstract class GameObject{
  public int xCord;
  public int yCord;
  public int objectWidth;
  public int objectHeight;
  public Physics p;
  public ArrayList<Collider> colliders;
  
  public GameObject(int x, int y, Physics p) {
    xCord = x;
    yCord = y;
    objectWidth = 32;
    objectHeight = 32;
    this.p = p; 
    colliders = new ArrayList<Collider>();
  }
  
  abstract void display();
  
  public void addCollider(Collider c) {
    colliders.add(c);
    p.addCollider(c);
  }
 
 
}
