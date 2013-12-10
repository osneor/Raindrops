class Catcher {
  //declare variables and pvector
  int dl, dh;
  PVector cloc;


  Catcher() {
    //assign values to the variables and pvecores
    //d is diameter for l (length) and h (height)
    dl=80;
    dh=20;
    cloc=new PVector();
  } 

  void cshow() {
    //the catcher stays at the same height, but moves back and forth with the mouse
    cloc=new PVector(mouseX, height*6/7);
    ellipse(cloc.x, cloc.y, dl, dh);
  }
}

