class Point {
  float x;
  float y;
  int value;
  int connectTo; //This is the value of another point which should be connected to this particular point by a line.
  int pointsNumber; //This holds the number of points, just like in the sketch tab.
  
  Point(float x, float y, int value, int pointsNumber) {
    this.x = x;
    this.y = y;
    this.value = value;
    this.pointsNumber = pointsNumber;
  }
  
  public void draw() {
    fill(255);
    noStroke();
    ellipse(x, y, 10, 10);
  }
  
  public void drawLine(ArrayList<Point> points) {
    stroke(0);
    Point connectPoint = points.get(connectTo);
    line(x, y, connectPoint.x, connectPoint.y);
  }
  
  public void connectTo(float quotient) {
    this.connectTo = floor(quotient * this.value) % pointsNumber;
  }
}
