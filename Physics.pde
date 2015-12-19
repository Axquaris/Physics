
import fisica.*;

 Level l;

void setup()
{
  size(1000,700);
  Fisica.init(this);
  l = new Level2Test(); 
}


void draw()
{
  background(200,100,33);
  l.updateLevel();
}