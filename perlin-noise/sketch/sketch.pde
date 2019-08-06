float timeX;
float timeY;

float incX;
float incY;

float offset = 0;

void setup() {
  size(200, 200);
  noSmooth();
  background(0);
  timeX = 0;
  timeY = 0;
  incX = 0.1;
  incY = 0.1;
}

void draw() {
  timeY = 0;
  for(int i = 0; i < width; i++) {
    timeX = 0;
    for(int j = 0; j < height; j++) {
      stroke(map(noise(offset + timeX, offset + timeY), 0, 1, 0, 255));
      point(i,j);
      timeX += incX;
    }
    timeY += incY;
  }
  offset += 0.1;
}
