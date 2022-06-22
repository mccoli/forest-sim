class Flower {
  PVector position;
  PVector velocity;
  PVector acceleration;
  PImage flowerImg;
  float lifespan;
  float decay;

  Flower(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector();
    flowerImg = loadImage("pink_flower.png");
    lifespan = 255;
    decay = 2;
  }

  void addForce(PVector f) {
    acceleration.add(f);
  }

  boolean expired() {
    return lifespan < 0;
  }

  void update() {
    lifespan -= decay;

    velocity.add(acceleration);
    position.add(velocity);

    if (position.y > height) {
      position.y = height;
      velocity.y *= -0.5;
    }

    acceleration.mult(0);
  }

  void display() { 
    pushMatrix();        
    translate(position.x, position.y);
    image(flowerImg, 0, 0, 20, 20);
    tint(255, lifespan);
    popMatrix();
  }
}
