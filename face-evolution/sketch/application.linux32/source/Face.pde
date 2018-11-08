class Face {
  
  DNA dna;
  int index;
  int w;
  float x;
  float y = 5;
  float fitness = 1;
  
  Face(int index) {
    this.index = index;
    this.w = floor(width/10);
    this.x = this.w * this.index;
    
    float[] genes = new float[21];
    for (int i = 0; i < 21; i++)
    {
      genes[i] = random(1);
    }
    
    this.dna = new DNA(genes);
  }
  
  Face(int index, DNA dna) {
     this(index);
     this.dna = dna;
  }
  
  void show() {
    float cx = this.x + this.w/2;
    float cy = this.y + this.w/2;
    float cr = map(this.dna.genes[2], 0, 1, 40, this.w);
    float ccr = map(this.dna.genes[3], 0, 1, 0, 255);
    float ccg = map(this.dna.genes[4], 0, 1, 0, 255);
    float ccb = map(this.dna.genes[5], 0, 1, 0, 255);
    
    float er = map(this.dna.genes[13], 0, 1, 5, 15);
    float e1x = map(this.dna.genes[6], 0, 1, this.x + this.w/2 - cr/2, this.x + this.w/2 + cr/2);
    float e1y = /*this.y + this.w/2 - cr/6;*/map(this.dna.genes[7], 0, 1, this.y + this.w/2 - cr/6, this.y + this.w/2 - cr/4);
    float e2x = map(this.dna.genes[8], 0, 1, this.x + this.w/2 - cr/2, this.x + this.w/2 + cr/2);
    float e2y = /*this.y + this.w/2 - cr/6;*/map(this.dna.genes[9], 0, 1, this.y + this.w/2 - cr/6, this.y + this.w/2 - cr/4);
    float ecr = map(this.dna.genes[10], 0, 1, 0, 255);
    float ecg = map(this.dna.genes[11], 0, 1, 0, 255);
    float ecb = map(this.dna.genes[12], 0, 1, 0, 255);
    
    float mcr = map(this.dna.genes[14], 0, 1, 0, 255);
    float mcg = map(this.dna.genes[15], 0, 1, 0, 255);
    float mcb = map(this.dna.genes[16], 0, 1, 0, 255);
    float mw = map(this.dna.genes[19], 0, 1, 20, cr/2);
    float mh = map(this.dna.genes[20], 0, 1, 5, 10);
    float mx = map(this.dna.genes[17], 0, 1, this.x + this.w/2 - mw, this.x + this.w/2 + mw);
    float my = map(this.dna.genes[18], 0, 1, this.y + this.w/2, this.y + this.w/2 + cr/2);
    
    noStroke();
    //Ellipse
    fill(ccr, ccg, ccb);
    ellipse(cx, cy, cr, cr);
    
    //Eyes
    fill(ecr, ecg, ecb);
    ellipse(e1x, e1y, er, er);
    ellipse(e2x, e2y, er, er);
    
    //Mouth
    fill(mcr, mcg, mcb);
    rect(mx, my, mw, mh);
    
    //BorderBox
    noFill();
    stroke(0);
    rect(this.index * this.w, 5, this.w, this.w);
  }
  
  void increaseFitness()
  {
    if (mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.w)
    {
      this.fitness += 0.25;
    }
  }
  
  void showFitness()
  {
     fill(0);
     textAlign(CENTER);
     textSize(18);
     text(floor(this.fitness), this.x + this.w/2, this.y + this.w + 15);
  }
  
}
