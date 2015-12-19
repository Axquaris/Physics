import de.bezier.guido.*;

//GUI OBJECTS
ArrayList<UIButton> buttons;

void setup()  { 
  size(1200, 800); 
  
  Interactive.make(this);
  buttons = new ArrayList<UIButton>();
  ArrayList<UIButton> navbar = setupNavbar();
  for (UIButton b: navbar)
    buttons.add(b);
  println(buttons.size());
} 
 
void draw() { 
  background(200);
  rect(10, 1110, 140, 80);
}