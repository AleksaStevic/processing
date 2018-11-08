class DNA {
  
  float[] genes;
  
  DNA(float[] genes) {
    this.genes = genes;
  }
  
  DNA crossover(DNA partnerDNA)
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
  
  void mutate(float prob)
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
