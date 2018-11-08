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

Population pop;
float mutationRate;

public void setup() {
  
  pop = new Population();
  pop.generate();
  mutationRate = 0.1f;
}

public void draw() {
  background(255);
  pop.show();
  
  for (int i = 0; i < 10; i++)
  {
    pop.faces[i].increaseFitness();
    pop.faces[i].showFitness();
  }
  
  //mutationRate += 0.01;
  
  textAlign(LEFT);
  text("To make a new random population press: S", 10, 170);
  text("To make a new generation press: G", 10, 190);
  text("Rate faces by hovering with mouse over them.", 10, 210);
  text("Press the K key to increase mutation rate and L key on the numpad to decrease it. Current mutation rate: " + (Math.round(mutationRate * 100.0f) / 100.0f) + "%", 10, 230);
}

public void keyPressed()
{
  if (key == 'g')
  {
    pop.generate(true);
  }
  
  if (key == 's')
  {
    pop.generate();
  }
  
  if (key == 'k')
  {
    mutationRate += 0.01f;
    println(mutationRate);
  }
  
  if (key == 'l')
  {
    mutationRate -= 0.01f;
  }
}
class DNA {
  
  float[] genes;
  
  DNA(float[] genes) {
    this.genes = genes;
  }
  
  public DNA crossover(DNA partnerDNA)
  {
    float[] newGenes = new float[21];
    int randomMidpoint = floor(random(21));
    
    for (int i = 0; i < 21; i++)
    {
      if (i > randomMidpoint)
      {
        newGenes[i] = partnerDNA.genes[i];
      }
      else
      {
        newGenes[i] = this.genes[i];
      }
    }
    
    return new DNA(newGenes);
  }
  
  public void mutate(float prob)
  {
    for (int i = 0; i < 21; i++)
    {
      if (random(1) < prob)
      {
        this.genes[i] = random(1);
      }
    }
  }
}
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
  
  public void show() {
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
  
  public void increaseFitness()
  {
    if (mouseX > this.x && mouseX < this.x + this.w && mouseY > this.y && mouseY < this.y + this.w)
    {
      this.fitness += 0.25f;
    }
  }
  
  public void showFitness()
  {
     fill(0);
     textAlign(CENTER);
     textSize(18);
     text(floor(this.fitness), this.x + this.w/2, this.y + this.w + 15);
  }
  
}
class Population
{
  Face[] faces;
  
  Population()
  {
    this.faces = new Face[10];
  }
  
  public void generate()
  {
    for (int i = 0; i < 10; i++)
    {
      this.faces[i] = new Face(i);
    }
  }
  
  public void generate(boolean again)
  {
    if (again)
    {
      for (int i = 0; i < 10; i++)
      {
        Face parentA = this.selectBest();
        Face parentB = this.selectBest();
        DNA childDna = parentA.dna.crossover(parentB.dna);
        childDna.mutate(mutationRate);
        this.faces[i] = new Face(i, childDna);
      }
    }
  }
  
  public void show()
  {
    for (int i = 0; i < 10; i++)
    {
      this.faces[i].show();
    }
  }
  
  public Face selectBest()
  {
    float maxFitness = this.faces[0].fitness;
    for (int i = 1; i < 10; i++)
    {
      if (this.faces[i].fitness > maxFitness)
      {
        maxFitness = this.faces[i].fitness;
      }
    }
    
    while(true)
    {
       int index = floor(random(10));
       float prob = random(maxFitness);
       if (prob <= this.faces[index].fitness)
       {
         return this.faces[index];
       }
    }
  }
}
  public void settings() {  size(1280, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
