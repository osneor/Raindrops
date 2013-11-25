Raindrops[] drop = new Raindrops[300];
//Snow s1,s2,s3;
Catcher c1;

void setup() {
  size(600,600);
  
  for (int i = 0; i < drop.length; i++) {
    drop[i] = new Raindrops();
  }
  
  c1=new Catcher();
}

void draw() {
  background(0,50,100);
  c1.cshow();
  for (int i = 0; i < drop.length; i++) {
    drop[i].show();
    drop[i].move();
    drop[i].comeback();
    drop[i].catchit(c1);
  }
  
  
}

