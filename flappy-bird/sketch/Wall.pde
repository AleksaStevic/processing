class Wall {
  
  PVector pos;
  
  float w;
  float h;
  float gap;
  
  Wall(float wallWidth) {
    this.w = wallWidth;
    this.h = random(100, height / 2);
    this.gap = height / 3;
    this.pos = new PVector(width, 0);
  }
  
  void update() {
    
    this.pos.add(new PVector(-gameSpeed, 0));
    this.draw();
  }
  
  void draw() {
    fill(255);
    noStroke();
    
    rect(pos.x, 0, w, h);
    rect(pos.x, gap + h, w, height - gap - h);
    
  }
  
}
