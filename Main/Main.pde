Population pop1;
Goal goal1;
Obstacle obs1;
CemGrid grid1;
int xSquares;
int ySquares;
int brainSize;
int timer;
 
void setup(){
    size(900,600, P2D);
    frameRate(30);
    xSquares = 18;    // has to be divisible by the width
    ySquares = 12;    // has to be divisible by the height
    brainSize = 5000;
    pop1 = new Population(500);
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
    } else {
        
        if (!pop1.goalWasReached){grid1.refreshGrid();}  // only refresh grid until a dot reached goal
        pop1.minMaxSteps();
        pop1.dotsReachedGoal();
        pop1.calculateFitness();
        pop1.naturalSelection();
        pop1.mutateDemBabies();
    }
}

//------------------------------------------------------------------------------------------

void showText() {
    textSize(15);
    textAlign(RIGHT,TOP);
    fill(0);
    text("Generation: " + pop1.gen, width-20, 20);
    
    textSize(15);
    textAlign(RIGHT,TOP);
    text("Dots alive: " + pop1.dotsAlive, width-20, 50);
    text("Dots in goal: " + pop1.dotsReachedGoal, width-20, 80);
    if (pop1.minSteps != brainSize) {
        text("Least Steps: " + pop1.minSteps, width-20, 110);
        text("Most Steps: " + pop1.maxSteps, width-20, 140);
    }
}
