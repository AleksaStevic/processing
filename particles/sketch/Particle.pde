float bounceForce = 5;

class Particle {
  
  float mass;
  float radius;
  
  PVector velocity;
  PVector acc;
  PVector pos;
  
  //ArrayList<Particle> alreadyCollided;
  
  Particle(float x, float y, float mass) {
    this.pos = new PVector(x, y);
    this.mass = mass;
    this.radius = 10 * this.mass;
    this.velocity = new PVector(0, 0);
    this.acc = new PVector(0, 0);
    //this.alreadyCollided = new ArrayList<Particle>();
  }
  
  void update() {
    
    this.acc = this.calculateAcc();
    this.velocity.add(acc);
    this.pos.add(velocity);
    
    //this.checkCollisions();
    
    this.draw();
  }
  
  void draw() {
    fill(255);
    noStroke();
    ellipse(this.pos.x, this.pos.y, this.radius, this.radius);
  }
  
  PVector calculateAcc() {
    PVector acc = new PVector(0, 0);
    
    for(Particle particle : particles) {
      if (particle != this) {
        float gravity = this.gravityBetween(particle);
        float accMag = gravity / this.mass;
        PVector myAcc = PVector.sub(particle.pos, this.pos);
        myAcc.setMag(accMag);
        acc.add(myAcc);
      }
    }
    
    return acc;
  }
  /*
  void checkCollisions() {
    
    for(Particle particle : particles) {
      if(particle != this) {
        
        if(this.isColliding(particle) && !alreadyCollided.contains(particle)) {
          
        }
      }
    }
  }*/
  
  boolean isColliding(Particle particle) {
    return PVector.dist(this.pos, particle.pos) <= this.radius / 2 + particle.radius / 2;
  }
  
  float gravityBetween(Particle particle) {
    
    float distance = this.pos.dist(particle.pos);
    
    distance = constrain(distance, 5, width > height ? width : height);
    if(distance == 0) {
      return 0;
    }
    return G * this.mass * particle.mass / sq(distance);
  }
}
