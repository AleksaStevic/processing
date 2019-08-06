ArrayList<Wall> walls;

float wallWidth = 30;
float gameSpeed = 3;
float gameAcc = 0;

int canIJump = 100;

PVector gravity = new PVector(0, 0.1);

Bird bird;

void setup() {
  size(1000, 700);
  background(0);
  noStroke();
  
  walls = new ArrayList<Wall>();
  
  bird = new Bird(gravity);
}

void draw() {
  clear();
  if(frameCount % 200 == 0) {
    createWall();
  }
  
  bird.update();
  
  for(Wall wall : walls) {
    wall.update();
  }
  
  canIJump++;
  gameSpeed += gameAcc;
}

void keyPressed() {
  if ((key == 'W' || key == 'w')) {
    bird.addForce(new PVector(0, -5));
    canIJump = 0;
  }
}

void createWall() {
  Wall wall = new Wall(wallWidth);
  walls.add(wall);
}
