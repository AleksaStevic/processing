class Point {
  float x;
  float y;
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public void draw() {
    fill(255);
    noStroke();
    ellipse(this.x, map(this.y, 0, height, height, 0), 2, 2);
  }
}
