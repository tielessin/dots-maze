


class Population{
    DotteyBoy[] dots;
    
    int gen = 1;
    float fitnessSum;
    int minSteps = 1;
    int maxSteps = 1;
    int dotsAlive;
    int dotsReachedGoal;
    boolean goalWasReached;
  
    Population(int size){
        dots = new DotteyBoy[size];
        for(int i = 0; i < dots.length; i++){
            dots[i] = new DotteyBoy();
        }
    }
    
    //---------------------------------------------------------------
    
    void move(){
        obs1.outOfBound();
        for(int i = 0; i < dots.length; i++){
            dots[i].move();
            
        }
        dotsAlive();
        dotsReachedGoal();
    }
    
    //-------------------------------------------------------------
    
    //show all dots
    void show(){
        for(int i = 1; i < dots.length; i++){
            dots[i].show();
        }
        dots[0].show();
    }
    
    //--------------------------------------------------------------
    
    boolean allDotsDead(){
        for(int i = 0; i < dots.length; i++){
            if(!dots[i].dead && !dots[i].reachedGoal){
                return false;
            }
        }
        return true;
    }
    
    //-----------------------------------------------------------
    
    void calculateFitness(){
        for(int i = 0; i < dots.length; i++){
            dots[i].calFitness();
                                                                                  /*println("Dot " +i +": " +dots[i].fitness);
                                                                                  println(dots[i].isBest);
                                                                                  println(""); */
        }
    }
    
    //-----------------------------------------------------------
    
    void calculateFitnessSum(){
        fitnessSum = 0;
        for(int i = 0; i < dots.length; i++){          //sum up all Fitness values
            fitnessSum += dots[i].fitness;    
        }
    }
  
  //-------------------------------------------------------------
  
  int returnBest(){
    int best = 0;
    for(int i = 0; i < dots.length; i++){
      dots[i].isBest = false;
      if(dots[i].fitness > dots[best].fitness){
        best = i;
      }
    }
    dots[best].isBest = true;
    return best;
  }
    
    
  //--------------------------------------------------------------
    
  void naturalSelection() {
      DotteyBoy[] newDots = new DotteyBoy[dots.length];//next gen
      calculateFitnessSum();
      
      DotteyBoy parent = dots[returnBest()];
      newDots[0] = parent.gimmeBaby();
      for (int i = 1; i< newDots.length; i++) {
          //select parent based on fitness
          parent = selectParent();
    
          //get baby from them
          newDots[0] = parent.gimmeBaby();
          newDots[i] = parent.gimmeBaby();
      }

      dots = newDots.clone();
      dots[0].isBest = true;
      gen ++;
  }
    
    //--------------------------------------------------------------
    
  DotteyBoy selectParent() {
    float rand = random(fitnessSum);


    float runningSum = 0;

    for (int i = 0; i< dots.length; i++) {
      runningSum+= dots[i].fitness;
      if (runningSum > rand) {
        return dots[i];
      }
    }

    //should never get to this point

    return null;
  }
    
    //--------------------------------------------------------------
    
    void mutateDemBabies(){
        for(int i = 1; i < dots.length; i++){
            dots[i].brain.mutate(dots[i].reachedGoal);
        }
    }
    
//---------------------------------------------------------------------    
    
    
    void minMaxSteps(){
        minSteps = brainSize;
        maxSteps = 0;
        for(int i = 1; i < dots.length; i++){
            if(dots[i].reachedGoal){
                if(dots[i].brain.lastStep > maxSteps){maxSteps = dots[i].brain.lastStep;}
                if(dots[i].brain.lastStep < minSteps){minSteps = dots[i].brain.lastStep;}
            }
        }
    }    
    
    //----------------------------------------------------------------------
    
    //Amount of alive dots
    void dotsAlive(){
      dotsAlive = dots.length;
      int alive = 0;
      for(int i = 0; i < dots.length; i++){
        if(!dots[i].dead){alive++;}
      }
      dotsAlive = alive;
    }

    //-------------------------------------------------------------------------------

    //Dots that reached the Goal
    void dotsReachedGoal(){
      dotsReachedGoal = dots.length;
      int reachedGoal = 0;
      for(int i = 0; i < dots.length; i++){
        if(dots[i].reachedGoal){reachedGoal++;}
      }
      dotsReachedGoal = reachedGoal;
      if (dotsReachedGoal > 0){
        goalWasReached = true;
        
      }
    }
    
    //---------------------------------------------------------------------------
    
}
