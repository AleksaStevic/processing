ArrayList<Point> points = new ArrayList<Point>();
RegressionLine line = new RegressionLine(points);


void setup() {
  size(720, 720);
  background(0);
}

void draw() {
  clear();
  for(Point point : points) {
    point.draw();
  }
  
  if(points.size() > 1) {
    line.calculate();
    line.draw(0, width);
  }
}

void mousePressed() {
  
  Point point = new Point(mouseX, map(mouseY, 0, height, height, 0));
  points.add(point);
}
