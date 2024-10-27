class Brain{
    PVector[] directions;
    float randomAngle;
    int step = 0;
    int lastStep;
    //Number of steps before death affected by specific mutation
    int prevMutations;
  
    Brain(int size){
        directions = new PVector[size];
        randomize();
    }
    
//--------------------------------------------------------------------
    
    void randomize(){
        for(int i = 0; i < directions.length; i++){
            randomAngle = random(2*PI);
            directions[i] = PVector.fromAngle(randomAngle);
        }
    }

//---------------------------------------------------------------------

    //returns a perfect copy of this brain object
    Brain clone() {
      Brain clone = new Brain(directions.length);
      for (int i = 0; i < directions.length; i++) {
        clone.directions[i] = directions[i].copy();


      }
      clone.lastStep = lastStep;
      return clone;
    }

//--------------------------------------------------------------------

    void mutate(boolean reachedGoal){
        //General probability for mutation
        float mutationRate = 0.01;
        //General intensity of mutation
        float mutationInt = 0.02;
        //Probability for specific mutation
        float prevMutationRate = 1;
        prevMutations = min(lastStep,12);
        
        if(pop1.goalWasReached){
        //randomly changes some instructions
            for(int i = 0; i < directions.length; i++){              //i = 1; because 0 is the best of the last run and should stay the same
                float rand = random(1);
                if(rand < mutationRate){
                    //slighly adjust direction
                    directions[i].x += random(-mutationInt,mutationInt);
                    directions[i].y += random(-mutationInt,mutationInt);
                    //prevent number from going above 1 or below -1
                    if(directions[i].x > 1){directions[i].x = 1;}
                    if(directions[i].x < -1){directions[i].x = -1;}
                    if(directions[i].y > 1){directions[i].y = 1;}
                    if(directions[i].y < -1){directions[i].y = -1;}                                                                                                  //println("Phase 2 inizialized...");
                }
            }
        }else{
            //Specifically mutate instructions before death
            for(int i = prevMutations; i >= 0; i--){
                float rand = random(1);
                if(rand < prevMutationRate){
                    float randomAngle = random(2*PI);
                    directions[lastStep-i] = PVector.fromAngle(randomAngle);
                }
            }
        }
    }
}
