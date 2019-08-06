float seekerX;
float seekerY;

float factor = 0.1;

void setup() {
  size(800, 800);
  background(0);
  
  seekerX = width / 2;
  seekerY = height / 2;
}

void draw() {
  clear();
  fill(255);
  noStroke();
  
  seekerX = lerp(seekerX, mouseX, factor);
  seekerY = lerp(seekerY, mouseY, factor);
  
  ellipse(seekerX, seekerY, 40, 40);
}
