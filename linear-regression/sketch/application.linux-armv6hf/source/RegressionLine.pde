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
  
  float averageX() {
    float sum = 0;
    for(Point point : points) {
      sum += point.x;
    }
    
    return sum / points.size();
  }
  
  float averageY() {
    float sum = 0;
    for(Point point : points) {
      sum += point.y;
    }
    
    return sum / points.size();
  }
}
