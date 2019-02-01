class Physics {
  
  private ArrayList<Collider> colliders;
  
  public Physics() {
    colliders = new ArrayList();
  }
  
  public void addCollider(Collider c){
    colliders.add(c);
  }
  
  public void update() {
    for(int i = 0; i < colliders.size(); i++) {
      colliders.get(i).collidedObject = null;
    }
    
    for(int i = 0; i < colliders.size(); i++) {
      for(int k = i; k < colliders.size(); k++) {
        if(colliders.get(i).getCollision(colliders.get(k).getBox())) {
          colliders.get(i).collidedObject = colliders.get(k).getBox();
          colliders.get(k).collidedObject = colliders.get(i).getBox();
        }
      }
    }
  }
}
