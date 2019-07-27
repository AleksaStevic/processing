Population pop;
float mutationRate;

void setup() {
  size(1280, 720);
  pop = new Population();
  pop.generate();
  mutationRate = 0.1;
}

void draw() {
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
  text("Press the K key to increase mutation rate and L key on the numpad to decrease it. Current mutation rate: " + (Math.round(mutationRate * 100.0) / 100.0) + "%", 10, 230);
}

void keyPressed()
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
    mutationRate += 0.01;
    println(mutationRate);
  }
  
  if (key == 'l')
  {
    mutationRate -= 0.01;
  }
}
