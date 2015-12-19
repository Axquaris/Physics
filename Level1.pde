import fisica.*;
import java.lang.*;
import java.util.Timer;

public class Level1 extends Level
{
  FBox box;
  public float velocityInitial;
  public float mass;
  public float force;
  public float x;
  public float y;

  //public boolean complete;
  //public boolean startSim;

  long startTime = System.currentTimeMillis();
  long curTime = 0L;
  long elapsedTime = 0L;
  long goalTime = 5000;

  public Level1()
  {
    super();
    
    world = new FWorld();
    world.setEdges();
    world.setEdgesFriction(0);
    world.setGrabbable(true);
    world.setGravity(0, 1000);

    box = new FBox(50, 50);
    box.setPosition(100, 100);
    world.add(box);
    //FBox box2 = new FBox(50, 50);
    //box.setPosition(300,100);
    //world.add(box2);

    //Timer t = new Timer(1000, ).start();
    //t.setInitialDelay(1000);  
    //System.out.println("About to start test");
  }

  void updateLevel()
  {
    background(200); 

    fill(255, 0, 0, 251);
    rect(800, 552, 140, 44);

    world.step();
    world.draw();
    
    if (startSim)
        box.setVelocity(velocityInitial, 0);

      curTime = System.currentTimeMillis();
      elapsedTime = curTime - startTime;
      int timeSeconds = (int)(elapsedTime / 1000);

      x = box.getX();
      y = box.getY();

      println("X val: " + x + "Y val: " + y);

      //CRAPPY CHECK FOR CORNERS
      if (x == 804 && timeSeconds <= goalTime) {
        objectiveIsCompleted = true;
        println("Great Success");
        //SEND MESSAGE OF SUCCESS
      }

      println(timeSeconds + "seconds");
      if (timeSeconds > goalTime && !objectiveIsCompleted)
      {
        //SEND MESSAGE OBJECTIVE FAILED
      }
  }

  void reset()
  {
    box = new FBox(50, 50);
    box.setPosition(100, 100);
    world.add(box);
  }
}