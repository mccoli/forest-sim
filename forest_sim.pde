ArrayList<Canopy> canopies;
ArrayList<FlowerBurst> bursts;

PVector gravity;
PVector wind;
float xoff = 0.0;

PImage treeImg;

void setup() {
  size(600, 600);

  canopies = new ArrayList<Canopy>();
  bursts = new ArrayList<FlowerBurst>();

  gravity = new PVector(0, 0.02);
  wind = new PVector(0.01, 0);
  
  treeImg = loadImage("tree.png");
}

void draw() {
  background(121, 206, 219);
  
  // trees
  image(treeImg, 20, 0, 300, 600);
  image(treeImg, 400, 0, 300, 600);

  for (int i = 0; i < 1; i += 1) {
    canopies.add(new Canopy(random(20, width-20), 0, 1));
  }

  for (Canopy c : canopies) {
    c.applyForce(gravity);

    for (float i = 0; i < 1; i += 0.01) {
      xoff += 0.01;
      float xoffset = noise(xoff) / 20;
      wind.x = xoffset;
    }
    c.applyForce(wind);    
    c.update();
    c.display();
  }

  for (FlowerBurst b : bursts) {
    b.addForce(gravity);
    b.update();
    b.display();
  }
}

void mousePressed() {
  bursts.add(new FlowerBurst(mouseX, mouseY, 20));
}

void keyPressed() {
  if (key == 's') {
    setup();
  }

  if (key == 'w') {
    for (Canopy c : canopies) {
      wind.x = -5.5;
      c.applyForce(wind);
      wind.x = 0.01;
    }
  }
}
