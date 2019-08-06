import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch extends PApplet {

int rectWidth = 0;
int rectNumber = 50;

float A = 100;
float B = 2;


float count = 0;
float countIncrement = 0.01f;
float rStartPos = 0;

public void setup() {
  
  count = 0;
  rStartPos = 0;
  rectWidth = width / rectNumber;
}

public void draw() {
  clear();
  float phase = 0;
  float phaseIncrement = TWO_PI / rectNumber;
  for(int i = 0; i < rectNumber; i++) {
    rect(rStartPos + (i * rectWidth), height / 2, rectWidth,  A * sin(B * phase + count));
    phase += phaseIncrement;
  }
  
  count += countIncrement;
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
