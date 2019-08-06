import java.util.Random;

ArrayList<Bar> bars;

Random generator;

float deviation = 200;
float mean;

int barN = 100;
int barW;

float hInc = 5;

void setup() {
  background(0);
  size(1000, 500);
  
  generator = new Random();
  bars = new ArrayList<Bar>();
  mean = width / 2;
  barW = width / barN;
  
  for(int i = 0; i < barN; i++) {
    bars.add(new Bar(i * barW));
  }
}

void draw() {
  clear();
  info();
  translate(0, height);
  scale(1, -1);
  
  float h = (float) generator.nextGaussian();
  h *= deviation;
  h += mean;
  
  for(Bar bar : bars) {
    if(bar.x <= h && h <= bar.x + barW) {
      bar.update();
    }
    bar.draw();
  }
}

void keyPressed() {
  if(key == 'I' || key == 'i') {
    deviation += 5;
    reset();
  }
  
  if (key == 'K' || key == 'k') {
    deviation -= 5;
    reset();
  }
}

void reset() {
  for(Bar bar : bars) {
    bar.h = 0;
  }
}

void info() {
  String deviationStr = String.format("%.2f", deviation);
  text("To increase the deviation press [I] on your keyboard. To decrease press [K].", 10, 15);
  text("Current deviation value: " + deviationStr, 10, 35);
}
