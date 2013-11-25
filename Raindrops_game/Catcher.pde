class Catcher {
  int dl, dh;
  PVector cloc;
  PVector cmouse;

  Catcher() {
    dl=60;
    dh=10;
   
    
  } 

  void cshow() {
    cloc=new PVector(mouseX, height*3/4);
    ellipse(cloc.x, cloc.y, dl, dh);
  }
//  void capooyah(Raindrops l){
//   if(cloc.dist(l)>dh+d){
//   loc.set(random(width),0);
//   }
//  }
}

