class Obstacle{
    int xPos;
    int yPos;
    int xSize;
    int ySize;
    
    
    Obstacle(){
    
    }

//---------------------------------------------------------------------------------------------------------------------------

    void showObstacles(){
        outOfBound();
        obstacle(0,190,1410,20);
        obstacle(90,300,20,700);
        obstacle(190,210,20,690);
        obstacle(290,300,20,700);
        obstacle(390,210,20,690);
        obstacle(490,300,20,700);
        obstacle(590,210,20,690);
        obstacle(690,300,20,700);
        obstacle(790,210,20,690);
        obstacle(890,300,20,700);
        obstacle(990,210,20,690);
        obstacle(1090,300,20,700);
        obstacle(1190,210,20,690);
        obstacle(1290,300,20,700);
        obstacle(1390,210,20,690);
    }
    
//----------------------------------------------------------------------------------------------------------------------------
  
    void obstacle(int xPos,int yPos,int xSize,int ySize){
        fill(75,75,75);
        noStroke();
        rect(xPos, yPos, xSize, ySize);
        for(int i = 0; i < pop1.dots.length; i++){
            if(pop1.dots[i].pos.x > xPos && pop1.dots[i].pos.x < xPos+xSize && pop1.dots[i].pos.y > yPos && pop1.dots[i].pos.y < yPos+ySize)
            {pop1.dots[i].dead = true;}
        }
        stroke(0);
    }

//-----------------------------------------------------------------------------------------------------------------------------

    void outOfBound(){
        for(int i = 0; i < pop1.dots.length; i++){
        if (pop1.dots[i].pos.x< 8|| pop1.dots[i].pos.y<8 || pop1.dots[i].pos.x>width-8 || pop1.dots[i].pos.y>height -8){
              pop1.dots[i].dead = true;
              }
        }
    }

}
