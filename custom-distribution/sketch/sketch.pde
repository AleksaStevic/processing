ArrayList<Bar> bars;

float hInc = 10;

float barN = 200;
float barW;

float distFunc(float x) {
  return x * x;
}

void setup() {
  frameRate(120);
  size(800, 800);
  background(0);
  
  bars = new ArrayList<Bar>();
  
  barW = width / barN;
  
  for(int i = 0; i < barN; i++) {
    bars.add(new Bar(i * barW));
  }
}

void draw() {
  clear();
  //info();
  translate(0, height);
  scale(1, -1);
  
  float h = randomNumber();
  
  h = map(h, 0, 1, 0, width);
  
  for(Bar bar : bars) {
    if(bar.x <= h && h <= bar.x + barW) {
      bar.update();
    }
    bar.draw();
  }
  
}

void info() {
  
}

float randomNumber() {
  
  boolean found = false;
  int hack = 0;
  while(!found && hack < 10000) {
    float r1 = random(1);
    float r2 = random(1);
    float y = distFunc(r1);
    
    if(r2 < y) {
      found = true;
      return r1;
    }
    
    hack++;
  }
  
  return 0;
}
