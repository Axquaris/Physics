
ArrayList<UIButton> setupNavbar() {
  ArrayList<UIButton> buttons = new ArrayList<UIButton>();
  
  int numLvls = 10;
  for (int i = 0; i < numLvls; i++) {
    buttons.add(new UIButton(1110, (800-10)/numLvls*i+10, 80, 800/numLvls-10, "LEVEL"+(i+1)));
  }
  
  return buttons;
}

void buttonPressed(String name) {
  println(name);
}

void sliderMoved(String name, double value) {
  println(name+" "+value);
}