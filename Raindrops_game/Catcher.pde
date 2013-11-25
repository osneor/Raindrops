class Catcher {
  int dl, dh;
  PVector cloc;
  PVector cmouse;

  Catcher() {
    dl=60;
    dh=10;
   cloc=new PVector();
    
  } 

  void cshow() {
    cloc=new PVector(mouseX, height*6/7);
    ellipse(cloc.x, cloc.y, dl, dh);
  }
}

