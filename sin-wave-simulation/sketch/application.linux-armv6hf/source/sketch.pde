int rectWidth = 0;
int rectNumber = 50;

float A = 100;
float B = 2;


float count = 0;
float countIncrement = 0.01;
float rStartPos = 0;

void setup() {
  size(1000, 500);
  count = 0;
  rStartPos = 0;
  rectWidth = width / rectNumber;
}

void draw() {
  clear();
  float phase = 0;
  float phaseIncrement = TWO_PI / rectNumber;
  for(int i = 0; i < rectNumber; i++) {
    rect(rStartPos + (i * rectWidth), height / 2, rectWidth,  A * sin(B * phase + count));
    phase += phaseIncrement;
  }
  
  count += countIncrement;
}
