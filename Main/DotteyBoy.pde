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
 
    DotteyBoy() {
        brain = new Brain(brainSize);
        size = 10;
        pos = new PVector(100, height-100);
        vel = new PVector(0,0);
        acc = new PVector(0,0);
        c = color(255, 255, 255);
    }
    
        
    //---------------------------------------------------------------------------------------
        
    // show all dots
    void show(){
        fill(c);
        if (brain.step > brain.lastStep - brain.prevMutations) {
            // indicate random mode
            // random mode = randomized instructions that replaced the instructions
            // which were exectured right before the death on previous run
            c = color(150, 150, 250);
        } 
        if (isBest){
            c = color(0, 180, 0);
        }
        ellipse(pos.x, pos.y, size, size);                
    }
    
    //---------------------------------------------------------------------------------------
    
    // move the dots
    void move(){
        
        reachedGoal();

        // test if the limit of steps has been reached
        if (brain.step >= brain.directions.length) {
            dead = true;
            brain.lastStep = brain.step;
        }
      
      // add the accleration to the dots
      if (!dead && !reachedGoal) {
                // set the acceleration according to directions array
                acc = brain.directions[brain.step];
                // go to next step index
                brain.step++;
            }
            else {
                dead = true;
                brain.lastStep = brain.step;
                vel = new PVector(0,0);
                acc = new PVector(0,0);
            }
            
            // apply acceleration and velocity to dot
            vel.add(acc);
            vel.limit(5);
            pos.add(vel);
            }
    //--------------------------------------------------------------------------------------
    
    void calFitness(){
        if (reachedGoal){
            fitness = pow(10,10)/(max(0,0001,pop1.maxSteps-pop1.minSteps))/(max(0.0001,brain.lastStep-pop1.minSteps));
        } else{
            float distGoal = dist(pos.x, pos.y, goal1.pos.x, goal1.pos.y);
            fitness = pow(10, 4) /*/ pow(distGoal, 2))*/ / max(0.1, cemQualFitDebuff);
        }
    }
    
    //--------------------------------------------------------------------------------------
    
  // create clones of more successful dots
  DotteyBoy gimmeBaby() {
    DotteyBoy baby = new DotteyBoy();
    baby.brain = brain.clone(); // babies have the same brain as their parents
    return baby;
  }
    
  //---------------------------------------------------------------------------------------
  
  void reachedGoal(){
    if (dist(pos.x, pos.y, goal1.pos.x, goal1.pos.y) < goal1.size/2+size/2){
      reachedGoal = true;
    } else {
      reachedGoal = false;
    }
  }
    
}    
