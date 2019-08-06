import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch extends PApplet {



ArrayList<Bar> bars;

Random generator;

float deviation = 200;
float mean;

int barN = 100;
int barW;

float hInc = 5;

public void setup() {
  background(0);
  
  
  generator = new Random();
  bars = new ArrayList<Bar>();
  mean = width / 2;
  barW = width / barN;
  
  for(int i = 0; i < barN; i++) {
    bars.add(new Bar(i * barW));
  }
}

public void draw() {
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

public void keyPressed() {
  if(key == 'I' || key == 'i') {
    deviation += 5;
    reset();
  }
  
  if (key == 'K' || key == 'k') {
    deviation -= 5;
    reset();
  }
}

public void reset() {
  for(Bar bar : bars) {
    bar.h = 0;
  }
}

public void info() {
  String deviationStr = String.format("%.2f", deviation);
  text("To increase the deviation press [I] on your keyboard. To decrease press [K].", 10, 15);
  text("Current deviation value: " + deviationStr, 10, 35);
}
class Bar {
  float x;
  float h;
  
  Bar(float x) {
    this.x = x;
    this.h = 0;
  }
  
  public void update() {
    this.h += hInc;
  }
  
  public void draw() {
    fill(255);
    noStroke();
    rect(this.x, 0, barW, this.h);
  }
}
  public void settings() {  size(1000, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
