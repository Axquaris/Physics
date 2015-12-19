import fisica.*;

FWorld world;
FBox box;
FBody object;

long startTime = System.currentTimeMillis();
long curTime = 0L;
long elapsedTime = 0L;

FBody target;
float force;
float magnitude;
float direction;

boolean drawLine;

void setup()
{
  size(1100, 600);
  Fisica.init(this);

  world = new FWorld();
  world.setEdges();
  world.setEdgesFriction(0);
  world.setGravity(0, 0);

  object = new FCircle(50);
  object.setFriction(0);
  object.setPosition(100, 100);
  object.setGrabbable(false);
  world.add(object);
  
}

void draw()
{
  background(200);

  curTime = System.currentTimeMillis();
  elapsedTime = curTime - startTime;
  int timeSeconds = (int)(elapsedTime / 1000);

  world.step();
  world.draw();
  
  if(drawLine)
  {
    line(target.getX(), target.getY(), mouseX, mouseY);
  }
}

float x1;
float x2;
float y1;
float y2;

void mousePressed()
{
  x1 = mouseX;
  y1 = mouseY;
  
  if(world.getBody(x1, y1) != null)
  {
   target = world.getBody(x1, y1);
   x1 = target.getX();
   y1 = target.getY();
   drawLine = true;
  }
  else
  {
    drawLine = false;
    target = null;
    FBody circle = new FCircle(random(30, 80));
    circle.setPosition(mouseX, mouseY);
    circle.setFriction(0);
    circle.setGrabbable(false);
    world.add(circle);
  }
  //FBody target = world.getBody(x1, y1);
  println(target);
  println(x1, y1);
}

void mouseDragged()
{
 //box = new FBox(50, 50);
 //box.setPosition(mouseX, mouseY);
 //world.add(box);
x2 = mouseX;
y2 = mouseY;
magnitude = (float) Math.sqrt(Math.pow(y2 - y1, 2) + Math.pow(x2 - x1, 2));
  
println(magnitude);
}

void mouseReleased()
{
  x2 = mouseX;
  y2 = mouseY;
  
  magnitude = (float) Math.sqrt(Math.pow(y2 - y1, 2) + Math.pow(x2 - x1, 2));
  //float rotation = (float) Math.toDegrees(Math.atan2(x2 - x1, y2 - y1));
  //PVector v = PVector.fromAngle(rotation);
  PVector v = new PVector(x2 - x1, y2 - y1);
  
  if(target != null) {
    v.rotate(target.getRotation());
    target.addForce(v.x * magnitude * 10, v.y * magnitude * 10);
  }
  drawLine = false;
}