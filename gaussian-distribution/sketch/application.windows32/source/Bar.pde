class Bar {
  float x;
  float h;
  
  Bar(float x) {
    this.x = x;
    this.h = 0;
  }
  
  void update() {
    this.h += hInc;
  }
  
  void draw() {
    fill(255);
    noStroke();
    rect(this.x, 0, barW, this.h);
  }
}
