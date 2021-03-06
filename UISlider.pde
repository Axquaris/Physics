public class UiSlider
{
  float x, y, width, height;
  float valueX, value;
  float min, max;
  color bar;
  color button;
  float buttonW;
  String name;
  
  public UiSlider ( float xx, float yy, float ww, float hh, float min, float max, float value, String name) 
  {
    x = xx; 
    y = yy; 
    width = ww; 
    height = hh;
    
    this.min = min;
    this.max = max;
    this.value = value;
    
    if (max-min < 1)
      buttonW = height*2.5;
    else
      buttonW = height;
      
    valueX  = map( value, min, max, x, x+width-buttonW );
    
    // register it
    Interactive.add( this );
    
    bar = color(128);
    button = color(190);
    this.name = name;
  }
  
  //Called by manager
  void mouseDragged ( float mx, float my ) { update(mx, my); }
  void mousePressed ( float mx, float my ) { update(mx, my); }
  void mouseReleased () {
    sliderMoved(name, getValue());
  }
  
  //Called when mouse clicked or dragged
  void update ( float mx, float my ) {
    valueX = mx - buttonW/2;
    
    if ( valueX < x ) valueX = x;
    if ( valueX > x+width-buttonW ) valueX = x+width-buttonW;
    
    value = getValue();
  }
  
  public void draw () 
  {
    float f = 0.75; //How much smaller rail bar is
    stroke(0);
    fill( bar );
    strokeWeight(1);
    rect(x, y + (1-f)*height/2, width, height*f );
    
    stroke(0);
    fill( button );
    rect( valueX, y, buttonW , height );
    
    textSize( 20 );
    textAlign( CENTER, CENTER );
    fill(0);
    if (max-min < 1)
      text(value, valueX+buttonW/2, y+height/2);
    else
      text( (int)value, valueX+buttonW/2, y+height/2);
  }
  
  //Specific cases
  float getValue() {
    float v = map( valueX, x, x+width-buttonW, min, max );
    if (min == 0.99)
      return round(v*10000)/10000;
    else if (max-min <= 1)
      return round(v*1000)/1000;
    else
      return round(v);
  }
}