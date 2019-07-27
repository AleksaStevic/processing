class Population
{
  Face[] faces;
  
  Population()
  {
    this.faces = new Face[10];
  }
  
  void generate()
  {
    for (int i = 0; i < 10; i++)
    {
      this.faces[i] = new Face(i);
    }
  }
  
  void generate(boolean again)
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
  
  void show()
  {
    for (int i = 0; i < 10; i++)
    {
      this.faces[i].show();
    }
  }
  
  Face selectBest()
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
