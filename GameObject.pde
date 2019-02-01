abstract class GameObject{
  private int xCord;
  private int yCord;
  private int objectWidth;
  private int objectHeight;
  private Physics p;
  private ArrayList<Collider> colliders;
  
  public GameObject(int x, int y, Physics p) {
    xCord = x;
    yCord = y;
    objectWidth = 32;
    objectHeight = 32;
    this.p = p; 
    colliders = new ArrayList<>();
  }
  
  abstract void display()
  
  public void addCollider(Collider c) {
    colliders.add(c);
    p.addCollider(c);
  }
 
 
}
