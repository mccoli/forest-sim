class FlowerBurst {
  PVector origin;
  ArrayList <Flower> flowers;
  int count;

  FlowerBurst(float x, float y, int c) {
    origin = new PVector(x, y);
    flowers = new ArrayList<Flower>();
    count = c;
  }

  void addForce(PVector f) {
    for (int i = 0; i < flowers.size(); i++) {
      flowers.get(i).addForce(f);
    }
  }

  void update() {
    if (count > 0) {
      // update the system
      flowers.add(new Flower(origin.x, origin.y));
      count--;
    }

    // remove dead particles
    for (int i = flowers.size()-1; i >= 0; i--) {
      if (flowers.get(i).expired()) {
        flowers.remove(i);
        //println("removing");
      }
    }

    // for every particle:  
    for (int i = 0; i < flowers.size(); i++) {
      Flower f = flowers.get(i);
      f.update();
      //println("updating");
    }
  }

  void display() {
    // draw the system  
    for (int i = 0; i < flowers.size(); i++) {
      Flower f = flowers.get(i);
      f.display();
      //println("displaying");
    }
  }
}
