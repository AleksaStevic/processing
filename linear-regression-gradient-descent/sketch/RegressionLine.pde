class RegressionLine {
  
  
  float k;
  float n;
  ArrayList<Point> points;
  
  public RegressionLine(ArrayList<Point> points) {
    this.k = 0;
    this.n = 0;
    this.points = points;
  }
  
  public void calculate() {
    
    float learning_rate = 0.0000001f;
    
    for(Point point : points) {
      float guess = k * point.x + n;
      float error = point.y - guess;
      
      this.k += error * point.x * learning_rate;
      this.n += error * learning_rate; //<>//
      
    }
  }
  
  public void draw(int startX, int endX) {
    float startY = this.n + this.k * startX;
    float endY = this.n + this.k * endX;
    
    startY = map(startY, height, 0, 0, height);
    endY = map(endY, height, 0, 0, height);
    
    stroke(255);
    line(startX, startY, endX, endY);
  }
}
