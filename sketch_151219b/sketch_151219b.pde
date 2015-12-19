//We use the fisica Processing library, which is basically a wrapper on the Box2D Java Physics Engine.
import fisica.*;

//The physics manager
FWorld world;
FBox abox;
FBox bbox;
FBox mountpoint;
FCircle circle; 

//Now initialize the double pendulum.
void setup() {
  size(1100,600);
  smooth();
  //Get the physics engine online.
  Fisica.init(this); //do this first!

  //Now initialize the simulation tree ("FWorld")
  world = new FWorld();  
  world.setEdges(); //Bounded world
  //world.setGravity(0,9.8); //We don't need it - default is fine.
  world.setGrabbable(true);  //Bodies within can be mouse-interactive!

  FBox mountpoint = new FBox(5,5);
  mountpoint.setPosition(width/2,height/6);
  mountpoint.setStatic(true);
  mountpoint.setFill(0,0,0);
  mountpoint.setFriction(0);
  mountpoint.setRestitution(0);
  mountpoint.setGrabbable(false);
  world.add(mountpoint);
 
  FCircle circle = new FCircle(40);
  circle.setDensity(10);
  circle.setPosition(width/2,height/2+20);
  circle.setFill(190,120,120);
  circle.setNoStroke();
  circle.setFriction(0);
  circle.setGrabbable(true);
  world.add(circle);
  
  //Top rotation joint
  FRevoluteJoint junta = new FRevoluteJoint(circle,mountpoint,width/2,height/6);
  junta.setCollideConnected(false);
  world.add(junta);
  
  circle.setAngularVelocity(150);
}

//This function double-buffers the graphics output and steps the physics engine.
void draw() {
  background(55);
  world.step();
  if(circle!=null)
  
    circle.addForce(100,0);
  }
  world.draw();
}