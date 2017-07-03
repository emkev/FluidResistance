
/* base on Daniel Shiffman 's code  
   2017.07.02
*/

Mover[] movers = new Mover[9] ;

Liquid liquid ;

// coefficient of drag of Liquid
float lqCo ;

void setup() {
  
  size( 640 , 360 ) ;
  
  reset() ;
  
  lqCo = 0.1 ;
  liquid = new Liquid( 0 , height/2 , width , height/2 , lqCo ) ;

}


void draw() {
  
  background(255);
  
  liquid.display() ;
  
  
  for( int i = 0 ; i < movers.length ; i++ ) {
    
    // a mover in Liquid ...
    if( liquid.contains(movers[i]) ) {
      PVector dragFrc = liquid.drag( movers[i] ) ;
      movers[i].applyForce( dragFrc ) ;
    }
    
    // apply gravity to movers
    PVector gravity = new PVector( 0 ,  0.1 * movers[i].mass ) ;
    movers[i].applyForce( gravity ) ;
    
    // movers moving
    movers[i].update() ;
    movers[i].display() ;
    movers[i].checkEdge() ;
    
  } // for( int i = 0 ; i < movers.length ; i++ ) {

  fill(0);
  text("click mouse to reset" , 10 , 30) ;
    
}


void mousePressed() {
  reset() ;
}

void reset() {
  for( int i = 0 ; i < movers.length ; i++ ) {
    movers[i] = new Mover( 40+i*70 , 0 , random(0.5,3) ) ;
  }
}


