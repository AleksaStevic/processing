class Point {
  float x;
  float y;
  int value;
  int connectTo; //This is the value of another point which should be connected to this particular point by a line.
  int vertices; //This holds the number of points, just like in the sketch tab.
  
  Point(float x, float y, int value, int vertices) {
    this.x = x;
    this.y = y;
    this.value = value;
    this.vertices = vertices;
  }
  
  public void draw() {
    fill(255);
    noStroke();
    ellipse(x, y, 10, 10);
  }
  
  public void drawLine(ArrayList<Point> points) {
    stroke(0);
    line(x, y, points.get(connectTo).x, points.get(connectTo).y);
  }
  
  public void connectTo(float quotient) {
    this.connectTo = floor(quotient * this.value) % vertices;
  }
}
