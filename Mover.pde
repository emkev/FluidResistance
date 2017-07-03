

class Mover {
  
  PVector location ;
  PVector velocity ;
  PVector acceleration ;

  float r ;
  float lifespan ;
  float mass ;
  
  Mover( float lx , float ly , float m ) {
    location = new PVector( lx , ly ) ;
    velocity = new PVector(0 , 0) ;
    acceleration = new PVector(0 , 0) ;
    
    r = 8.0 ;
    lifespan = 255.0 ;
    mass = m ;
  }
    
  void run() {
    update();
    display();
  }
  
  void applyForce( PVector force ) {
    PVector f = force.get() ;
    f.div( mass ) ;
    acceleration.add( f );
  }
  
    
  void update() {
    velocity.add(acceleration);
    location.add(velocity);

    acceleration.mult(0);

    //lifespan -= 2.0;
  }


  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127 , 200);   
    ellipse(location.x , location.y , mass*16 , mass*16);
  }
 

  void checkEdge() {
    if( location.y > height ) {
      // a little  dampening when hitting the bottom
      velocity.y *= -0.9 ;
      location.y = height ;
    }
  }  
  
}
