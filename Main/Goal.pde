class Goal{
  int size;
  PVector pos;
  color c;
  
    Goal(){
      size = 30;
      pos = new PVector(50,100);
      c = color(150,0,220);
    }
    
    void show(){
        fill(c);
        ellipseMode(CENTER);
        ellipse(pos.x,pos.y,size,size);
    }
}
