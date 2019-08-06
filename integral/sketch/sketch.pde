float f(float x) {
  return sin(x);
}

void setup() {
  size(700, 700);
  background(0);
}

void draw() {
  clear();
  pushMatrix();
  translate(width / 2, height / 2);
  scale(width / 5, -height / 5);
  
  
  for(float x = -3; x < 3; x += 0.01) {
    point(x, f(x));
  }
  
  
  popMatrix();
  translate(width / 2, height / 2);
  stroke(255);
  line(-width / 2, 0, width / 2, 0);
  line(0, height / 2, 0, -height / 2);
  
}
