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

ArrayList<Point> points = new ArrayList<Point>();
RegressionLine line = new RegressionLine(points);


public void setup() {
  
  background(0);
}

public void draw() {
  clear();
  for(Point point : points) {
    point.draw();
  }
  
  if(points.size() > 1) {
    line.draw(0, 720);
  }
}

public void mousePressed() {
  
  Point point = new Point(mouseX, map(mouseY, 0, height, height, 0));
  points.add(point);
  line.calculate();
}
class Point {
  float x;
  float y;
  
  public Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  public void draw() {
    fill(255);
    noStroke();
    ellipse(this.x, map(this.y, 0, height, height, 0), 2, 2);
  }
}
class RegressionLine {
  
  
  float k;
  float n;
  ArrayList<Point> points;
  
  public RegressionLine(ArrayList<Point> points) {
    this.k = 1;
    this.n = 0;
    this.points = points;
  }
  
  public void calculate() {
    float barX = this.averageX();
    float barY = this.averageY();
    
    float upSum = 0;
    float downSum = 0;
    for(Point point : points) {
      upSum += (point.x - barX) * (point.y - barY);
      downSum += sq(point.x - barX);
    }
    
    this.k = upSum / downSum;
    this.n = barY - this.k * barX;
  }
  
  public void draw(int startX, int endX) {
    float startY = this.n + this.k * startX;
    float endY = this.n + this.k * endX;
    
    startY = map(startY, height, 0, 0, height);
    endY = map(endY, height, 0, 0, height);
    
    stroke(255);
    line(startX, startY, endX, endY);
  }
  
  public float averageX() {
    float sum = 0;
    for(Point point : points) {
      sum += point.x;
    }
    
    return sum / points.size();
  }
  
  public float averageY() {
    float sum = 0;
    for(Point point : points) {
      sum += point.y;
    }
    
    return sum / points.size();
  }
}
  public void settings() {  size(720, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
