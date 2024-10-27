Population pop1;
Goal goal1;
Obstacle obs1;
CemGrid grid1;
int xSquares;
int ySquares;
int brainSize;
                                                                //int timer; int lastGenTime;
 
void setup(){
    size(1500,1000, P2D);
    frameRate(300);
    xSquares = 30;    //has to divide the width into a whole number
    ySquares = 20;    //has to divide the height into a whole number
    brainSize = 5000;
    pop1 = new Population(2000);
    goal1 = new Goal();
    obs1 = new Obstacle();
    grid1 = new CemGrid();
    
}
 
void draw(){
    background(0);
    grid1.showGrid();
    showText();
  
    if (!pop1.allDotsDead()){
        obs1.showObstacles();
        pop1.move();
        pop1.show();
        goal1.show();
    } else{
        
        if(!pop1.goalWasReached){grid1.refreshGrid();}            //only refresh grid before anyone reached goal
        pop1.minMaxSteps();
        pop1.dotsReachedGoal();
        pop1.calculateFitness();
        pop1.naturalSelection();
        pop1.mutateDemBabies();
    }
}

//------------------------------------------------------------------------------------------

    void showText(){
      textSize(30);
      textAlign(LEFT,TOP);
      fill(0);
      text("Generation: " + pop1.gen, 20, 20);
      
      textSize(15);
      textAlign(RIGHT,TOP);
      text("Dots alive: " +pop1.dotsAlive, width-20,20);
      text("Dots reached: " +pop1.dotsReachedGoal, width-20,50);
      if(pop1.minSteps != brainSize){
        text("Least Steps: " +pop1.minSteps, width-20,80);
        text("Most Steps: " +pop1.maxSteps, width-20,110);
    }
    }

//------------------------------------------------------------------------------------------
