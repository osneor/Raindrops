Raindrops[] drop = new Raindrops[30];

int index = 0;
int currenttime;
int oldtime=0;
int timediff=0;

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

  fill(255, 255);
  strokeWeight(3);
  noFill();
  rect(450, 100, 100, 100);
  strokeWeight(1);

  textSize(50);
  text(score, 50, 50);

  fill(255);
  c1.cshow();

  currenttime=millis();
  timediff=currenttime - oldtime;
  if (timediff >= 3000) {
    index++;

    oldtime=currenttime;
  }

  fill(255, 150);
  for (int i = 0; i < index; i++) {
    drop[i].show();
    drop[i].move();
    drop[i].comeback();
    if (drop[i].catchit(c1)) {
      score+=round(drop[i].s);
    }
  }
}

