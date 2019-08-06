ArrayList<Particle> particles;

float G = 2; //Gravitational constant
int particleCount = 2;

void setup() {
  size(700, 700);
  background(0);
  //particles = createParticles();
  particles = new ArrayList<Particle>();
}

void draw() {
  clear();
  
  for(Particle particle : particles) {
    particle.update();
  }
  
  /*
  for(Particle first : particles) {
    for(Particle second : particles) {
      if(first != second) {
        if(first.isColliding(second)) {
          
        }
      }
    }
  } */
  
}

void mousePressed() {
  particles.add(new Particle(mouseX, mouseY, random(2, 5)));
}

ArrayList<Particle> createParticles() {
  ArrayList<Particle> particles = new ArrayList<Particle>();
  
  for(int i = 0; i < particleCount; i++) {
    particles.add(new Particle(random(0, width), random(0, height), random(2, 5)));
  }
  
  return particles;
}
