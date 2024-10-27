


class DotteyBoy{
    Brain brain;
    float size;
    PVector pos;
    PVector vel;
    PVector acc;
    int spdMax = 5;
    color c;
    boolean dead;
    boolean reachedGoal;
    boolean isBest;
    float fitness;
    float cemQualFitDebuff;
 
    DotteyBoy(){
        brain = new Brain(brainSize);
        size = 10;
        pos = new PVector(50, height-50);
        vel = new PVector(0,0);
        acc = new PVector(0,0);
        c = color(random(255,255), random(255,255), random(255,255));
        }
    
        
    //---------------------------------------------------------------------------------------
        
    //show all dots
    void show(){
        
        fill(c);
        if(brain.step > brain.lastStep-brain.prevMutations){c = color(200,200,200);}
        if(isBest){c = color(0,180,0);}
        ellipse(pos.x,pos.y,size,size);                
    }
    
    //---------------------------------------------------------------------------------------
    
    // Move dot
    void move(){
        
        reachedGoal();         //reached goal testing

        if(brain.step >= brain.directions.length){
            dead = true;
            brain.lastStep = brain.step;
        }                                      //test if out of steps
      
      if(!dead && !reachedGoal){                                                                  //select direction from array
                //Change acceleration according to directions array
                acc = brain.directions[brain.step];
                //go to next instruction
                brain.step++;
            }
            else{
                dead = true;
                brain.lastStep = brain.step;
                vel = new PVector(0,0);
                acc = new PVector(0,0);
            }
            
            //Apply acceleration and velocity to dot
            vel.add(acc);
            vel.limit(8);
            pos.add(vel);
            }
    //--------------------------------------------------------------------------------------
    
    void calFitness(){
        if (reachedGoal){
            fitness = pow(10,10)/(max(0,0001,pop1.maxSteps-pop1.minSteps))/(max(0.0001,brain.lastStep-pop1.minSteps));
        }else{
            float distGoal = dist(pos.x, pos.y, goal1.pos.x, goal1.pos.y);
            fitness = pow(10,4) /*/ pow(distGoal, 2))*//max(0.1,cemQualFitDebuff);
        }
    }
    
    //--------------------------------------------------------------------------------------
    
  //clone it 
  DotteyBoy gimmeBaby() {
    DotteyBoy baby = new DotteyBoy();
    baby.brain = brain.clone();//babies have the same brain as their parents
    return baby;
  }
    
  //---------------------------------------------------------------------------------------
  
  void reachedGoal(){
    if(dist(pos.x, pos.y, goal1.pos.x, goal1.pos.y) < goal1.size/2+size/2){
      reachedGoal = true;
    }else{
      reachedGoal = false;
    }
  }
    
}    
    




    
