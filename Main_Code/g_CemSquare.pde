// Cementary square to keep track of Cementary Quality
class CemSquare{
    PVector size;
    PVector pos;
    color c;
    float cemQual;
    
    CemSquare(){
    size = new PVector(width/xSquares, height/ySquares);
    pos = new PVector(0, 0);
    c = color(140,250,140);
    cemQual = 0;
    }
    
//-----------------------------------------------------------------------

    void refreshSquare(){
        adjustCemQual();
        squareColor();
                                                                  //println("cemQual: " + cemQual);
    }

//------------------------------------------------------------------------

    void adjustCemQual(){
       float addedCemQual = 0; 
       for(int i = 0; i < pop1.dots.length; i++){
            if(pop1.dots[i].pos.x > pos.x && pop1.dots[i].pos.x < pos.x+size.x && pop1.dots[i].pos.y > pos.y && pop1.dots[i].pos.y < pos.y+size.y){
                pop1.dots[i].cemQualFitDebuff = cemQual;
                addedCemQual += 1;
            }
            
        }
        cemQual += addedCemQual;
    }

//-------------------------------------------------------------------------

    void squareColor(){
        if(cemQual != 0){
            c = color(255,
                      255-(255*(cemQual-grid1.minCemQual)/(grid1.maxCemQual-grid1.minCemQual)),
                      255-(255*(cemQual-grid1.minCemQual)/(grid1.maxCemQual-grid1.minCemQual)));
        }
    }

//---------------------------------------------------------------------------

    void show(){
      fill(c);
      rect(pos.x,pos.y,size.x,size.y);
    }
}
