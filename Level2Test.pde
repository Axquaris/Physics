
public class Level2Test extends Level
{
  
  final int TOP_RAMP = 600; 
  final int MAX_DENSITY = 100; 
  FLine line1; 
  FBody circle; 
  
  public Level2Test()
  {
    FWorld world = new FWorld(); 
    world.setGravity(0,5000);
    world.setEdges();
    circle = new FCircle(40); 
    circle.setPosition(500,500);
    line1 = new FLine(0,100,300,500);
    FBody line2 = new FLine(300,500,400,550);
    FBody line3 = new FLine(400,550,500,520);
    world.add(circle);
    world.add(line1);
    world.add(line2); 
    world.add(line3);
    super.world = world;
  }
  
  void updateLevel()
  {
    if(world!=null)
    {
      world.step();
      world.draw(); 
    }
  }
  
  void reset()
  {
  }
  
  void changeRampHeight(int scale)
  {
    line1.setStart(0,TOP_RAMP/scale);
  }
  
  void changeDensity(int scale)
  {
    circle.setDensity(MAX_DENSITY/scale);
  }
  
    
 }
  