
/* base on Daniel Shiffman 's code
   2017.07.02
*/

class Liquid {
  
  float LocX , LocY , wd , hg ;
  
  // coefficient of drag
  float coeff ;
  
  Liquid( float lx , float ly , float Qw , float Qh , float Qc ) {
    LocX  = lx ;
    LocY  = ly ;
    wd    = Qw ;
    hg    = Qh ;
    coeff = Qc ;
  }
  
  
  boolean contains( Mover m ) {
    PVector mLoc = m.location ;
    boolean isContain =     (mLoc.x > LocX) 
                         && (mLoc.x < LocX + wd)
                         && (mLoc.y > LocY)
                         && (mLoc.y < LocY + hg) ;
                         
    return isContain ;
  }
  
  
  PVector drag( Mover m ) {
    
    float speed = m.velocity.mag() ;
    float dragMagnitude = coeff * speed * speed ;
    
    // inverse of velocity
    PVector dragForce = m.velocity.get() ;
    dragForce.mult(-1);
    dragForce.normalize();
    
    dragForce.mult( dragMagnitude );
    
    return dragForce ;
  }
  
  
  void display() {
    noStroke();
    fill(50);
    rect( LocX , LocY , wd , hg ) ;
    
  }
  
}
