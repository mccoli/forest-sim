class Canopy {
  PVector originTree;
  ArrayList<Leaf> leaves;
  int count;

  Canopy(float x, float y, int c) {
    originTree = new PVector(x, y);
    leaves = new ArrayList<Leaf>();
    count = c;
  }

  void applyForce(PVector f) {
    for (int i = 0; i < leaves.size(); i++) {
      leaves.get(i).applyForce(f);
    }
  }

  void update() {
    // add new leaves
    if (count > 0 ) {
      leaves.add(new Leaf(originTree.x, originTree.y));
      count--;
    }

    // remove dead particles
    for (int i = leaves.size()-1; i >= 0; i--) {
      if (leaves.get(i).fallen()) {
        leaves.remove(i);
      } 
    }

    // for every particle:  
    for (int i = 0; i < leaves.size(); i++) {
      Leaf l = leaves.get(i);
      l.update();
    }
  }

  void display() {
    // draw the system  
    for (int i = 0; i < leaves.size(); i++) {
      Leaf l = leaves.get(i);
      l.display();
    }
  }
}
