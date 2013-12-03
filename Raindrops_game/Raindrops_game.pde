Raindrops[] drop = new Raindrops[300];
//Snow s1,s2,s3;
Catcher c1;
float score;

void setup() {
  size(600, 600);

  for (int i = 0; i < drop.length; i++) {
    drop[i] = new Raindrops();
  }

  c1=new Catcher();
}

void draw() {
  background(0, 50, 100);
  textSize(50);
  text(score, 50, 50);
  c1.cshow();
  fill(255,150);
  for (int i = 0; i < drop.length; i++) {
    drop[i].show();
    drop[i].move();
    drop[i].comeback();
    if (drop[i].catchit(c1)) {
      score+=drop[i].d;
    }
  }
  fill(255,255);
  rect(width,height,0,0);
}

