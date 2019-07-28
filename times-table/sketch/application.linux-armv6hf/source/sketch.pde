int vertices = 20;
int verticesIncrease = 1;
float quotient = 2;
float qIncrease = 0.1;

int circleRadius = 300;

ArrayList<Point> points = new ArrayList<Point>();

void setup() {
  size(800, 800);
  calculatePoints();
  calculateLines();
  drawInfo();
}

void draw() {
  clear();
  background(50);
  
  drawInfo();
  
  translate(width/2, height/2);
  noFill();
  stroke(0);
  //ellipse(0, 0, circleRadius * 2, circleRadius * 2);
  
  for(Point point : points) {
    point.draw();
    point.drawLine(points);
  }
  
}

void keyPressed() {
  if(key == 'i' || key == 'I') {
    //Increase the number of vertices on the circle
    vertices += verticesIncrease;
    calculatePoints();
    calculateLines();
  }
  
  if((key == 'k' || key == 'K') && vertices - verticesIncrease > 0) {
    //Increase the number of vertices on the circle
    vertices -= verticesIncrease;
    calculatePoints();
    calculateLines();
  }
  
  if(key == 'U' || key == 'u') {
    //Increase the quotient by qIncrease
    quotient += qIncrease;
    calculateLines();
  }
  
  if((key == 'J' || key == 'j') && quotient - qIncrease > 0) {
    //Increase the quotient by qIncrease
    quotient -= qIncrease;
    calculateLines();
  }
}

void calculatePoints() {
  if(points.size() > 0) {
    points.clear();
  }
  
  float angle = TWO_PI / (float) vertices;
  for(int i = 0; i < vertices; i++) {
    points.add(new Point(circleRadius * sin(angle * i), circleRadius * cos(angle * i), i, vertices));
  }
}

void calculateLines() {
  for(Point point : points) {
    point.connectTo(quotient);
  }
}

void drawInfo() {
  
  String quotientStr = String.format("%.2f", quotient);
  textSize(15);
  text("To increase the number of dots press [I]. To decrease the number, press [K] on your keyboard.", 10, 15);
  text("To increase the quotient, press [U] key, to decrease it, press [J] key.", 10, 35);
  text("Current number of vertices: " + vertices, 10, 55);
  text("Current quotient value: " + quotientStr, 10, 75);
}
