//creates and Manages CemSquares
class CemGrid{

    CemSquare[] squares;
    
    float minCemQual;
    float maxCemQual;
    
    CemGrid(){
        squares = new CemSquare[xSquares*ySquares+1];
        for(int i = 1; i < squares.length; i++){
            squares[i] = new CemSquare();
        }
        positioning();
    }
    
//----------------------------------------------------------------------

    void positioning(){
        float x = 0;
        float y = 0;
        int i = 1;
        while(y < ySquares){
            x = 0;
            while(x < xSquares){
                squares[i].pos.x = x*squares[i].size.x;
                squares[i].pos.y = y*squares[i].size.y;
                x++;
                i++;
            }
            y++;
        }
    }
    
//----------------------------------------------------------------------
    
    void showGrid(){
        noStroke();
        for(int i = 1; i < squares.length; i++){
            squares[i].show();
        }
        stroke(0);
    }
        
//----------------------------------------------------------------------
        
    void refreshGrid(){
        for(int i = 1; i < squares.length; i++){
            squares[i].refreshSquare();
        }
        minCemQual = minCemQual();
        maxCemQual = maxCemQual();
    }
//---------------------------------------------------------------------

    float minCemQual(){
      float minCemQual = 0;
      for(int i = 1; i < squares.length; i++){
          if(squares[i].cemQual < minCemQual){
              minCemQual = squares[i].cemQual;
          }
      }
      return minCemQual;
    }
    
//---------------------------------------------------------------------

    float maxCemQual(){
      float maxCemQual = 1;
      for(int i = 1; i < squares.length; i++){
          if(squares[i].cemQual > maxCemQual){
              maxCemQual = squares[i].cemQual;
          }
      }
      return maxCemQual;
    }

}
