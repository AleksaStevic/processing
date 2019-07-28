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

int pointsNumber = 20;
int pointsIncrease = 1;
float quotient = 2;
float qIncrease = 0.1f;

int circleRadius = 300;

ArrayList<Point> points = new ArrayList<Point>();

public void setup() {
  
  calculatePoints();
  calculateLines();
  drawInfo();
}

public void draw() {
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

public void keyPressed() {
  if(key == 'i' || key == 'I') {
    //Increase the number of vertices on the circle
    pointsNumber += pointsIncrease;
    calculatePoints();
    calculateLines();
  }
  
  if((key == 'k' || key == 'K') && pointsNumber - pointsIncrease > 0) {
    //Increase the number of vertices on the circle
    pointsNumber -= pointsIncrease;
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

public void calculatePoints() {
  if(points.size() > 0) {
    points.clear();
  }
  
  float angle = TWO_PI / (float) pointsNumber;
  for(int i = 0; i < pointsNumber; i++) {
    points.add(new Point(circleRadius * sin(angle * i), circleRadius * cos(angle * i), i, pointsNumber));
  }
}

public void calculateLines() {
  for(Point point : points) {
    point.connectTo(quotient);
  }
}

public void drawInfo() {
  
  String quotientStr = String.format("%.2f", quotient);
  textSize(15);
  text("To increase the number of dots press [I]. To decrease the number, press [K] on your keyboard.", 10, 15);
  text("To increase the quotient, press [U] key, to decrease it, press [J] key.", 10, 35);
  text("Current number of vertices: " + pointsNumber, 10, 55);
  text("Current quotient value: " + quotientStr, 10, 75);
}
class Point {
  float x;
  float y;
  int value;
  int connectTo; //This is the value of another point which should be connected to this particular point by a line.
  int pointsNumber; //This holds the number of points, just like in the sketch tab.
  
  Point(float x, float y, int value, int pointsNumber) {
    this.x = x;
    this.y = y;
    this.value = value;
    this.pointsNumber = pointsNumber;
  }
  
  public void draw() {
    fill(255);
    noStroke();
    ellipse(x, y, 10, 10);
  }
  
  public void drawLine(ArrayList<Point> points) {
    stroke(0);
    Point connectPoint = points.get(connectTo);
    line(x, y, connectPoint.x, connectPoint.y);
  }
  
  public void connectTo(float quotient) {
    this.connectTo = floor(quotient * this.value) % pointsNumber;
  }
}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
