class Bird {
  
  PVector pos;
  PVector vel;
  PVector acc;

  Bird(PVector gravity) {
    this.pos = new PVector(100, height / 2);
    this.acc = gravity;
    this.vel = new PVector(0, 0);
  }
  
  void update() {
    this.vel.add(acc);
    this.pos.add(vel);
    
    this.draw();
  }
  
  void draw() {
    fill(255, 100, 100);
    noStroke();
    ellipse(pos.x, pos.y, 10, 10);
  }
  
  void addForce(PVector force) {
    this.vel = force;
  }
  
  boolean isTop() {
    return pos.y <= 0;
  }
  
  boolean isBottom() {
    return pos.y >= height;
  }
}
