class Leaf {
  PVector position;
  PVector velocity;
  PVector acceleration;
  String[] imgNames = {"0.png", "1.png"};
  PImage[] leafImg = new PImage[imgNames.length];
  int size = 40;
  float lifespan;
  float decay;

  Leaf(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector();
    // loading sprites
    for (int i = 0; i < imgNames.length; i++) {
      String imgName = imgNames[i];
      leafImg[i] = loadImage(imgName);
    }
    lifespan = 300;
    decay = 1;
  }

  boolean fallen() {
    return lifespan < 0;
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }

  void update() {
    // update the leaf
    lifespan -= decay;

    velocity.add(acceleration);
    position.add(velocity);

    // stops leaf from going off screen
    if (position.y + size > height) {
      velocity.y = 0;
      position.y = height - size/2;
    }

    if (position.x + size > width) {
      lifespan = 0;
    }

    acceleration.mult(0);
  }

  void display() {
    // draw the leaf
    noStroke();
    fill(10, 150, 30);
    int img = int(random(0, 1));
    PImage image = leafImg[img];
    image(image, position.x, position.y, size, 30);
  }
}
