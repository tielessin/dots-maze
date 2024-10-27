class Obstacle {
  int xPos;
  int yPos;
  int xSize;
  int ySize;


  Obstacle() {
  }

  //---------------------------------------------------------------------------------------------------------------------------

  // Old obstacles
  //void showObstacles(){
  //    outOfBound();
  //    obstacle(0,190,1410,20);
  //    obstacle(90,300,20,700);
  //    obstacle(190,210,20,690);
  //    obstacle(290,300,20,700);
  //    obstacle(390,210,20,690);
  //    obstacle(490,300,20,700);
  //    obstacle(590,210,20,690);
  //    obstacle(690,300,20,700);
  //    obstacle(790,210,20,690);
  //    obstacle(890,300,20,700);
  //    obstacle(990,210,20,690);
  //    obstacle(1090,300,20,700);
  //    obstacle(1190,210,20,690);
  //    obstacle(1290,300,20,700);
  //    obstacle(1390,210,20,690);
  //}

  // Hard Maze
  void showObstacles() {
    outOfBound();
    obstacle(0, 95, 50, 10);  // x, y, width, height
    obstacle(45, 95, 10, 450);
    obstacle(45, 545, 110, 10);
    obstacle(45, 145, 400, 10);
    obstacle(145, 245, 10, 305);
    obstacle(245, 145, 10, 160);
    obstacle(245, 395, 10, 160);
    obstacle(295, 245, 10, 210);
    obstacle(295, 245, 110, 10);
    obstacle(395, 245, 10, 310);
    obstacle(295, 445, 160, 10);
    obstacle(295, 545, 105, 10);
    obstacle(295, 545, 10, 10000);
    obstacle(295, 545, 10, 10000);
    obstacle(445, 445, 10, 10000);
    obstacle(445, 145, 10, 50);
    obstacle(445, 195, 50, 10);
    obstacle(495, 195, 10, 150);
    obstacle(495, 345, 50, 10);
    obstacle(545, 195, 10, 160);
    obstacle(545, 195, 50, 10);
    obstacle(595, 195, 10, 210);
    obstacle(495, 395, 150, 10);
    obstacle(495, 395, 10, 100);
    obstacle(495, 495, 150, 10);
    obstacle(645, 395, 10, 110);
    obstacle(695, 545, 50, 10);
    obstacle(745, 445, 10, 110);
    obstacle(745, 495, 1500, 10);
    obstacle(145, 95, 500, 10);
    obstacle(645, 95, 10, 200);
    obstacle(645, 295, 100, 10);
    obstacle(745, 295, 10, 100);
    obstacle(795, 195, 10, 100);
    obstacle(745, 195, 60, 10);
    obstacle(745, 45, 10, 150);
    obstacle(695, 45, 50, 10);
    obstacle(695, 0, 10, 50);
    obstacle(95, 0, 10, 100);
    obstacle(295, 50, 10, 50);
    obstacle(495, 0, 10, 50);
    
    // Closes path 1/2
    obstacle(145, 95, 10, 50);
    
    // // Closes path 2/2
    //obstacle(145, 0, 10, 100);
  }
  //----------------------------------------------------------------------------------------------------------------------------

  void obstacle(int xPos, int yPos, int xSize, int ySize) {
    fill(75, 75, 75);
    noStroke();
    rect(xPos, yPos, xSize, ySize);
    for (int i = 0; i < pop1.dots.length; i++) {
      if (pop1.dots[i].pos.x > xPos && pop1.dots[i].pos.x < xPos+xSize && pop1.dots[i].pos.y > yPos && pop1.dots[i].pos.y < yPos+ySize)
      {
        pop1.dots[i].dead = true;
      }
    }
    stroke(0);
  }

  //-----------------------------------------------------------------------------------------------------------------------------

  void outOfBound() {
    for (int i = 0; i < pop1.dots.length; i++) {
      if (pop1.dots[i].pos.x< 8|| pop1.dots[i].pos.y<8 || pop1.dots[i].pos.x>width-8 || pop1.dots[i].pos.y>height -8) {
        pop1.dots[i].dead = true;
      }
    }
  }
}
